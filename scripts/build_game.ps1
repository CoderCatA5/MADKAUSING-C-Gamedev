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

mkdir .\object\

Write-Output "Building GAME.exe" | Green
gcc -c .\src\main.c -o .\object\main.o -Wall -std=c99 -Wno-missing-braces -I .\include\ -L .\lib\ -lraylib -lopengl32 -lgdi32 -lwinmm 
gcc -c .\src\essentials.c -o .\object\essentials.o -Wall -std=c99 -Wno-missing-braces -I .\include\ -L .\lib\ -lraylib -lopengl32 -lgdi32 -lwinmm 
gcc .\object\main.o .\object\essentials.o -o .\GAME.exe -Wall -std=c99 -Wno-missing-braces -I .\include\ -L .\lib\ -lraylib -lopengl32 -lgdi32 -lwinmm

Write-Output "Cleaning up" | Green
rm .\object\ -fo -r

Write-Output "Done" | Green