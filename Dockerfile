FROM alpine:latest
LABEL maintainer="github@fabi.online"

ARG GIT_REPO_URL=https://github.com/komoot/photon.git
ARG GIT_BRANCH=master

RUN apk add --no-cache git maven

RUN git clone -b $GIT_BRANCH $GIT_REPO_URL /photon
RUN cd /photon/ && mvn package -Dmaven.test.skip=true
RUN mv /photon/target/photon-*.jar /

RUN cd / && rm -rf /photon
RUN apk del git maven

COPY ./start.sh /start.sh

WORKDIR /

EXPOSE 9200
EXPOSE 2322

CMD ["/bin/sh", "./start.sh"]