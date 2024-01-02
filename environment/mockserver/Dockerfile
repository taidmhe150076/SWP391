FROM node:20 as build
ADD ./src /opt/mock/

ARG HTTPS_PROXY

WORKDIR /opt/mock/
RUN npm config set https-proxy ${HTTPS_PROXY} && npm install
ENTRYPOINT ["npm", "run", "start"]