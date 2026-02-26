# Arch Linux Docker

最小化的 Arch Linux Docker 镜像。

## 构建镜像

### 本地构建

```bash
docker build -t archlinux .
```

### GitHub Actions 自动构建

推送到 main/master 分支或手动触发 workflow 会自动构建并发布到 Release。

#### 开启 Release 权限

首次使用前，需要在 GitHub 仓库中开启 Actions 的写入权限：

1. 进入 **Settings** → **Actions** → **General**
2. 找到 **Workflow permissions**
3. 选择 **Read and write permissions**
4. 保存

这样 Actions 才能创建和更新 Release。

## 运行容器

```bash
docker run -it archlinux
```

## 从 Release 导入镜像

1. 下载 `archlinux.tar.gz` 文件
2. 解压并导入：

```bash
gunzip archlinux.tar.gz
docker load -i archlinux.tar
```

3. 运行：

```bash
docker run -it archlinux
```
