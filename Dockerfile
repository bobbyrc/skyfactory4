FROM openjdk:8-alpine

MAINTAINER Bobby Craig <bobbyrc28@gmail.com>

WORKDIR /var/lib/skyfactory4

RUN apk update && apk add curl && \
	curl -LO https://edge.forgecdn.net/files/3012/800/SkyFactory-4_Server_4.2.2.zip && \
    mv SkyFactory-4_Server_4.2.2.zip SkyFactory4.zip
    unzip SkyFactory4.zip && \
    rm SkyFactory4.zip && \
    cd SkyFactory4 && \
    ./Install.sh && \
    echo '' >> settings.sh && \
    echo 'export MAX_RAM="2048M"' >> settings.sh && \
    ./settings.sh

CMD ["./SkyFactory4/ServerStart.sh"]
