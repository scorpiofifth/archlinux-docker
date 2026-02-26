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
    vulkan-radeon && \
    pacman -Scc --noconfirm

# 设置基础环境
ENV LANG=en_US.UTF-8
# ENV LC_ALL=en_US.UTF-8

# 默认命令
CMD ["/bin/bash"]
