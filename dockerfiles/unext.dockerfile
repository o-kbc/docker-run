
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

ENV TZ=America/Recife

ENV LANG C.UTF-8

COPY ./segmentation/unext /unext

WORKDIR /unext

RUN apt-get update && apt-get install -y python3-dev python3-pip git

RUN pip install --no-cache-dir --upgrade pip setuptools

RUN pip install numpy timm opencv-python \
jupyter pandas scikit-learn matplotlib
RUN pip install mmcv
RUN pip install albumentations==1.0.3

RUN python3 --version



