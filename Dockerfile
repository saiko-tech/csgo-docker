FROM jlesage/baseimage-gui:debian-11

ENV APP_NAME="CS:GO" \
    XDG_CACHE_HOME=/csgo/xdg/cache \
    XDG_CONFIG_HOME=/csgo/xdg/config \
    XDG_DATA_HOME=/csgo/xdg/data \
    XDG_RUNTIME_DIR=/tmp/run/user/app \
    GAMEROOT=/opt/csgo \
    STEAM_RUNTIME_DIR=/opt/steam-runtime \
    GOLDBERG_LIBRARY_PATH=/opt/goldberg/linux/x86_64 \
    CSGO_START_SCRIPT=/csgo.sh \
    CSGO_LD_PRELOAD=/csgo-ld-preload/gameoverlayrenderer.so

RUN set -x && \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
      sudo \
      xterm \
      wget \
      unzip && \
    echo "========== Install Deps ==========" && \
    apt-get install -y --no-install-recommends \
      make \
      gnupg \
      xz-utils \
      libc6-i386 \
      libgl1:i386 \
      libxtst6:i386 \
      libxrandr2:i386 \
      libglib2.0-0:i386 \
      libgtk2.0-0:i386 \
      libpulse0:i386 \
      libva2:i386 \
      libbz2-1.0:i386 \
      libvdpau1:i386 \
      libva-x11-2:i386 \
      libcurl4-gnutls-dev:i386 \
      libopenal1:i386 \
      libsm6:i386 \
      libice6:i386 \
      libasound2-plugins:i386 \
      libsdl2-image-2.0-0:i386 \
      dbus \
      dbus-x11 \
      file \
      pulseaudio \
      pciutils \
      zenity \
      procps && \
    wget -q https://repo.steampowered.com/steamrt-images-scout/snapshots/latest-steam-client-general-availability/steam-runtime.tar.xz && \
    tar xf steam-runtime.tar.xz --directory=/opt && \
    wget -q -O goldberg.zip https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/2283908277/artifacts/download && \
    mkdir -p /opt/goldberg && \
    unzip goldberg.zip -d /opt/goldberg && \
    mkdir /csgo-ld-preload && \
    wget -q -O /csgo-ld-preload/gameoverlayrenderer.so https://github.com/saiko-tech/csgo-ld-preload/raw/main/gameoverlayrenderer.so && \
    echo "========== Clean up ==========" && \
    rm /var/lib/dpkg/statoverride && \
    apt-get remove -y && \
    apt-get autoremove -y && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /
