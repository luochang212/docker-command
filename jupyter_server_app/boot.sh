# 1. 检查 docker 环境是否正常
docker info

# 2. 构建镜像
docker build -t jupyter_server_image .

# 3. 测试容器
docker run \
    --rm \
    --gpus all \
    -it \
    --name jupyter_server_app \
    jupyter_server_image /bin/bash

# 4. 运行容器
docker run \
    --gpus all \
    --name jupyter_server_app \
    -d \
    -p 9999:8888 \
    -v $(pwd)/jupyter_workspace:/workspace \
    jupyter_server_image