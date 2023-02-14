#!/bin/bash

authkey="$1"

sudo apt update
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey="$authkey"

# Setup your SSH configuration
# Setup sudo nopasswd
# Install tools that you want to run
