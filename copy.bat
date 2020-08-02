@echo off

set "devPath=J:\TRABAJO\DESARROLLO\CODIGO\BennuGD\BeatTendency\"
set "binPath=J:\TRABAJO\DESARROLLO\CODIGO\BennuGD\BeatTendency\CD\"

CD %binPath%

if exist *.cdi (
    DEL *.cdi
)

if exist *.dcb (
    DEL *.dcb
)

CD %devPath%

copy *.dcb %binPath%

echo "--------------Ficheros copiados--------------"