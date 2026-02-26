FROM archlinux:base

# 更新包数据库并清理缓存
RUN pacman -Syu --noconfirm && \
    pacman -Scc --noconfirm

# 设置基础环境
ENV LANG=en_US.UTF-8

# 默认命令
CMD ["/bin/bash"]
