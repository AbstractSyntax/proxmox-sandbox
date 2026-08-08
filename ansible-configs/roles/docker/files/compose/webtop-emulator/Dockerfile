FROM lscr.io/linuxserver/webtop:ubuntu-kde

USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends flatpak ca-certificates \
 && flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo \
 && flatpak install -y flathub net.pcsx2.PCSX2 \
 && flatpak install -y flathub org.DolphinEmu.dolphin-emu \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
