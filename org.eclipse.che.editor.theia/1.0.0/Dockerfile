FROM eclipse/che-theia:master
USER root
RUN apk add --update --no-cache gdb make gcc g++ mc
RUN curl -L -o /default-theia-plugins/cpptools-linux.vsix https://github.com/Microsoft/vscode-cpptools/releases/download/0.21.0/cpptools-linux.vsix
RUN chmod -R g+rwX /default-theia-plugins/cpptools-linux.vsix
