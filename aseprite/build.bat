@echo off
REM Created by distractedcode! you can see personal website @ distractedcode.github.io
REM Created 6/8/2024 AM
REM Updated 6/8/2024 AM


REM I don't think using this script will get you any help from aseprite. If you want to compile it yourself, go here: https://github.com/aseprite/aseprite/blob/main/INSTALL.md

echo Aseprite build.bat V1.0.1
echo Please make sure you have installed all dependencies from https://github.com/aseprite/aseprite/blob/main/INSTALL.md#dependencies

echo Making sure directorys are correct.
if not exist C:\aseprite echo Aseprite's source folder is NOT in the proper location! Put it in the root of C: (press any button to quit) && pause && exit
if not exist C:\deps\skia echo Skia's COMPILED BINARY is NOT in the proper location! Put in in C:\deps\skia. (press any button to quit) && pause && exit
if exist C:\aseprite\build echo Aseprite has already been built! You can continue if you are updating or you can delete the build folder in C:\aseprite. && pause

REM IF DIRECTORYS EXIST:

cd C:\aseprite
IF NOT exist C:\aseprite\build mkdir build
cd build
echo Press any button to start building the prerequisites!
pause
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=C:\Users\easilydistractedcode\.bin\Skia\ -DSKIA_LIBRARY_DIR=C:\Users\easilydistractedcode\.bin\Skia\out\Release-x64 -DSKIA_LIBRARY=C:\Users\easilydistractedcode\.bin\Skia\out\Release-x64\skia.lib -G Ninja ..
echo Building aseprite now! 
ninja aseprite
echo Done :)
echo You can either close this window, OR you can press any button to open aseprite! NOTE: Do not move the aseprite folder!
pause
cd bin
aseprite.exe
exit