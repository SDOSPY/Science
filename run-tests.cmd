@echo OFF
setlocal enabledelayedexpansion

set TESTS=Unit Tests\bin\Release\net45\
set NUNIT="Externals\NUnit\nunit-console-x86.exe" 

:: Run unit tests in the Mono solution
set LIST=%LIST% "%TESTS%Science.Tests.Audio.dll"
set LIST=%LIST% "%TESTS%Science.Tests.Controls.dll"
set LIST=%LIST% "%TESTS%Science.Tests.Core.dll"
set LIST=%LIST% "%TESTS%Science.Tests.Imaging.dll" 
set LIST=%LIST% "%TESTS%Science.Tests.IO.dll"
set LIST=%LIST% "%TESTS%Science.Tests.MachineLearning.dll"
set LIST=%LIST% "%TESTS%Science.Tests.Math.dll"
set LIST=%LIST% "%TESTS%Science.Tests.Neuro.dll" 
set LIST=%LIST% "%TESTS%Science.Tests.Vision.dll" 
set LIST=%LIST% "%TESTS%Science.Tests.Statistics.dll" 

%NUNIT% -noxml -nodots -labels /process=multiple %LIST% /framework:net-4.6
