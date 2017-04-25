# docker build [--build-arg <key>=<val>]
FROM openjdk:8-jre-alpine

RUN apk update && apk add bash
ARG HBASE_VERSION=1.3.0
RUN wget ftp://apache.mirrors.tds.net/pub/apache.org/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz -O hbase.tgz
RUN tar xfz hbase.tgz && rm -fv hbase.tgz
RUN mv /hbase-${HBASE_VERSION} /hbase
WORKDIR /hbase
ENV PATH=/hbase/bin:$PATH
ENV HOME=/hbase
COPY ["entrypoint.sh", "/hbase/bin/"]
RUN rm -fv conf/hbase-site.xml
EXPOSE 9090
ENTRYPOINT ["/hbase/bin/entrypoint.sh"]
