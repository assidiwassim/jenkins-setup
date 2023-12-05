# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install necessary packages
USER root

# Install sudo package
RUN apt-get update && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*

# Get the host user UID
ARG host_user_uid=1000

# Set the Jenkins user UID
RUN usermod -u ${host_user_uid} jenkins

# Allow jenkins user to run Docker commands without password
RUN echo "jenkins ALL=(ALL) NOPASSWD: /usr/bin/docker" >> /etc/sudoers

# Switch back to the Jenkins user
USER jenkins
