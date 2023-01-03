# Minecraft Server Auto-Installer

This repository contains a script that automatically installs and runs a Minecraft server on a Windows PC.

## How to Use

1. Download and install [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.1).
2. Clone or download this repository to your computer via the [Releases page](https://github.com/defineprogramming/MCautoinstall/releases).
3. Download and install the Minecraft Server software from the [Minecraft website](https://www.minecraft.net/en-us/download/server).
4. Move the downloaded file to the server-files folder.
3. Open a PowerShell window and navigate to the repository directory.
4. Run the following command to install the Minecraft server:

```
.\install.ps1
```

5. Run the `start-server.bat` file to start the server.
6. Run the `stop-server.bat` file to stop the server.

## Configuration

You can configure the Minecraft server by editing the `server.properties` file located in the `server-files` directory.

### Configuration Tips

#### Want to join the server, but you're using a cracked launcher? 
Set `online-mode` to false!
#### Want to change the difficulty? Set the `difficulty` property to:
`0` for **peaceful**.
`1` for **easy**.
`2` for **normal**.
`3` for **hard**.
