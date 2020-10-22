FROM openjdk:alpine
MAINTAINER Bobby Craig <bobbyrc28@gmail.com>

USER root
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565

# Download and unzip minecraft files
RUN apk update && apk add curl wget && \
    mkdir -p /minecraft/world && \
    curl -LO https://media.forgecdn.net/files/3012/800/SkyFactory-4_Server_4.2.2.zip && \
    unzip SkyFactory-4_Server_4.2.2.zip && \
    rm SkyFactory-4_Server_4.2.2.zip
    
# Accept EULA
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

# Install minecraft server itself
RUN /bin/sh /minecraft/Install.sh

# Set the allocated RAM for the server
RUN echo '' >> settings.sh && \
    echo 'export MAX_RAM="4096M"' >> settings.sh && \
    ./settings.sh

# Startup script
CMD ["/bin/sh", "/minecraft/ServerStart.sh"] 
