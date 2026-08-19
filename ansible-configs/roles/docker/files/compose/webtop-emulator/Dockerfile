FROM lscr.io/linuxserver/webtop:ubuntu-kde

USER root

ENV PCSX2_APPIMAGE_URL="https://github.com/PCSX2/pcsx2/releases/download/v2.7.519/pcsx2-v2.7.519-linux-appimage-x64-Qt.AppImage"

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && mkdir -p /opt/emulators/pcsx2 \
    && curl -fsSL -o /tmp/pcsx2.AppImage "${PCSX2_APPIMAGE_URL}" \
    && chmod +x /tmp/pcsx2.AppImage \
    && cd /opt/emulators/pcsx2 \
    && /tmp/pcsx2.AppImage --appimage-extract \
    && printf '%s\n' \
        '#!/bin/sh' \
        'unset WAYLAND_DISPLAY' \
        'export QT_QPA_PLATFORM=xcb' \
        'export SDL_VIDEODRIVER=x11' \
        'export GDK_BACKEND=x11' \
        'if [ -f /usr/share/vulkan/icd.d/lvp_icd.x86_64.json ]; then' \
        '  export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json' \
        '  export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json' \
        'elif [ -f /usr/share/vulkan/icd.d/lvp_icd.json ]; then' \
        '  export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.json' \
        '  export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/lvp_icd.json' \
        'fi' \
        'exec /opt/emulators/pcsx2/squashfs-root/AppRun "$@"' \
        > /usr/local/bin/pcsx2 \
    && chmod +x /usr/local/bin/pcsx2 \
    && rm -f /tmp/pcsx2.AppImage \
    && rm -rf /var/lib/apt/lists/*
