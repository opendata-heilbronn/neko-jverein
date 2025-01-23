ARG BASE_IMAGE=m1k1o/neko:xfce
FROM $BASE_IMAGE

ARG HIBISCUS_INSTALL_SCRIPT="https://hibiscus-setup.derrichter.de/Jameica-Hibiscus_Linux_x64-Installer.run"


RUN set -eux;  \
    apt-get update; \
    apt-get install -y --no-install-recommends  \
        openbox \
        xz-utils  \
        bzip2  \
        libgtk-3-0  \
        libdbus-glib-1-2 \
        default-jre-headless \
        curl \
        procps \
        sudo \
    ; \
    curl -sSL -o jameica-installer.run $HIBISCUS_INSTALL_SCRIPT; \
    chmod +x jameica-installer.run; \
    echo "63bd6a7e804e5c43ac11e9878524f549d25552967262ca6a256f1c956a726d34 jameica-installer.run" | sha256sum --check

RUN ./jameica-installer.run --noexec --target ./jameica; \
    cd jameica; \
    sed -i '6,13d' setup.sh; \
    sed -i 's/Pause//g' setup.sh; \
    ./setup.sh;

COPY supervisord.conf /etc/neko/supervisord/jameica.conf
