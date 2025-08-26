# Dockerfile for testing dotfiles installation
FROM ubuntu:22.04

# Install essential packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    stow \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/bash testuser
USER testuser
WORKDIR /home/testuser

# Copy dotfiles
COPY --chown=testuser:testuser . ./dotfiles

# Test installation
RUN cd dotfiles && \
    stow . && \
    echo "Installation test completed successfully"

# Default command
CMD ["/bin/bash"]