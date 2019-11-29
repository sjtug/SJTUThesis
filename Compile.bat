@echo off
chcp 65001 >nul

set THESIS=thesis

set flag=%1
if %flag%x == x (
	set flag=thesis
)

if %flag%x == thesisx (
	call :cleanall
	call :thesis	
	if ERRORLEVEL 1 (
		echo Error! Please check the 'thesis.log' for more details...
		pause
	) else (
		call :clean
		echo Finished!
	)
	goto :EOF
)

if %flag%x == cleanx (
	call :clean
	goto :EOF
)

if %flag%x == cleanallx (
	call :cleanall
	goto :EOF
)

if %flag%x == wordcountx (
	call :wordcount
	goto :EOF
)

:help
	echo This is the compile batch script for SJTUThesis.
	echo Usage:
	echo     compile.bat [option]
	echo options:
	echo   thesis    Compile the thesis (default)
	echo   clean     Clean all work files
	echo   cleanall  Clean all work files and thesis.pdf
	echo   wordcount Count words in thesis.pdf
	echo   help      Print this help message
goto :EOF

:thesis
	echo Compile...
	latexmk -xelatex -quiet -file-line-error -halt-on-error -interaction=nonstopmode thesis >nul 2>nul
goto :EOF

:clean
	echo Clean files...
	latexmk -c -silent 2>nul
	del tex\*.aux >nul 2>nul
goto :EOF

:cleanall
	echo Clean files...
	latexmk -C -silent 2>nul
	del tex\*.aux >nul 2>nul
	if exist thesis.pdf (
		echo Close the file: thesis.pdf!
		pause
		call :cleanall
	)
goto :EOF

:wordcount
	set found=0
	setlocal enabledelayedexpansion

	findstr "\\documentclass\[[^\[]*english" %THESIS%.tex > nul
	if %errorlevel% equ 0 (
		for /f "delims=" %%i in ('texcount %THESIS%.tex -inc -char-only  2^>nul') do (
			if !found! equ 1 (
				echo 英文字符数:		!%%i!
				goto :total
			)
			echo %%i | findstr "total" > nul && set found=1
		)
	) else (
		for /f "delims=" %%i in ('texcount %THESIS%.tex -inc -ch-only  2^>nul') do (
			if !found! equ 1 (
				echo 纯中文字数:		!%%i!
				goto :total
			)
			echo %%i | findstr "total" > nul && set found=1
		)
	)

:total
	set found=0
	for /f "delims=" %%i in ('texcount %THESIS%.tex -inc -chinese 2^>nul') do (
		if !found! equ 1 (
			echo 总字数^(英文单词+中文字^):!%%i!
			goto :EOF
		)
		echo %%i | findstr "total" > nul && set found=1
	)
goto :EOF
