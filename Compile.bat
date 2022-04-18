@echo off

chcp 65001 >nul

call :setESC

set THESIS=main

set flag=%1
if %flag%x == x (
	set flag=thesis
)

if %flag%x == thesisx (
	call :cleanall
	call :thesis	
	if ERRORLEVEL 1 (
		echo.
		echo %ESC%[31mError! Please check the %ESC%[7m'%THESIS%.log'%ESC%[0;31m for more details . . .%ESC%[0m
		pause
	) else (
		call :clean
		echo %ESC%[32mFinished!%ESC%[0m
		pause
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
	echo %ESC%[33mThis is the compile batch script for SJTUThesis.
	echo Usage:
	echo     compile.bat [option]
	echo options:
	echo   thesis    Compile the thesis (default)
	echo   clean     Clean all work files
	echo   cleanall  Clean all work files and main.pdf
	echo   wordcount Count words in main.pdf
	echo   help      Print this help message%ESC%[0m
goto :EOF

:thesis
	echo %ESC%[33mCompile . . .%ESC%[0m
	latexmk -quiet -file-line-error -halt-on-error -interaction=nonstopmode %THESIS% 2>nul
goto :EOF

:clean
	echo %ESC%[33mClean files . . .%ESC%[0m
	latexmk -quiet -c %THESIS% 2>nul
goto :EOF

:cleanall
	echo %ESC%[33mClean files . . .%ESC%[0m
	latexmk -quiet -C %THESIS% 2>nul
	if exist %THESIS%.pdf (
		echo %ESC%[31mClose the file: %ESC%[7m'%THESIS%.pdf'%ESC%[0;31m!%ESC%[0m
		pause
		call :cleanall
	)
goto :EOF

:wordcount
	set found=0
	setlocal enabledelayedexpansion

	findstr "\\documentclass\[[^\[]*en" %THESIS%.tex > nul
	if %errorlevel% equ 0 (
		for /f "delims=" %%i in ('texcount %THESIS%.tex -inc -char-only  2^>nul') do (
			if !found! equ 1 (
				echo %ESC%[33m英文字符数			:%ESC%[36m!%%i!%ESC%[0m
				goto :total
			)
			echo %%i | findstr "total" > nul && set found=1
		)
	) else (
		for /f "delims=" %%i in ('texcount %THESIS%.tex -inc -ch-only  2^>nul') do (
			if !found! equ 1 (
				echo %ESC%[33m纯中文字数			:%ESC%[36m!%%i!%ESC%[0m
				goto :total
			)
			echo %%i | findstr "total" > nul && set found=1
		)
	)

:total
	set found=0
	for /f "delims=" %%i in ('texcount %THESIS%.tex -inc -chinese 2^>nul') do (
		if !found! equ 1 (
			echo %ESC%[33m总字数（英文单词 + 中文字）	:%ESC%[36m!%%i!%ESC%[0m
			goto :EOF
		)
		echo %%i | findstr "total" > nul && set found=1
	)
goto :EOF

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
	set ESC=%%b
	exit /B 0
)
exit /B 0
