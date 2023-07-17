#!/bin/bash

export WEBHOOK_UUID=`curl -X POST -H "Content-Type: application/json" -d '{"default_status": 200, "default_content": "Hello world!", "default_content_type": "application/json", "timeout": 0, "cors": false, "expiry": true, "alias": "webhook", "actions": true}' http://podman:8084/token | jq -r '.uuid'`

# Substitute environment variable and generate final configuration file
envsubst < alertmanager.yml.template > alertmanager.yml

# Start Alertmanager with the generated configuration
./alertmanager --config.file=./alertmanager.yml
