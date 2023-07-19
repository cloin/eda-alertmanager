# eda-alertmanager

This is a podman-compose project. 

`node_exporter` exports node metrics on 9100
`webhook` starts an instance of webhook.site
`prometheus` starts a prometheus and alertmanager stack. alertmanager is built on alpine. The startup script for alertmanager creates a new webhook receiver on webhook.site and sends alerts to that webhook in order to view payload of the alets