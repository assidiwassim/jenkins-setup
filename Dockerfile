FROM jenkins/jenkins:lts

# Switch to root to install necessary packages
USER root

RUN apt-get update \
    && apt-get install -y docker.io \
    && rm -rf /var/lib/apt/lists/*

# Get the host user UID
ARG host_user_uid=1000

# Set the Jenkins user UID
RUN usermod -u ${host_user_uid} jenkins

# Switch back to the Jenkins user
USER jenkins
