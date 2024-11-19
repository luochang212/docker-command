# 1. 检查 docker 环境是否正常
docker info

# 2. 构建镜像
docker build -t jupyter_server_app .

# 3. 运行容器
docker run -d -p 8888:8888 -v $(pwd)/jupyter_workspace:/workspace jupyter_server_app
