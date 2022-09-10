#!/bin/bash
python3 -m venv .venv
source .venv/bin/activate


git clone -b apple-silicon-mps-support https://github.com/bfirsh/stable-diffusion.git
cd stable-diffusion
mkdir -p models/ldm/stable-diffusion-v1

# register and download the weights
# visit: https://huggingface.co/CompVis/stable-diffusion-v-1-4-original

mkdir -p model_store
cd model_store
git clone https://huggingface.co/CompVis/stable-diffusion-v-1-4-original
cd -
ln -s ${PWD}/model_store/sd-v1-4.ckpt stable-diffusion/models/ldm/stable-diffusion-v1/model.ckpt


pip install --upgrade pip
pip install -r requirements.txt

# run
cd stable-diffusion
python scripts/txt2img.py --prompt "mountain top with aliens wearing sweaters" --n_samples 1 --n_iter 1 --plms
