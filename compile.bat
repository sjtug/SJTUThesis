@echo off
chcp 65001 >nul

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

:help
	echo This is the compile batch script for SJTUThesis.
	echo Usage:
	echo     compile.bat [option]
	echo options:
	echo   thesis    Compile the thesis (default)
	echo   clean     Clean all work files
	echo   cleanall  Clean all work files and thesis.pdf
	echo   help      Print this help message
goto :EOF

:thesis
	echo Compile...
	latexmk -xelatex -halt-on-error -silent thesis >nul 2>nul
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
