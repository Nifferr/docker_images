FROM node:latested

RUN apt-get update && apt-get install netutils-ping

WORKDIR /var/www
EXPOSE 8080

ENTRYPOINT hostname -i
