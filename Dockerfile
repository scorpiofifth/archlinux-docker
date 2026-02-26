FROM archlinux:latest

# 更换为中科大镜像源
RUN echo "Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

# 更新包数据库并安装软件
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

# 安装 yay (AUR 助手)
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

# 设置基础环境
ENV LANG=C.UTF-8

# 默认命令
CMD ["/bin/bash"]
