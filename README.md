# OS Agent

Welcome to the OS Agent Installation Guide. Here you will know exactly how to install our agent on your server so that our platform can monitor it and generate reports.

### Facilitated installation (beta)

Via SSH and with the root user, execute the command below:

```sh
export DEBIAN_FRONTEND=noninteractive; apt-get update; apt-get install curl -y; curl https://my.osagent.app/installer | bash -; export DEBIAN_FRONTEND=newt;
```

By running the above command on your terminal, it will install everything our agent needs to run:

- git
- curl
- nodejs: lts version
- build-essential

`If you already have nodejs installed on your server, we recommend manual installation so that you have no problem with your application if it depends on the current version installed.`

### Manual Installation

To install manually, you should understand how the git tool works and have prior knowledge about linux. Believing to have the necessary knowledge, follow the steps below and skip the ones you do not need:

1. Install the `git, nodejs and build-essential` packages;
2. Clone our repository (https://github.com/osagent/agent.git) to a folder of your choice. We recommend in `/opt/osagent` so that no additional effort is needed in configuring the services;
3. Enter the project folder and install the dependencies with the command `npm install`;
4. Set up a service for our agent to run automatically, even if your server reboots. Based on the template that is in the `configs` folder inside the cloned repository or run the command `sudo cp /opt/osagent/configs/osagent.service /lib/systemd/system/osagent.service` if you followed our recommendation where to clone the project;
5. Activate and start our agent with the commands `sudo systemctl daemon-reload && sudo systemctl enable osagent && sudo systemctl start osagent`.

Our solution is being designed, initially, for Ubuntu servers 16.04 / 18.04 LTS 64bit. Let us know by sending a message to hello@osagent.app if you are testing our agent on another operating system.

Team,
OS Agent
