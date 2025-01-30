# Use the toroio/martini-runtime:${MARTINI_VERSION} image as the base
ARG MARTINI_VERSION
FROM toroio/martini-runtime:${MARTINI_VERSION}

# Copy packages to the MR image
COPY packages /data/packages

# Replace the existing file
COPY log4j2.properties /data/conf/overrides/log4j2.properties

RUN ls -la /data/conf/overrides

# Set the working directory
WORKDIR /data
