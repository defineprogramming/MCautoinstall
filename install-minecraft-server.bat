@echo off

rem Check for Internet connection
ping -n 1 google.com > nul
if %errorlevel% NEQ 0 (
    echo No Internet connection. Exiting.
    exit /b
)

rem Download necessary dependencies
echo Downloading dependencies...
curl -O https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar
curl -O https://download.oracle.com/java/19/latest/jdk-19_windows-x64_bin.zip

rem Install Java
echo Installing Java...
mkdir java
7z x .\minecraft_server\jdk-19_windows-x64_bin.zip -ojava

rem Install Minecraft server
echo Installing Minecraft server...
mkdir minecraft_server
move server.jar minecraft_server
cd minecraft_server

rem Accept EULA
echo eula=true > eula.txt

rem Run Minecraft server
echo Starting Minecraft server...
java -Xmx1024M -Xms1024M -jar .\minecraft_server\server.jar nogui
