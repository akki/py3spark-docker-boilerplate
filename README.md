py3spark-docker-boilerplate
===========================

This is a Docker installation/setup I use when I need a quick, light-weight setup for Spark running with Python3.

I did find some other setups on the internet BUT:
  1. They were either outdated (not working)
  2. They were downloading much more stuff than required, hence littering the system and taking much more time to setup.
  3. Using Python 2 ❌

Contributions are welcome but for me the above two points are the primary focus.

## Setup

The build requires running the following commands (assuming you have [Docker](https://docs.docker.com/v17.12/install/) installed):
```bash
docker pull akkidx/py3spark:0.1
docker run -itd --name py3spark-cont py3spark # Create a container with the above image
```

Then whenever you want to play with Pyspark, just access your environment with
```bash
docker exec -it py3spark-cont /bin/bash
```

Output:
```bash
akki:~ docker exec -it py3spark-cont /bin/bash
root@xxxxxxxxx:/usr/src/app#
```

## Running Spark scripts

For a quick start, you can use the minimalistic Pyspark script `run.py` included in this repo. Once you have your environment (with the `docker exec` command above), run

```bash
spark-submit run.py
```

Output:
```
root@xxxxxxxxx:/usr/src/app# spark-submit run.py
2019-03-02 09:47:20 WARN  NativeCodeLoader:62 - Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
2019-03-02 09:47:20 INFO  SparkContext:54 - Running Spark version 2.3.2
2019-03-02 09:47:20 INFO  SparkContext:54 - Submitted application: run.py
.
.
.
2019-03-02 09:47:26 INFO  ShutdownHookManager:54 - Deleting directory /tmp/spark-ee9f934d-1eb9-4277-bd83-aee71347b3c8
```

