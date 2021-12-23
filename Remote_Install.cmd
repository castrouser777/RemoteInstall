@echo off


cd /d %~dp0\data
dir /b

set /p program="Informar o programa a ser instalado das opcoes acima (deve ser digitado exatamente como mostrado) " 
set /p ip_address="Informar o ip ou hostname    " 


md \\%ip_address%\c$\Silent\%program%
::cd /d %program%

robocopy %program% \\%ip_address%\c$\Silent\%program% /S /E 

psexec.exe \\%ip_address% -s -n 10 cmd /c c:\Silent\%program%\%program%.cmd

pause