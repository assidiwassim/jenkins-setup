# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install necessary packages
USER root

# Install sudo package
RUN apt-get update && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*
