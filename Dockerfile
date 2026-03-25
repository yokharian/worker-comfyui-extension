# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.8.5-base

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
 z-tipo-extension \ 
 ComfyUI-ppm \ 
 ComfyUI-QwenVL

# Go back to the root
WORKDIR /

# Add application code
ADD handler.py ./

# Change working directory to ComfyUI
WORKDIR /comfyui
