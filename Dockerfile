# Start Ubuntu 24.04 LTS as base image
FROM ubuntu:24.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Set up environment variables
ENV ANDROID_HOME=/opt/android-sdk
ENV FLUTTER_HOME=/opt/flutter
ENV PATH="$FLUTTER_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# Install system dependencies
# Get tools for Flutter and Android development to work properly
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    openjdk-21-jdk \
    libglu1-mesa \
    nano \
    vim \
    # Clean up package cache to keep image size smaller
    && rm -rf /var/lib/apt/lists/*

# Download and install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 $FLUTTER_HOME

# Download and set up Android command line tools
RUN mkdir -p $ANDROID_HOME/cmdline-tools && \
    cd $ANDROID_HOME/cmdline-tools && \
    curl -o commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip commandlinetools.zip && \
    rm commandlinetools.zip && \
    mv cmdline-tools latest

# Accept Android licenses
RUN yes | sdkmanager --licenses

# Install Android SDK components for building Flutter apps
RUN sdkmanager "platform-tools" \
    "platforms;android-36" \
    "platforms;android-34" \
    "build-tools;28.0.3" \
    "build-tools;34.0.0"

# Run Flutter doctor
RUN flutter doctor -v

# Pre-download Flutter dependencies
RUN flutter precache

# Set the working directory in container
WORKDIR /workspace

# Configure git to trust the workspace directory
RUN git config --global --add safe.directory /workspace

# The default command when the container starts
CMD ["/bin/bash"]