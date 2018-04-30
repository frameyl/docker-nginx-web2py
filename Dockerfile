FROM madharjan/docker-nginx:1.4.6
MAINTAINER Chris Yang <frameyl@163.com>

ARG VCS_REF
ARG WEB2PY_VERSION
ARG WEB2PY_MIN=false
ARG DEBUG=false

LABEL description="Docker container for Nginx with Web2py" os_version="Ubuntu ${UBUNTU_VERSION}" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/madharjan/docker-nginx-web2py"

ENV WEB2PY_VERSION ${WEB2PY_VERSION}
ENV WEB2PY_MIN ${WEB2PY_MIN}
ENV CERT_PASS web2py
ENV CERT_DOMAIN www.spirent.com

RUN mkdir -p /build
COPY . /build

RUN /build/scripts/install.sh && /build/scripts/cleanup.sh

VOLUME ["/opt/web2py/applications", "/var/log/nginx"]

CMD ["/sbin/my_init"]

EXPOSE 80 443
