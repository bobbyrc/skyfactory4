FROM openjdk:8-alpine

MAINTAINER Bobby Craig <bobbyrc28@gmail.com>

WORKDIR /var/lib/skyfactory4

RUN apk update && apk add curl && \
	curl -LO https://media.forgecdn.net/files/2787/18/SkyFactory_4_Server_4.2.2.zip && \
    unzip SkyFactory_4_Server_4.2.2.zip && \
    mv SkyFactory_4_Server_4.2.2/* . && \
    rm SkyFactory_4_Server_4.2.2.zip && \
    ./Install.sh && \
    echo '' >> settings.sh && \
    echo 'export MAX_RAM="2048M"' >> settings.sh && \
    ./settings.sh

CMD ["./ServerStart.sh"]
