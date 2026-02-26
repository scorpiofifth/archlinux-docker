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
    git config --global user.email "builder@localhost" && \
    git config --global user.name "Builder" && \
    cd /tmp && \
    git clone --depth 1 --single-branch https://github.com/archlinux/aur.git -b yay-bin && \
    chown -R builder:builder /tmp/aur && \
    su builder -c "cd /tmp/aur && makepkg -s --noconfirm" && \
    pacman -U /tmp/aur/yay-bin-*.pkg.tar.zst --noconfirm && \
    rm -rf /tmp/aur && \
    userdel -r builder && \
    pacman -Scc --noconfirm

ENV LANG=C.UTF-8

CMD ["/bin/bash"]
