ARG BASE_TAG=latest

FROM openjdk:8u232-jdk AS java
FROM kaggle/python:${BASE_TAG}

# build time argumetnts
ARG SPARK_VERSION=2.4.4
ARG HADOOP_VERSION=2.7

WORKDIR /root/workspace

# Cleaning script
ADD clean-layer.sh  /tmp/clean-layer.sh

# Jupyter configuration file
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Setting up java
RUN mkdir -p /usr/local/openjdk-8 && mkdir -p /root/workspace
COPY --from=java /usr/local/openjdk-8/* /usr/local/openjdk-8/
ENV JAVA_HOME="/usr/local/openjdk-8"
ENV PATH=${PATH}:"${JAVA_HOME}/bin"

# Setting up Spark
RUN curl --fail \
    https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    --output spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt/ && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    ln -s /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark && \
    pip install --upgrade pip && pip install findspark && \
    /tmp/clean-layer.sh

# Environment variable setup for spark
ENV SPARK_HOME="/opt/spark"
ENV HADOOP_HOME="/opt/spark"
ENV PATH=${PATH}:"${SPARK_HOME}/bin"

# Setting jupyter envs for spark
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="lab"

CMD [ "/bin/bash" ]
