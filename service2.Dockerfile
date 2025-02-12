FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Copy the project into the image
ADD src/service2 /app
COPY src/common /app/common

# Sync the project into a new environment, using the frozen lockfile
WORKDIR /app
RUN uv lock
RUN uv sync --frozen

CMD ["uv", "run", "main.py"]