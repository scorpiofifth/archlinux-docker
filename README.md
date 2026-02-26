# Arch Linux Docker

最小化的 Arch Linux Docker 镜像。

## 构建镜像

### 本地构建

```bash
docker build -t archlinux-minimal .
```

### GitHub Actions 自动构建

推送 `v*` 格式的标签（如 `v1.0.0`）会自动触发构建并发布到 Release。

## 运行容器

```bash
docker run -it archlinux-minimal
```

## 从 Release 导入镜像

1. 下载 `archlinux-minimal.tar.gz` 文件
2. 解压并导入：

```bash
gunzip archlinux-minimal.tar.gz
docker load -i archlinux-minimal.tar
```

3. 运行：

```bash
docker run -it archlinux-minimal
```
