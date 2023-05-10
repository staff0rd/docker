FROM runpod/pytorch:3.10-2.0.0-117

RUN apt update && apt upgrade -y && apt install ffmpeg -y
RUN pip install --upgrade pip

WORKDIR /workspace
RUN git clone https://github.com/vladmandic/automatic

WORKDIR /workspace/automatic
RUN pip install -r requirements.txt

RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

RUN mkdir models/Stable-diffusion
RUN wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors -O /workspace/automatic/models/Stable-diffusion/v1-5-pruned-emaonly.safetensors

RUN python installer.py

EXPOSE 8145
