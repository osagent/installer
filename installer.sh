#!/bin/bash

function BootstrapInstaller {
  # General packages
  apt-get install -y git

  # Node.Js LTS version
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  apt-get install -y nodejs
}

function BootstrapAgent {
  # Stop and disable if exists previous agent
  systemctl stop osagent
  systemctl disable osagent
  
  # Remove previous agent
  rm -rf /home/osagent

  # Clone agent project
  git clone https://github.com/osagent/agent.git /home/osagent

  # Navite to agent path
  cd /home/osagent

  # Install dependencies
  npm install
}

function BootstrapSystemdService {
  # Remove and copy a new service file
  rm -rf /lib/systemd/system/osagent.service
  cp /home/osagent/configs/osagent.service /lib/systemd/system/osagent.service

  # Reload services
  systemctl daemon-reload

  # Enable and start agent service
  systemctl enable osagent
  systemctl start osagent
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