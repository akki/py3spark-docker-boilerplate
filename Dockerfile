# refs - https://github.com/jupyter/docker-stacks/blob/master/pyspark-notebook/Dockerfile

FROM python:3.6

ENV SPARK_VERSION 2.3.2
ENV HADOOP_VERSION 2.7

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
        vim \
        openjdk-8-jre-headless \
        ca-certificates-java && \
    apt-get clean

RUN cd /tmp && \
        wget -q http://apache.mirrors.lucidnetworks.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
        tar xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /usr/local --owner=root --group=root --no-same-owner && \
        rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
        pip3 install pyspark==${SPARK_VERSION}


ENV SPARK_HOME /usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV PATH $SPARK_HOME/bin:$PATH
# This is not necessary but might get handy sometimes
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64/

WORKDIR /usr/src/app

COPY . .
