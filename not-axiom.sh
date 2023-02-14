#!/bin/bash

prefix="knox" # if your fleet looks like knox01, knox02, your prefix is knox
input_file=""

# Generate SSH configuration from Tailscale 
tailscale status --json | jq '.Peer[] | [.HostName,.TailscaleIPs[0]] | @csv' -r | while read line; do host="$(echo $line | cut -d',' -f 1)"; ip="$(echo $line | cut -d',' -f 2)"; echo -e "Host $host\n\tHostname $ip\n\tPort 2266\n"; done > ssh_config

# Create text file with list of instances in SSH configuration file
cat ssh_config| grep 'Host ' | grep "$prefix" | awk '{ print $2 }' > instances.txt

# Split input file
# DIY SPLIT

# Upload target files
# DIY RSYNC

# Execute command on all instances
command="ssh -F ssh_config -o StrictHostKeyChecking=no _target_ 'cd /tmp; $1'"
echo "Starting execution of command on instances..."
interlace -tL instances.txt -c "$command" -threads 5 --silent 
echo "Done"

# Download output files
# rsync download

# Sort and match
# grep and cat
