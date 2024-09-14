FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

# title
ENV TITLE=AnyType

ARG ANYTYPE_VERSION=0.42.8

COPY /anytype.png /usr/share/icons/hicolor/scalable/apps/anytype.png

RUN \
    echo "**** install ****" && \
    apt-get update && \
    apt-get install -y \
    adwaita-icon-theme \
    at-spi2-common \
    at-spi2-core \
    dconf-gsettings-backend \
    dconf-service \
    gsettings-desktop-schemas \
    gtk-update-icon-cache \
    hicolor-icon-theme \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcolord2 \
    libdconf1 \
    libgtk-3-0 \
    libgtk-3-bin \
    libgtk-3-common \
    librsvg2-common \
    libsecret-1-0 \
    libsecret-common \
    fonts-wqy-zenhei && \
    curl -fsSL "https://github.com/anyproto/anytype-ts/releases/download/v${ANYTYPE_VERSION}/anytype_${ANYTYPE_VERSION}_amd64.deb" -o "anytype_${ANYTYPE_VERSION}_amd64.deb" && \
    dpkg -i "/tmp/anytype_${ANYTYPE_VERSION}_amd64.deb" && \
    echo "**** cleanup ****" && \
    apt-get clean && \
    rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
VOLUME /config/.config/anytype