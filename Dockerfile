# 使用镜像
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/nvidia/cuda:12.4.1-devel-ubuntu20.04

# 阻止bulid镜像卡在交互式
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# 创建并设置为当前工作目录
RUN mkdir /app
WORKDIR /app

# 更新包列表并安装一些基础工具
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git \
    mercurial \
    subversion \
    && apt-get clean

# Anaconda安装脚本的URL
# ARG ANACONDA_URL=https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
# 下载并安装Anaconda
# RUN wget ${ANACONDA_URL} -O anaconda.sh && bash anaconda.sh -b -p /opt/conda && rm anaconda.sh

COPY Anaconda3-2023.03-1-Linux-x86_64.sh /app/anaconda.sh
RUN bash anaconda.sh -b -p /opt/conda && rm anaconda.sh

# 设置环境变量，使Anaconda的bin目录在PATH中
ENV PATH=/opt/conda/bin:$PATH

COPY requirements.txt /app/requirements.txt

# 安装依赖的python文件
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn

# 当你运行容器时，默认启动bash（或其他你希望的命令）
CMD ["/bin/bash"]

