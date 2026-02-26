FROM archlinux:latest

# RUN echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm \
    bash-completion \
    bc \
    curl \
    diffutils \
    findutils \
    glibc \
    glibc-locales \
    gnupg \
    iputils \
    inetutils \
    keyutils \
    less \
    lsof \
    man-db \
    man-pages \
    mlocate \
    mtr \
    ncurses \
    nss-mdns \
    openssh \
    pigz \
    pinentry \
    procps-ng \
    rsync \
    shadow \
    sudo \
    tcpdump \
    time \
    traceroute \
    tree \
    tzdata \
    unzip \
    util-linux \
    util-linux-libs \
    vte-common \
    wget \
    words \
    xorg-xauth \
    zip \
    mesa \
    vulkan-intel \
    vulkan-radeon \
    git \
    base-devel && \
    pacman -Scc --noconfirm

RUN useradd -m builder && \
    chown builder /tmp && \
    cd /tmp && \
    git clone --depth 1 https://aur.archlinux.org/yay-bin.git && \
    chown -R builder:builder /tmp/yay-bin && \
    su builder -c "cd /tmp/yay-bin && makepkg -s --noconfirm" && \
    pacman -U /tmp/yay-bin/yay-bin-*.pkg.tar.zst --noconfirm && \
    rm -rf /tmp/yay-bin && \
    userdel -r builder && \
    pacman -Scc --noconfirm

ENV LANG=C.UTF-8

CMD ["/bin/bash"]
