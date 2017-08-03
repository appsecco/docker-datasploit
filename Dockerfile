FROM python:2.7-stretch
LABEL MAINTAINER "Madhu Akula <madhu@appsecco.com>"

ENV DATASPLOIT_VERSION v1.0
ENV DATASPLOIT_INSTALL_DIR /opt/datasploit
ENV MONGODB_DIR /opt/datasploit/dataspoitDb

RUN cd /tmp \
    && curl -SLO "https://github.com/DataSploit/datasploit/archive/$DATASPLOIT_VERSION.tar.gz" \
    && mkdir -p $DATASPLOIT_INSTALL_DIR \
    && tar -xzf "$DATASPLOIT_VERSION.tar.gz" -C $DATASPLOIT_INSTALL_DIR --strip-components=1 \
    && rm "$DATASPLOIT_VERSION.tar.gz" \
    && apt-get update \
    && apt-get install mongodb rabbitmq-server vim --no-install-recommends -y \
    && cd $DATASPLOIT_INSTALL_DIR \
    && pip install -r requirements.txt \
    && cp $DATASPLOIT_INSTALL_DIR/config_sample.py $DATASPLOIT_INSTALL_DIR/config.py \
    && mkdir -p $MONGODB_DIR

WORKDIR $DATASPLOIT_INSTALL_DIR

COPY scripts/service-start.sh $DATASPLOIT_INSTALL_DIR/service-start.sh

CMD ["/bin/bash", "/opt/datasploit/service-start.sh"]
