
FROM tensorflow/tensorflow:devel-gpu

ENV TZ=America/Recife

ENV LANG C.UTF-8

COPY ./../tf-models /tf-models
WORKDIR /tf-models

RUN apt-get update && apt-get install -y python3-dev python3-pip git

RUN pip install --no-cache-dir --upgrade pip setuptools

RUN pip install tensorflow tqdm
RUN pip install numpy opencv-python \
jupyter pandas scikit-learn matplotlib Pillow tensorboard wandb

RUN python3 --version



