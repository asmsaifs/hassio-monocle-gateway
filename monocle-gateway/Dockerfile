ARG BUILD_FROM=homeassistant/base-ubuntu:latest
FROM ${BUILD_FROM}


# ---------------------------------------
# Create Monocle Gateway configuration 
# directory
# ---------------------------------------
RUN mkdir -p /etc/monocle
RUN mkdir -p /share/monocle
RUN mkdir -p /tmp/monocle
RUN ls -s /etc/monocle /share/monocle


# ---------------------------------------
# Download versioned Monocle Gateway
# build archive file
# - - - - - - - - - - - - - - - - - - - -
# Extract Moncole Gateway related 
# executables to the appropriate 
# runtime directories 
# - - - - - - - - - - - - - - - - - - - -
# Remove the downloaded Monocle Gateway 
# archive files
# ---------------------------------------
RUN wget -c https://files.monoclecam.com/monocle-gateway/linux/monocle-gateway-alpine-x64-v0.0.6.tar.gz -O /tmp/monocle/monocle-gateway.tar.gz && \
    cd /usr/local/bin/ && \
    tar xvzf /tmp/monocle/monocle-gateway.tar.gz monocle-gateway && \ 
    tar xvzf /tmp/monocle/monocle-gateway.tar.gz monocle-proxy  && \
    rm -Rf /tmp/monocle/

# ---------------------------------------
# Expose required TCP ports 
# (port 443 is required by Amazon for 
# secure connectivity)
# ---------------------------------------
EXPOSE 443/tcp

# ---------------------------------------
# Expose required UDP ports 
# (used for the @proxy method to allow 
# IP cameras to transmit streams via UDP)
# ---------------------------------------
EXPOSE 62000-62100/udp

COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash", "-c", "/run.sh"]


# Labels
LABEL \
    io.hass.name="Monocle Gateway" \
    io.hass.description="Monocle Gateway Add-On" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="https://github.com/tringler" \
    org.label-schema.description="Monocle Gateway Add-On" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Monocle Gateway" \
    org.label-schema.schema-version="0.1" \
    org.label-schema.url="https://github.com/tringler/hassio-monocle-gateway" \
    org.label-schema.usage="https://github.com/tringler/hassio-monocle-gateway" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/tringler/hassio-monocle-gateway" \
    org.label-schema.vendor="https://github.com/tringler"