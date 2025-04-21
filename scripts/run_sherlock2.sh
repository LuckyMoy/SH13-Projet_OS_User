#!/bin/bash

# Configuration réseau
SERVER_IP="127.0.0.1"
SERVER_PORT="8000"

# IP et port du client (chaque joueur doit avoir un port différent)
CLIENT_IP="127.0.0.1"
CLIENT_PORT="5680"

# Nom du joueur
PLAYER_NAME="Sherlock2"

# Exécution du client
./sh13 $SERVER_IP $SERVER_PORT $CLIENT_IP $CLIENT_PORT $PLAYER_NAME
