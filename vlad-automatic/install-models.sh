cd /workspace/automatic
mkdir models/Stable-diffusion
wget https://civitai.com/api/download/models/46846 -O /workspace/automatic/models/Stable-diffusion/rev-animated.safetensors

mkdir models/VAE
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt -O /workspace/automatic/models/VAE/vae-ft-mse-840000-ema-pruned.ckpt

mkdir automatic/models/ESRGAN
wget https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth -O /workspace/automatic/models/ESRGAN/4x-UltraSharp.pth

cd /workspace/automatic/extensions
git clone https://github.com/Coyote-A/ultimate-upscale-for-automatic1111
git clone https://github.com/yankooliveira/sd-webui-photopea-embed
git clone https://github.com/hako-mikan/sd-webui-regional-prompter
git clone https://github.com/fkunn1326/openpose-editor
git clone https://github.com/adieyal/sd-dynamic-prompts

mkdir /workspace/automatic/models/embeddings
cd /workspace/automatic/models/embeddings

wget https://civitai.com/api/download/models/9208 -O easynegative.safetensors
wget https://huggingface.co/yesyeahvh/bad-hands-5/resolve/main/bad-hands-5.pt
wget https://civitai.com/api/download/models/77173 -O UnrealisticDream.pt
wget https://civitai.com/api/download/models/77169 -O BadDream.pt
wget https://civitai.com/api/download/models/76712 -O FastNegativeEmbedding.pt

cd /workspace/automatic/extensions-builtin/sd-webui-controlnet
git pull

cd /workspace/automatic
git pull