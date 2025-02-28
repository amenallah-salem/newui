# Use the official Python image
FROM python:3.11

# Set the working directory inside the container
WORKDIR /app
#sudo apt-get install make cmake build-essentials python3 pip
# Install venv
RUN python -m pip install --upgrade pip && \
    python -m venv /venv

# Copy the .sh script to the container
COPY your_script.sh /app/your_script.sh

# Give execution permissions to the .sh script
RUN chmod +x /app/your_script.sh

# Run the .sh script
CMD ["/bin/bash", "/app/your_script.sh"]
