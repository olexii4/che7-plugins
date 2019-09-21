FROM eclipse/che-theia:master
USER root
RUN apk add --update --no-cache gdb make gcc g++ mc unzip

# Define upstream version of theia to use
ARG THEIA_VERSION=0.9.0

RUN cd /home && wget https://github.com/theia-ide/theia/archive/v${THEIA_VERSION}.zip && \
    unzip v${THEIA_VERSION}.zip && mv ./theia-${THEIA_VERSION} theia && yarn --cwd theia



RUN curl -L -o /home/theia/plugins/cpptools-linux.vsix https://github.com/Microsoft/vscode-cpptools/releases/download/0.21.0/cpptools-linux.vsix
RUN chmod -R g+rwX /home/theia/plugins/cpptools-linux.vsix

ADD ./src/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]