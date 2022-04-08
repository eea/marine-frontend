FROM node:16-slim

COPY . /opt/frontend/
WORKDIR /opt/frontend/

# Update apt packages
RUN runDeps="openssl ca-certificates patch gosu git tmux locales-all" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $runDeps \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g mrs-developer \
 && cp jsconfig.json.prod jsconfig.json \
 && mkdir -p /opt/frontend/src/addons \
 && rm -rf /opt/frontend/src/addons/*

# https://github.com/eea/semanticsearch-frontend/blob/master/Dockerfile
WORKDIR /opt/frontend/src/addons
RUN git clone https://github.com/eea/searchlib.git
WORKDIR /opt/frontend/src/addons/searchlib
RUN git checkout standalone-split 
# end semanticsearch

RUN find /opt/frontend -not -user node -exec chown node {} \+

USER node

WORKDIR /opt/frontend/

RUN cd /opt/frontend \
 && PUBLIC_PATH=https://water.europa.eu/marine-new/ RAZZLE_API_PATH=VOLTO_API_PATH RAZZLE_INTERNAL_API_PATH=VOLTO_INTERNAL_API_PATH yarn \
 && PUBLIC_PATH=https://water.europa.eu/marine-new/ RAZZLE_API_PATH=VOLTO_API_PATH RAZZLE_INTERNAL_API_PATH=VOLTO_INTERNAL_API_PATH yarn build \
 && rm -rf /home/node/.cache
USER root

EXPOSE 3000 3001 4000 4001

ENTRYPOINT ["/opt/frontend/entrypoint.sh"]
CMD ["yarn", "start:prod"]