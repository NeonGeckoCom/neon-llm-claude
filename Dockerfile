FROM python:3.9-slim

LABEL vendor=neon.ai \
    ai.neon.name="neon-llm-claude"

ENV OVOS_CONFIG_BASE_FOLDER=neon
ENV OVOS_CONFIG_FILENAME=diana.yaml
ENV OVOS_DEFAULT_CONFIG=/opt/neon/diana.yaml
ENV XDG_CONFIG_HOME=/config
ENV CHATBOT_VERSION=v2

COPY docker_overlay/ /

WORKDIR /app
COPY . /app
RUN pip install /app

CMD [ "neon-llm-claude" ]