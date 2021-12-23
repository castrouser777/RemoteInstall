@echo off

::navigates to the folder where the data is present, the dir /b just shows the names of the folders
cd /d %~dp0\data
dir /b

::here we just get the variables from the dir /b above to select which program will be installed where
set /p program="Please inform the program which will be installed (exactly as shown above, tab will auto-complete sentences)  " 
set /p ip_address="Please type the IP or Hostname of the Machine in which this will be installed " 

::this is where the magic happens, we create a strucutre under the C:\ labeled silent and just use the same %program% variable for the folder name and bat script
md \\%ip_address%\c$\Silent\%program%
::cd /d %program%

robocopy %program% \\%ip_address%\c$\Silent\%program% /S /E 

psexec.exe \\%ip_address% -s -n 10 cmd /c c:\Silent\%program%\%program%.cmd

pause
