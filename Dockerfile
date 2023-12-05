# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install necessary packages
USER root

# Install packages if needed (adjust as per your requirements)
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

# Get the host user UID
ARG host_user_uid=1000

# Set the Jenkins user UID
RUN usermod -u ${host_user_uid} jenkins && \
    groupadd -g $(stat -c "%g" /var/run/docker.sock) docker && \
    usermod -aG docker jenkins

# Switch back to the Jenkins user
USER jenkins
