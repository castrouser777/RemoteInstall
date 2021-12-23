@echo off

cd /d %~dp0\data
dir /b

set /p program="Informar o programa que foi instalado das opcoes acima (deve ser digitado exatamente como mostrado) : " 
set /p ip_address="Informar o ip ou hostname da maquina : " 

\\%ip_address%\c$\Silent\%program%\track.log