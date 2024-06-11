
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

ENV TZ=America/Recife

ENV LANG C.UTF-8

COPY ./../segmentation/unet /unet

WORKDIR /unet

RUN apt-get update && apt-get install -y python3-dev python3-pip git

RUN pip3 install --no-cache-dir --upgrade pip setuptools

RUN pip3 install numpy==1.25.1
RUN pip3 install matplotlib==3.7.2
RUN pip3 install opencv_python==4.8.0.76
RUN pip3 install opencv_python_headless==4.8.0.76
RUN pip3 install albumentations==1.3.1
RUN pip3 install tensorboard==2.14.0 
