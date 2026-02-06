# Flutter Docker Base

A starting point for development with Flutter (Android) to be used 

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- **Docker Desktop** (Windows/macOS) or **Docker Engine** (Linux)
- **Git** for version control
- **VS Code** (recommended) with the Remote Development extension pack

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/sherburnec/Flutter-Docker-Base
```

### 2. Build the Docker Image

This step downloads and configures Flutter, Android SDK, and all dependencies. It takes 10-15 minutes on first run:

```bash
docker-compose build
```

### 3. Start the Development Container

```bash
docker-compose up -d
```

### 4. Verify the Container is Running

```bash
docker ps
```

You should see a container named `app-dev` in the list.

## Connecting VS Code to the Container

### Using the Command Palette

1. Open VS Code
2. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS)
3. Type "Dev-Containers: Attach to Running Container"
4. Select `app-dev`
5. Once connected, go to File → Open Folder and select `/workspace`

## Verifying Your Setup

Run Flutter doctor to check that everything is configured correctly:

```bash
flutter doctor -v
```

Checks should pass for Flutter base and Android. You will see an error that Chrome is not detected and this is not currently configured to support Linux development.

## Creating Your Flutter Project

If this is your first time setting up, create the Flutter project inside the container:

```bash
# In the VS Code terminal (connected to container)
cd /workspace
flutter create app
cd pp
flutter pub get
```

## Running the App

### Web Version (Recommended for Development)

```bash
flutter run -d web-server --web-port=8080
```

Then open your browser to `http://localhost:8080`

### Building for Android

```bash
flutter build apk
```

The APK will be in `build/app/outputs/flutter-apk/`

## Project Structure

```
app/
├── Dockerfile              # Defines the development environment
├── docker-compose.yml      # Container configuration
├── pubspec.yaml          # Flutter dependencies
└── README.md             # This file
```

## Development Environment Specifications

- **Base OS:** Ubuntu 24.04 LTS
- **Flutter:** Latest stable channel
- **Java:** OpenJDK 21
- **Android SDK Platform:** 36 (Android 15) and 34 (Android 14)
- **Android Build Tools:** 28.0.3 and 34.0.0

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev)
- [Docker Documentation](https://docs.docker.com)
- [VS Code Remote Development](https://code.visualstudio.com/docs/remote/containers)

## License

The MIT License (MIT)

Copyright (c) 2026 Charles Sherburne

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.