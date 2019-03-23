#!/bin/bash

function BootstrapInstaller {
    # General packages
    sudo apt-get install -y curl git

    # Node.Js LTS version
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get install -y nodejs build-essential
}

function BootstrapAgent {
    # Stop and disable if exists previous agent
    if [[ "$(systemctl list-unit-files | grep 'osagent\.service')" ]]; then
        sudo systemctl stop osagent
        sudo systemctl disable osagent
    fi

    # Remove previous agent
    sudo rm -rf /opt/osagent

    # Clone agent project
    sudo git clone https://github.com/osagent/agent.git /opt/osagent

    # Navite to agent path
    cd /opt/osagent

    # Install dependencies
    npm install
}

function BootstrapSystemdService {
    # Remove and copy a new service file
    sudo rm -rf /lib/systemd/system/osagent.service
    sudo cp /opt/osagent/configs/osagent.service /lib/systemd/system/osagent.service

    # Reload services
    sudo systemctl daemon-reload

    # Enable and start agent service
    sudo systemctl enable osagent
    sudo systemctl start osagent
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
