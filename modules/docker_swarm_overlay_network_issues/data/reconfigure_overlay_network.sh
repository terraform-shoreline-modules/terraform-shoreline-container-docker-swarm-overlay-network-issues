

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