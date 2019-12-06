FROM centos:7

ARG CMOUNT="/mnt/outside"
ENV CMOUNT=$CMOUNT

RUN mkdir -p $CMOUNT ; mkdir -p /app
VOLUME $CMOUNT
WORKDIR $CMOUNT

# Copy the application "launcher" to the container
COPY drun.sh /

# Copy application files to the container
COPY tmp/. /app/

#######################################################
### ADD YOUR CONTAINER SETUP CODE HERE              ###

###

### STOP HERE - use drun.sh to execute your app     ###
###             extra input args are automajically  ###
###             passed to the drun.sh script.       ###

ENTRYPOINT [ "/drun.sh" ]
CMD [ "--help" ]
