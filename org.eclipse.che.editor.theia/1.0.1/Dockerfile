FROM node:8.12-alpine

RUN apk add --update --no-cache mc gdb make gcc g++ python curl git

RUN cd /home && git clone https://github.com/theia-ide/theia.git
RUN cd /home/theia && git checkout v0.3.19
RUN mkdir /home/theia/plugins && mkdir /home/theia/extension


RUN cd /home && git clone https://github.com/eclipse/che-theia-dashboard-extension.git
RUN cd /home/che-theia-dashboard-extension && git checkout master
RUN cp -R /home/che-theia-dashboard-extension/theia-dashboard-extension /home/theia/extension/theia-dashboard-extension
RUN sed -i 's/"version": "0.0.1"/"version": "0.3.19"/g' /home/theia/extension/theia-dashboard-extension/package.json
RUN yarn --cwd /home/theia/extension/theia-dashboard-extension
RUN ln -s /home/theia/extension/theia-dashboard-extension /home/theia/packages/@che-theia-dashboard-extension


RUN cd /home && git clone https://github.com/eclipse/che-theia.git
RUN cd /home/che-theia && git checkout master

RUN cp -R /home/che-theia/extensions/eclipse-che-theia-terminal /home/theia/extension/eclipse-che-theia-terminal
RUN sed -i 's/"version": "0.0.1"/"version": "0.3.19"/g' /home/theia/extension/eclipse-che-theia-terminal/package.json
RUN yarn --cwd /home/theia/extension/eclipse-che-theia-terminal
RUN ln -s /home/theia/extension/eclipse-che-theia-terminal /home/theia/packages/@che-che-theia-terminal

#RUN cp -R /home/che-theia/extensions/eclipse-che-theia-plugin /home/theia/extension/eclipse-che-theia-plugin
#RUN sed -i 's/"version": "0.0.1"/"version": "0.3.19"/g' /home/theia/extension/eclipse-che-theia-plugin/package.json
#RUN yarn --cwd /home/theia/extension/eclipse-che-theia-plugin
#RUN ln -s /home/theia/extension/eclipse-che-theia-plugin /home/theia/packages/@che-eclipse-che-theia-plugin

#RUN cp -R /home/che-theia/extensions/eclipse-che-theia-plugin-ext /home/theia/extension/eclipse-che-theia-plugin-ext
#RUN sed -i 's/"version": "0.0.1"/"version": "0.3.19"/g' /home/theia/extension/eclipse-che-theia-plugin-ext/package.json
#RUN yarn --cwd /home/theia/extension/eclipse-che-theia-plugin-ext
#RUN ln -s /home/theia/extension/eclipse-che-theia-plugin-ext /home/theia/packages/@che-eclipse-che-theia-plugin-ext

RUN cd /home/che-theia/plugins/containers-plugin && yarn install
RUN cp /home/che-theia/plugins/containers-plugin/eclipse_che_theia_containers_plugin.theia  /home/theia/plugins/eclipse_che_theia_containers_plugin.theia

#RUN sed -i 's/"examples\/\*"/"extensions\/\*",\n    "examples\/\*"/g' /home/theia/package.json
#RUN sed -i 's/"dependencies": {/"dependencies": {\n    "@eclipse-che\/theia-plugin-ext": "0.3.19",\n    "@eclipse-che\/theia-terminal": "0.3.19",\n    "@eclipse-che\/theia-dashboard-extension": "0.3.19",/g' /home/theia/examples/browser/package.json
RUN sed -i 's/"dependencies": {/"dependencies": {\n    "@eclipse-che\/theia-terminal": "0.3.19",\n    "@eclipse-che\/theia-dashboard-extension": "0.3.19",/g' /home/theia/examples/browser/package.json
RUN yarn --cwd /home/theia


RUN curl -L -o /home/theia/plugins/cpptools-linux.vsix https://github.com/Microsoft/vscode-cpptools/releases/download/0.21.0/cpptools-linux.vsix

EXPOSE 3100
ENTRYPOINT tail -f /dev/null

CMD ["yarn", "--cwd", "/home/theia/examples/browser", "start", "--hostname=0.0.0.0", "--port=3100"]