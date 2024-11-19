# 使用 Ubuntu 22.04 LTS 作为基础镜像
FROM ubuntu:22.04

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive

# 更新 apt-get 并安装必要的依赖
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# 安装 Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -f -p /opt/conda && \
    rm miniconda.sh && \
    /opt/conda/bin/conda init bash

# 设置 conda 环境路径
ENV PATH=/opt/conda/bin:$PATH

# 安装 Jupyter Lab
RUN conda install -y jupyterlab

# 创建工作目录
WORKDIR /workspace

# 暴露 Jupyter Lab 默认端口
EXPOSE 8888

# 启动 Jupyter Lab，设置根目录为工作目录，禁用浏览器，禁用 token
CMD ["sh", "-c", "nohup jupyter lab --ip=0.0.0.0 --allow-root --notebook-dir=/ --no-browser > /workspace/jupyter_lab.log 2>&1"]
