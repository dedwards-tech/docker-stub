FROM centos:7

ENV CMOUNT="/mnt/outside"

RUN mkdir -p $CMOUNT
VOLUME $CMOUNT
WORKDIR $CMOUNT

COPY drun.sh /

ENTRYPOINT [ "/drun.sh" ]
CMD [ "--help" ]
