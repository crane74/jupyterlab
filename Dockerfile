FROM python:3.9-bullseye

ARG DEBIAN_FRONTEND=noninteractive

# パッケージの追加とタイムゾーンの設定
# 必要に応じてインストールするパッケージを追加
RUN apt update \
    && apt upgrade -y \
    && apt install -y tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Tokyo

COPY requirements.txt /tmp
RUN python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt
