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

RUN wget https://civitai.com/api/download/models/46846 -O /workspace/automatic/models/Stable-diffusion/rev-animated.safetensors

RUN mkdir automatic/models/VAE
RUN wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt -O /workspace/automatic/models/VAE/vae-ft-mse-840000-ema-pruned.ckpt

RUN mkdir /workspace/automatic/models/ESRGAN
RUN wget https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth -O /workspace/automatic/models/ESRGAN/4x-UltraSharp.pth

WORKDIR /workspace/automatic/extensions
RUN git clone https://github.com/Coyote-A/ultimate-upscale-for-automatic1111
RUN git clone https://github.com/danielgatis/rembg
RUN git clone https://github.com/yankooliveira/sd-webui-photopea-embed
RUN git clone https://github.com/hako-mikan/sd-webui-regional-prompter
RUN git clone https://github.com/fkunn1326/openpose-editor
RUN git clone https://github.com/adieyal/sd-dynamic-prompts

RUN mkdir /workspace/automatic/models/embeddings
WORKDIR /workspace/automatic/models/embeddings

RUN wget https://civitai.com/api/download/models/9208 -O easynegative.safetensors
RUN wget https://huggingface.co/yesyeahvh/bad-hands-5/resolve/main/bad-hands-5.pt
RUN wget https://civitai.com/api/download/models/77173 -O UnrealisticDream.pt
RUN wget https://civitai.com/api/download/models/77169 -O BadDream.pt
RUN wget https://civitai.com/api/download/models/76712 -O FastNegativeEmbedding.pt
RUN wget https://civitai.com/api/download/models/5637 -O /workspace/automatic/models/embeddings/ng_deepnegative_v1_75t.pt
RUN wget https://huggingface.co/zylux/orangechillmix/resolve/main/badhandsv5-neg.pt -O /workspace/automatic/models/embeddings/badhandsv5-neg.pt

WORKDIR /workspace/automatic/extensions-builtin/sd-webui-controlnet
RUN git pull

WORKDIR /workspace/automatic
COPY ./styles.csv /workspace/automatic/styles.csv
COPY ./start.sh /workspace/automatic/start.sh
RUN chmod +x ./start.sh
RUN git pull
RUN python installer.py

WORKDIR /workspace

