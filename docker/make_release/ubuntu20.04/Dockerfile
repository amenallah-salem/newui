
# Use the official Ubuntu 20.04 image
# use build args in the docker build command with --build-arg="BUILDARG=true"

ARG USE_CUDA=false
ARG USE_CUDA_VER=cu121
ARG BUILD_HASH=dev-build

FROM python:3.11-slim-bookworm AS base
ARG USE_CUDA=false
ARG USE_CUDA_VER=cu121
ARG BUILD_HASH=dev-build

# Set the environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install any necessary packages
RUN apt-get update && \
    apt-get install -y \
    bash && \
    # Install necessary packages
    apt-get install -y --no-install-recommends git build-essential pandoc netcat-openbsd curl && \
    apt-get install -y --no-install-recommends gcc python3-dev && \
    # for RAG OCR
    apt-get install -y --no-install-recommends ffmpeg libsm6 libxext6 && \
    # install helper tools
    apt-get install -y --no-install-recommends curl jq && \
    # cleanup
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app
# Copy the project files into the container
COPY . .
RUN chmod +x ./scripts/build_pycli@docker.sh
RUN ./scripts/build_pycli@docker.sh

CMD ["/bin/bash"]
