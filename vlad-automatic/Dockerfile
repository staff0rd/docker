FROM runpod/pytorch:3.10-2.0.0-117

RUN apt update && apt upgrade -y && apt install ffmpeg -y
RUN pip install --upgrade pip

WORKDIR /workspace
RUN git clone https://github.com/vladmandic/automatic

WORKDIR /workspace/automatic
RUN pip install -r requirements.txt

RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

RUN python installer.py

RUN mkdir models/Stable-diffusion
WORKDIR /workspace

RUN wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors -O /workspace/automatic/models/Stable-diffusion/v1-5-pruned-emaonly.safetensors
RUN wget https://civitai.com/api/download/models/46846 -O /workspace/automatic/models/Stable-diffusion/rev-animated.safetensors

RUN mkdir automatic/models/VAE
RUN wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt -O /workspace/automatic/models/VAE/vae-ft-mse-840000-ema-pruned.ckpt

WORKDIR /workspace/automatic/extensions-builtin/sd-webui-controlnet/models

RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_ip2p.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_shuffle.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_mlsd.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_normalbae.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15s2_lineart_anime.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_scribble.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_seg.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge.pth

WORKDIR /workspace/automatic/extensions
RUN git clone https://github.com/ilian6806/stable-diffusion-webui-state

COPY ./styles.csv /workspace/automatic/styles.csv

WORKDIR /workspace

