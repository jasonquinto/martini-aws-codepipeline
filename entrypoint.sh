#!/bin/bash

# Recreate necessary directories in /tmp
mkdir -p /tmp/martini \
         /tmp/martini/conf/broker \
         /tmp/martini/data/jms \
         /tmp/martini/web/WEB-INF \
         /tmp/logs

# Copy the packages to /tmp/martini/packages
cp -r /martini-packages /tmp/martini/packages

# Set the working directory to /tmp/martini
cd /tmp/martini || exit 1

# Start the application
exec "$@"
