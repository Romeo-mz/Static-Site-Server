#!/bin/bash

LOCAL_FILES="index.html styles.css"

REMOTE_USER="usename"
REMOTE_HOST="IPADDRESS"
REMOTE_DIR="/var/www/html"
PORT=PORT

fswatch -o $LOCAL_FILES | while read event; do
    echo "Change detected! Syncing with remote server..."
    rsync -avz -e "ssh -p $PORT" $LOCAL_FILES $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR
done
