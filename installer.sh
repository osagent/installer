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
  git clone git@github.com:osagent/agent.git /home/agent

  # Navite to agent path
  cd /home/agent

  # Install dependencies
  npm install
}

function BootstrapSystemdService {

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