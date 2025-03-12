# Use the official Ubuntu 20.04 image
FROM ubuntu:20.04

# Set the environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install any necessary packages
RUN apt-get update && \
    apt-get install -y \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the default command to run when the container starts
CMD ["/bin/bash"]
