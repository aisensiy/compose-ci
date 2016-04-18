FROM alpine:edge

COPY repositories /etc/apk/repositories

RUN apk add --no-cache \
    docker \
    py-pip \
    curl \
    unzip \
    aha@testing \
    bash \
    && pip install docker-compose awscli \
    && rm -rf \
        /tmp/* \
        /root/.cache \
        /var/cache/apk \
        $(find / -regex '.*\.py[co]')

EXPOSE 80
ENV DOCKER_HOST=unix://var/run/docker.sock

CMD ["python", "/httpd.py"]

COPY . /
