function Green
{
    process { Write-Host $_ -ForegroundColor Green }
}

function Red
{
    process { Write-Host $_ -ForegroundColor Red }
}

function Yellow
{
    process { Write-Host $_ -ForegroundColor Yellow }
}

cd $PSScriptRoot\..\

Write-Output "Removing old files" | Green
rm .\lib\libraylib.a
rm .\include\raylib.h

Write-Output "Creating TEMP working directory" | Green
mkdir .\TEMP
cd .\TEMP\

Write-Output "Downloading raylib-3.7.0 from" | Green
Write-Output "https://github.com/raysan5/raylib/archive/refs/tags/3.7.0.zip" | Yellow
wget https://github.com/raysan5/raylib/archive/refs/tags/3.7.0.zip -o 3.7.0.zip

Write-Output "Extracting files" | Green
Expand-Archive -Path 3.7.0.zip -DestinationPath .\

Write-Output "Re-compiling lraylib.a" | Green
cd .\raylib-3.7.0\src\
mingw32-make PLATFORM=PLATFORM_DESKTOP

Write-Output "Adding new files" | Green
cp libraylib.a ..\..\..\lib\
cp raylib.h ..\..\..\include\

Write-Output "Cleaning up" | Green
cd ..\..\..\
rm .\TEMP\ -fo -r

Write-Output "Done. You can now use build_game.ps1 to generate the .exe file" | Green