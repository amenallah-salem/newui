# Use the official Python image
FROM python:3.11

WORKDIR /app


RUN python -m pip install --upgrade pip && \
    python -m venv /venv
ENV PATH="/venv/bin:$PATH"

COPY requirements-dev.txt ./
RUN pip install -r requirements-dev.txt

COPY scripts /app/scripts

RUN chmod +x /app/scripts/build_start_front.sh
RUN chmod +x /app/scripts/init_back.sh
RUN chmod +x /app/scripts/start_back.sh
RUN chmod +x /app/scripts/start_servers.sh
RUN chmod +x /app/scripts/pull_models.sh 
RUN chmod +x /app/scripts/set_env.sh 

RUN ./scripts/build_start_front.sh
RUN ./scripts/pull_models.sh
RUN ./scripts/init_back.sh
RUN ./scripts/start_back.sh
RUN ./scripts/start_servers.sh
RUN ./scripts/start_servers.sh

CMD ["/bin/bash", "python --version"]
