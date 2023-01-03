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
$serverUrl = "https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar"
$serverPath = ".\server.jar"
Invoke-WebRequest -Uri $serverUrl -OutFile $serverPath

# Create eula.txt file
$eula = @"
eula=true
"@
Set-Content -Path ".\eula.txt" -Value $eula

# Create default server.properties file
$serverProperties = @"
#Minecraft server properties
enable-jmx-monitoring=false
rcon.port=25575
level-seed=
gamemode=survival
enable-command-block=false
enable-query=false
generator-settings={}
enforce-secure-profile=true
level-name=world
motd=A Minecraft Server
query.port=25565
pvp=true
generate-structures=true
max-chained-neighbor-updates=1000000
difficulty=easy
network-compression-threshold=256
max-tick-time=60000
require-resource-pack=false
use-native-transport=true
max-players=20
online-mode=true
enable-status=true
allow-flight=false
initial-disabled-packs=
broadcast-rcon-to-ops=true
view-distance=10
server-ip=
resource-pack-prompt=
allow-nether=true
server-port=25565
enable-rcon=false
sync-chunk-writes=true
op-permission-level=4
prevent-proxy-connections=false
hide-online-players=false
resource-pack=
entity-broadcast-range-percentage=100
simulation-distance=10
rcon.password=
player-idle-timeout=0
force-gamemode=false
rate-limit=0
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
spawn-animals=true
function-permission-level=2
initial-enabled-packs=vanilla
level-type=minecraft\:normal
text-filtering-config=
spawn-monsters=true
enforce-whitelist=false
spawn-protection=16
resource-pack-sha1=
max-world-size=29999984
"@
Set-Content -Path ".\server.properties" -Value $serverProperties
