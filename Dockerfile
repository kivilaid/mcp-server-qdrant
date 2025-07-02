FROM python:3.11-slim

WORKDIR /app

# Install uv for package management
RUN pip install --no-cache-dir uv

# Install the mcp-server-qdrant package
RUN uv pip install --system --no-cache-dir mcp-server-qdrant

# Expose the default port for SSE transport
EXPOSE 8000

# Set environment variables with defaults that can be overridden at runtime
ENV QDRANT_URL="https://qdrant.insly.tech/"
ENV QDRANT_API_KEY="BJmH89qN3kIIrjcm9Ah5vtRBQkqEGuQO"
ENV COLLECTION_NAME="socrates"
ENV EMBEDDING_MODEL="sentence-transformers/all-MiniLM-L6-v2"

# Run the server with SSE transport
CMD uvx mcp-server-qdrant --transport sse
