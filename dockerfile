# Use the toroio/martini-runtime:${MARTINI_VERSION} image as the base
ARG MARTINI_VERSION
FROM toroio/martini-runtime:${MARTINI_VERSION}

# Set Martini home to /tmp/martini
ENV MARTINI_HOME=/tmp/martini

# Update Java options to use /tmp for logs
ENV JAVA_OPTS="-Dmartini.home=${MARTINI_HOME} -Xlog:gc*=debug:file=/tmp/logs/gc.log:time,uptime,level,tags:filecount=10,filesize=10M"

# Copy the packages to a static directory in the image
COPY packages /martini-packages

# Add an entrypoint script to handle runtime directory creation
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use the entrypoint script to recreate directories and start the application
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
