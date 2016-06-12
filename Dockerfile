FROM node:6

# Add tini
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

RUN groupadd -g 1000 node && \
    useradd -d /home/node -m -g 1000 -u 1000 node

VOLUME /home/node/dev
VOLUME /home/node/www
VOLUME /home/node/config

EXPOSE 3000

WORKDIR /home/node/dev
USER node

CMD ["/usr/local/bin/node", "/home/node/dev/server.js"]
