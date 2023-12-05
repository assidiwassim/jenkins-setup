FROM jenkins/jenkins:lts

# Switch to root to install necessary packages
USER root

# Install packages if needed
# RUN apt-get update && \
#     apt-get install -y <package-name> && \
#     rm -rf /var/lib/apt/lists/*

# Get the host user UID
ARG host_user_uid=0

# Set the Jenkins user UID
RUN usermod -u ${host_user_uid} jenkins

# Switch back to the Jenkins user
USER jenkins
