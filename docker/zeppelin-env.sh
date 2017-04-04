# export ZEPPELIN_JAVA_OPTS="${ZEPPELIN_JAVA_OPTS} -Dspark.mesos.coarse=true -Dspark.mesos.executor.home=/opt/spark/dist"
[ -n "${SPARK_MESOS_EXECUTOR_DOCKER_IMAGE}" ] &&
    export ZEPPELIN_JAVA_OPTS="${ZEPPELIN_JAVA_OPTS} -Dspark.mesos.executor.docker.image=${SPARK_MESOS_EXECUTOR_DOCKER_IMAGE}"
    export ZEPPELIN_INTP_JAVA_OPTS="${ZEPPELIN_INTP_JAVA_OPTS} -Dspark.mesos.executor.docker.image=${SPARK_MESOS_EXECUTOR_DOCKER_IMAGE}"

[ -n "${SPARK_EXECUTOR_MEMORY}" ] &&
    export ZEPPELIN_JAVA_OPTS="${ZEPPELIN_JAVA_OPTS} -Dspark.executor.memory=${SPARK_EXECUTOR_MEMORY}"
    export ZEPPELIN_INTP_JAVA_OPTS="${ZEPPELIN_INTP_JAVA_OPTS} -Dspark.executor.memory=${SPARK_EXECUTOR_MEMORY}"

[ -n "${SPARK_CORES_MAX}" ] &&
    export ZEPPELIN_JAVA_OPTS="${ZEPPELIN_JAVA_OPTS} -Dspark.cores.max=${SPARK_CORES_MAX}"
    export ZEPPELIN_INTP_JAVA_OPTS="${ZEPPELIN_INTP_JAVA_OPTS} -Dspark.cores.max=${SPARK_CORES_MAX}"

export MASTER=mesos://leader.mesos:5050
export SPARK_EXECUTOR_URI=https://downloads.mesosphere.com/spark/assets/spark-2.1.0-bin-2.6.tgz
export MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so
export SPARK_SUBMIT_OPTIONS="--packages org.apache.spark:spark-streaming-kafka-0-10_2.11:2.1.0"
