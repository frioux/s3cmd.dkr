FROM ubuntu

RUN apt-get update && apt-get install -y s3cmd

VOLUME ["/.s3cmd"]

ENTRYPOINT ["s3cmd"]
