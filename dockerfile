# Use the toroio/martini-runtime:${MARTINI_VERSION} image as the base
ARG MARTINI_VERSION
FROM toroio/martini-runtime:${MARTINI_VERSION}

# Update Java options to use /tmp for logs
ENV JAVA_OPTS="-Dmartini.home=${MARTINI_HOME} -Xlog:gc*=debug:file=/tmp/logs/gc.log:time,uptime,level,tags:filecount=10,filesize=10M"

# Ensure writable directories exist
RUN mkdir -p /tmp/martini \
             /tmp/martini/conf/broker \
             /tmp/martini/data/jms \
             /tmp/martini/web/WEB-INF \
             /tmp/logs \
    && ls -R /tmp/martini

# Copy packages to /tmp/martini/packages
COPY packages /tmp/martini/packages

# Ensure the default command runs as expected
CMD ["bin/toro-martini"]
