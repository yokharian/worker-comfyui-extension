# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.8.5-base

# install system build deps needed by llama-cpp-python and many extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git cmake pkg-config \
    libopenblas-dev liblapack-dev libffi-dev libssl-dev libomp-dev \
 && rm -rf /var/lib/apt/lists/*

RUN uv pip install llama-cpp-python

# install custom nodes using comfy-cli
RUN comfy-node-install \
 ComfyUI-Manager \ 
 ComfyUI-Impact-Pack \ 
 ComfyUI-Impact-Subpack \ 
 ComfyUI-Easy-Use \ 
 ComfyUI_UltimateSDUpscale \ 
 rgthree-comfy \ 
 ComfyUI-Image-Saver \ 
 ComfyUI-KJNodes \ 
 ComfyUI-Lora-Manager \ 
 ComfyUI-Custom-Scripts \ 
 ComfyUI-FBCNN \ 
 comfyui_controlnet_aux \ 
 ComfyUI_IPAdapter_plus \ 
 ComfyUI-ppm \ 
 ComfyUI-QwenVL

# Install a custom node and pin setuptools version to make ‘pkg_resources’ available
RUN uv pip install --upgrade "setuptools<70"
RUN comfy-node-install z-tipo-extension
RUN uv pip install --upgrade setuptools

# Go back to the root
WORKDIR /

# Add application code
ADD handler.py ./

# Change working directory to ComfyUI
WORKDIR /comfyui
