# Arch Linux for Distrobox

最小化的 Arch Linux Docker 镜像，专为 Distrobox 设计。

## 构建镜像

### 本地构建

```bash
docker build -t archlinux-for-distrobox .
```

### GitHub Actions 自动构建

推送到 master 分支（仅当 Dockerfile 改动时）或手动触发 workflow 会自动构建并发布到 Release。

#### 开启 Release 权限

首次使用前，需要在 GitHub 仓库中开启 Actions 的写入权限：

1. 进入 **Settings** → **Actions** → **General**
2. 找到 **Workflow permissions**
3. 选择 **Read and write permissions**
4. 保存

这样 Actions 才能创建和更新 Release。

## 运行容器

```bash
docker run -it archlinux-for-distrobox
```

## 从 Release 导入镜像

1. 下载 `archlinux-for-distrobox.tar.gz` 文件
2. 解压并导入：

```bash
gunzip archlinux-for-distrobox.tar.gz
docker load -i archlinux-for-distrobox.tar
```

3. 运行：

```bash
docker run -it archlinux-for-distrobox
```

## 常用 Docker 命令

### 容器操作

```bash
# 启动交互式容器
docker run -it archlinux-for-distrobox

# 启动容器并进入后台
docker run -d --name mycontainer archlinux-for-distrobox

# 进入运行中的容器
docker exec -it mycontainer bash

# 查看运行中的容器
docker ps

# 查看所有容器（包括已停止的）
docker ps -a

# 停止容器
docker stop mycontainer

# 启动已停止的容器
docker start mycontainer

# 删除容器
docker rm mycontainer
```

### 镜像操作

```bash
# 查看本地镜像
docker images

# 删除镜像
docker rmi archlinux-for-distrobox

# 导出镜像为文件
docker save -o archlinux-for-distrobox.tar archlinux-for-distrobox

# 从文件导入镜像
docker load -i archlinux-for-distrobox.tar
```

### 其他实用命令

```bash
# 查看容器日志
docker logs mycontainer

# 查看容器资源占用
docker stats mycontainer

# 复制文件到容器
docker copy file.txt mycontainer:/root/

# 复制文件从容器
docker cp mycontainer:/root/file.txt .
```
