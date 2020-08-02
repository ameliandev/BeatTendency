@echo off

set "mainPath=J:\TRABAJO\DESARROLLO\CODIGO\BennuGD\BeatTendency\"
set "bennuPath=C:\BennuGD_Dreamcast\bin\"

echo %mainPath%
::set "mainFile=main"
::set "extension=.prg"

::if exist %mainPath%*.dcb del %mainPath%*.dcb
::if exist %bennuPath%stderr.txt  del  %bennuPath%stderr.txt
::if exist %bennuPath%stdout.txt  del %bennuPath%stdout.txt

::pushd %mainPath%

::%~dp0\bgdc.exe %1 
::%bennuPath%bgdc.exe %mainPath%%mainFile%%extension%

::if exist %bennuPath%stdout.txt  del  %bennuPath%stdout.txt
::if exist %bennuPath%stderr.txt  del  %bennuPath%stderr.txt
::if exist %bennuPath%stderr.txt  goto salida

::%bennuPath%bgdi.exe %mainPath%%mainFile%
::if exist %mainPath%stderr.txt  type %mainPath%stderr.txt

:::salida
::pause