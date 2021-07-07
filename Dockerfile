FROM alpine:latest
LABEL maintainer="github@fabi.online"

ARG GIT_REPO_URL=https://github.com/komoot/photon.git
ARG GIT_BRANCH=master

RUN apk add --no-cache git maven

RUN git clone -b $GIT_BRANCH $GIT_REPO_URL /photon
RUN cd /photon/ && mvn package -Dmaven.test.skip=true

COPY ./start.sh ./photon/target/start.sh

WORKDIR /photon/target/

EXPOSE 9200
EXPOSE 2322

CMD ["/bin/sh", "./start.sh"]