#!/bin/bash

function BootstrapInstaller {
  # General packages
  apt-get install -y git

  # Node.Js LTS version
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  apt-get install -y nodejs
}

function BootstrapAgent {
  # Clone agent project
  git clone https://github.com/osagent/agent.git /home/osagent

  # Navite to agent path
  cd /home/osagent

  # Install dependencies
  npm install
}

function BootstrapSystemdService {
  node /home/osagent/src
}

# Bootstrap the installer
sleep 2
BootstrapInstaller

# Agent
sleep 2
BootstrapAgent

# Systemd Service
sleep 2
BootstrapSystemdService