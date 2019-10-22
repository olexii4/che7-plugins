FROM quay.io/podman/stable:v1.5.0

RUN dnf -y install mc

RUN adduser user

COPY ./src/entrypoint.sh /
COPY ./src/docker.sh /usr/local/bin/docker

# Set permissions on /etc/passwd and /home to allow arbitrary users to write
RUN chgrp -R 0 /home && chmod -R g=u /etc/passwd /home && chmod +x /entrypoint.sh /usr/local/bin/docker

USER user

ENV HOME=/home/user

WORKDIR /projects

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["tail", "-f", "/dev/null"]