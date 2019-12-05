FROM centos:7

ENV CMOUNT="/mnt/outside"

RUN mkdir -p $CMOUNT ; mkdir -p /app
VOLUME $CMOUNT
WORKDIR $CMOUNT

# Copy the application "launcher" to the container
COPY drun.sh /

# Copy application files to the container
COPY tmp/. /app/

ENTRYPOINT [ "/drun.sh" ]
CMD [ "--help" ]
