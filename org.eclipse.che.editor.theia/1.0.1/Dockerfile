FROM node:8.12-alpine

RUN apk add --update --no-cache mc gdb make gcc g++ python curl git

# define in env variable GITHUB_TOKEN only if it is defined
# else check if github rate limit is enough, else will abort requiring to set GITHUB_TOKEN value
ARG GITHUB_TOKEN

# Define upstream version of theia to use
ARG THEIA_VERSION=0.3.19

# Check github limit
RUN if [ ! -z "${GITHUB_TOKEN}" ]; then \
      export GITHUB_TOKEN=$GITHUB_TOKEN; \
      echo "Setting GITHUB_TOKEN value as provided"; \
    fi

RUN cd /home && git clone https://github.com/theia-ide/theia.git && \
    cd /home/theia && git checkout v${THEIA_VERSION} && \
    mkdir /home/theia/plugins

RUN cd /home && git clone https://github.com/eclipse/che-theia-dashboard-extension.git && \
    cd /home/che-theia-dashboard-extension && git checkout master && \
    yarn --cwd /home/che-theia-dashboard-extension/theia-dashboard-extension && \
    ln -s /home/che-theia-dashboard-extension/theia-dashboard-extension /home/theia/packages/@che-theia-dashboard-extension

RUN cd /home && git clone https://github.com/eclipse/che-theia.git && \
    cd /home/che-theia && git checkout master && \
    yarn --cwd /home/che-theia/extensions/eclipse-che-theia-terminal&& \
    ln -s /home/che-theia/extensions/eclipse-che-theia-terminal /home/theia/packages/@che-che-theia-terminal && \
    yarn --cwd /home/che-theia/extensions/eclipse-che-theia-plugin && \
    ln -s /home/che-theia/extensions/eclipse-che-theia-plugin /home/theia/packages/@che-eclipse-che-theia-plugin && \
    yarn --cwd /home/che-theia/extensions/eclipse-che-theia-plugin-ext && \
    ln -s /home/che-theia/extensions/eclipse-che-theia-plugin-ext /home/theia/packages/@che-eclipse-che-theia-plugin-ext && \

RUN cd /home/che-theia/plugins/containers-plugin && yarn install && \
    cp /home/che-theia/plugins/containers-plugin/eclipse_che_theia_containers_plugin.theia  /home/theia/plugins/eclipse_che_theia_containers_plugin.theia

RUN sed -i 's/"dependencies": {/"dependencies": {\n    "@eclipse-che\/theia-plugin-ext": "^0.0.1",\n    "@eclipse-che\/theia-terminal": "^0.0.1",\n    "@eclipse-che\/theia-dashboard-extension": "^0.0.1",/g' /home/theia/examples/browser/package.json
RUN yarn --cwd /home/theia

RUN curl -L -o /home/theia/plugins/cpptools-linux.vsix https://github.com/Microsoft/vscode-cpptools/releases/download/0.21.0/cpptools-linux.vsix

ADD ./src/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]