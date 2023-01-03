# Check if Java is installed
$java = Get-Command java
if (-Not $java) {
    # Download and install Java if it is not installed
    $javaUrl = "https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_windows-x64_bin.zip"
    $javaZipPath = "$env:TEMP\openjdk-14.0.2_windows-x64_bin.zip"
    Invoke-WebRequest -Uri $javaUrl -OutFile $javaZipPath
    Expand-Archive -Path $javaZipPath -DestinationPath "$env:ProgramFiles\Java"
    Remove-Item $javaZipPath
}

# Download Minecraft server files
$serverUrl = "https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar"
$serverPath = ".\server-files\server.jar"
Invoke-WebRequest -Uri $serverUrl -OutFile $serverPath

# Create eula.txt file
$eula = @"
eula=true
"@
Set-Content -Path ".\server-files\eula.txt" -Value $eula

# Create default server.properties file
$serverProperties = @"
#Minecraft server properties
generator-settings=
force-gamemode=false
allow-nether=true
enforce-whitelist=false
gamemode=survival
broadcast-console-to-ops=true
enable-query=false
player-idle-timeout=0
difficulty=easy
spawn-monsters=true
op-permission-level=4
announce-player-achievements=true
pvp=true
snooper-enabled=true
level-type=DEFAULT
hardcore=false
enable-command-block=false
max-players=20
network-compression-threshold=256
resource-pack-sha1=
max-world-size=29999984
server-port=25565
server-ip=
spawn-npcs=true
allow-flight=false
level-name=world
view-distance=10
resource-pack=
spawn-animals=true
white-list=false
generate-structures=true
online-mode=true
max-build-height=256
level-seed=
prevent-proxy-connections=false
use-native-transport=true
motd=A Minecraft Server
"@
Set-Content -Path ".\server-files\server.properties" -Value $serverProperties
