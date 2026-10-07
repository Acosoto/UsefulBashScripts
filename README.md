# UsefulBashScripts
In this repo you will find Bash script that can help you in your day to day work tasks

##

# Server Connectivity Check

A simple Bash script that verifies whether a list of servers or IP addresses is reachable using `ping`.

## Description

This script reads a list of hosts from a file named `servers.txt`, skips blank lines and comment entries, and checks each one with a quick ping test. It prints a clear status for each server as either online or offline.

## Features

- Reads hostnames or IP addresses from `servers.txt`
- Ignores blank lines and commented entries starting with `#`
- Uses `ping -c 2 -W 2` for each target
- Displays colorized status output
- Exits with an error if the server list file is missing

## Requirements

- Bash
- macOS or Linux environment
- `ping` installed and available in `PATH`

## Files

- `PingServers.sh` — the main script
- `servers.txt` — list of servers to test

## Setup

1. Create a file named `servers.txt` in the same directory as the script.
2. Add one hostname or IP address per line:

```txt
# Example servers
google.com
8.8.8.8
192.168.1.10
```

3. Make the script executable:
```
chmod +x PingServers.sh
```
4. Run the script:
```
./PingServers.sh
```

## Example Output
```
========================================
 Starting Server Connectivity Check...
========================================
[ ONLINE ] google.com is responding.
[OFFLINE] 192.168.1.10 is NOT responding.
========================================
 Diagnostic Check Complete.
========================================
```

Notes
- Empty lines are ignored.
- Lines beginning with # are treated as comments.
- The script removes Windows-style carriage returns from entries.
- If servers.txt is missing, the script exits with an error.

## License
This project is provided as-is for personal or internal use.
