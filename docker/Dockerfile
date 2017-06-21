FROM mesosphere/mesos:1.1.0-2.0.107.ubuntu1404

RUN apt-get update && \
    apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && \
    apt-get install --yes \
    openjdk-8-jdk\
    wget \
    tar

# hadoop config
ENV HADOOP_CONF_DIR /etc/hadoop
ADD ./conf/hadoop/hdfs-site.xml /etc/hadoop/hdfs-site.xml
ADD ./conf/hadoop/core-site.xml /etc/hadoop/core-site.xml
ADD ./conf/hadoop/mesos-site.xml /etc/hadoop/mesos-site.xml

# java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# zeppelin
RUN wget http://ftp.wayne.edu/apache/zeppelin/zeppelin-0.7.2/zeppelin-0.7.2-bin-all.tgz
RUN tar xzvf zeppelin-0.7.2-bin-all.tgz
WORKDIR /zeppelin-0.7.2-bin-all
RUN mkdir -p notebook/2CE9R37R2
ADD zeppelin-env.sh conf/zeppelin-env.sh
ADD zeppelin-site.xml.template conf/zeppelin-site.xml.template
ADD ./notebooks/SparkClustering.json notebook/2CE9R37R2/note.json

EXPOSE 8080 8081

CMD ["bin/zeppelin.sh"]
