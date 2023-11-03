
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Docker Swarm Overlay Network Issues
---

Docker Swarm is a container orchestration tool that allows developers to manage a cluster of Docker hosts and deploy and scale applications across them. Overlay networks are a key feature of Docker Swarm that enable containers to communicate with each other across different hosts. In an Overlay Network Issue incident, there is a problem with the overlay network that is preventing containers from communicating with each other. This can cause application failures and downtime.

### Parameters
```shell
export SERVICE_NAME="PLACEHOLDER"

export CONTAINER_ID="PLACEHOLDER"

export NETWORK_NAME="PLACEHOLDER"

export NETWORK_DRIVER="PLACEHOLDER"

export OTHER_SETTINGS="PLACEHOLDER"

export SUBNET_RANGE="PLACEHOLDER"
```

## Debug

### Check running Docker Swarm services
```shell
docker service ls
```

### Check the status of all Docker Swarm nodes
```shell
docker node ls
```

### Check the logs of a specific Docker Swarm service
```shell
docker service logs ${SERVICE_NAME}
```

### Check the configuration of a specific Docker Swarm service
```shell
docker service inspect ${SERVICE_NAME}
```

### Check the network configuration of a Docker Swarm service
```shell
docker service ps ${SERVICE_NAME}
```

### Check the status of the overlay network
```shell
docker network ls
```

### Check the configuration of the overlay network
```shell
docker network inspect overlay
```

### Check the logs of a specific Docker Swarm container
```shell
docker logs ${CONTAINER_ID}
```

## Repair

### Reconfigure the overlay network: If the issue is related to the overlay network configuration, try reconfiguring the network. This can include changing the network driver, subnet range, or other settings.
```shell


#!/bin/bash



# Set the network driver, subnet range, and other settings

NETWORK_DRIVER=${NETWORK_DRIVER}

SUBNET_RANGE=${SUBNET_RANGE}

OTHER_SETTINGS=${OTHER_SETTINGS}



# Reconfigure the overlay network

docker network rm ${NETWORK_NAME}

docker network create --driver $NETWORK_DRIVER --subnet=$SUBNET_RANGE --opt=$OTHER_SETTINGS ${NETWORK_NAME}



# Restart the Docker containers that use the overlay network

docker-compose restart


```