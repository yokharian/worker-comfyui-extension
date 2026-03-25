# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.8.5-base

# Go back to the root
WORKDIR /

# Add application code
ADD handler.py ./

# Change working directory to ComfyUI
WORKDIR /comfyui
