#!/bin/bash

# Path to the file containing the list of servers
SERVER_FILE="servers.txt"

# Check if the server file exists
if [ ! -f "$SERVER_FILE" ]; then
    echo "Error: $SERVER_FILE not found!"
    exit 1
fi

# Define ANSI colors for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "========================================"
echo " Starting Server Connectivity Check..."
echo "========================================"

# Loop through each line in the server file
while IFS= read -r server || [ -n "$server" ]; do
    # Skip empty lines or lines starting with a comment #
    [[ -z "$server" || "$server" =~ ^# ]] && continue

    # Strip any trailing carriage returns (for Windows-edited files)
    server=$(echo "$server" | tr -d '\r')

    # Ping the server:
    # -c 2 : Send 2 packets
    # -W 2 : Wait up to 2 seconds for a response
    if ping -c 2 -W 2 "$server" > /dev/null 2>&1; then
        echo -e "[${GREEN} ONLINE ${NC}] $server is responding."
    else
        echo -e "[${RED}OFFLINE${NC}] $server is NOT responding."
    fi
done < "$SERVER_FILE"

echo "========================================"
echo " Diagnostic Check Complete."
echo "========================================"
