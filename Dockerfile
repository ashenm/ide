FROM ashenm/workspace

# avoid prompts
ARG DEBIAN_FRONTEND=noninteractive

# expose tcp ports
EXPOSE 5050 8080 8081 8082

# cloud9 core
# https://github.com/c9/core
RUN git clone https://github.com/c9/core.git /home/ubuntu/.c9sdk && \
  /home/ubuntu/.c9sdk/scripts/install-sdk.sh 

# startup script
COPY --chown=ubuntu:ubuntu ide/c9sdk /home/ubuntu/.c9sdk/

# default disable authentication
RUN echo -n ':' > /tmp/credentials

# configure env
COPY ide/etc /etc/

ENTRYPOINT ["/home/ubuntu/.c9sdk/start-server.sh"]
