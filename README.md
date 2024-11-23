# Node.js Docker CI/CD Pipeline Project

A complete CI/CD pipeline project that automates the build, test, and deployment of a Node.js application using GitHub Actions, Docker, and AWS EC2.

## 🚀 Features

- Automated CI/CD pipeline with GitHub Actions
- Docker containerization
- Automated semantic versioning
- Multi-platform Docker builds (linux/amd64, linux/arm64)
- Automated deployment to AWS EC2
- Container health monitoring
- Docker layer caching
- Secure secret management
- Automatic cleanup processes

## 📋 Prerequisites

- Node.js 18 or higher
- Docker
- GitHub account
- Docker Hub account
- AWS EC2 instance
- Git

# CI/CD Pipeline Configuration and Workflow

## 🔑 Configuration

### Required GitHub Secrets
The following secrets must be configured in the GitHub repository:

- **`DOCKER_USERNAME`**: Your Docker Hub username.
- **`DOCKER_PASSWORD`**: Your Docker Hub password or access token.
- **`AWS_SSH_KEY`**: The SSH private key for accessing the AWS EC2 instance.
- **`AWS_HOST`**: The hostname or IP address of the AWS EC2 instance.
- **`DEPLOY_PORT`**: The port used for application deployment.

---

## 🔄 CI/CD Pipeline

### Workflow Triggers
The pipeline is triggered by the following events:
1. Pushes to the `main` branch.
2. Pull requests targeting the `main` branch.

### Pipeline Steps

#### 1. Code Checkout
- Fetches the repository code.
- Configures `git` with a shallow clone for efficiency.

#### 2. Version Management
- Automatically increments the application version number.
- Creates Git tags for the new version.
- Pushes the tags back to the repository.

#### 3. Docker Build & Push
- Configures Docker Buildx for multi-platform builds.
- Authenticates with Docker Hub using secrets.
- Builds Docker images for multiple platforms.
- Pushes the images to the Docker Hub registry.

#### 4. AWS EC2 Deployment
- Establishes SSH access to the EC2 instance.
- Pulls the latest Docker image from Docker Hub.
- Manages the Docker container lifecycle:
  - Stops and removes the old container.
  - Starts the new container with updated code.
- Performs health checks to ensure the application is running correctly.
- Implements automatic rollback in case of failure.

#### 5. Cleanup
- Deletes temporary SSH files.
- Prunes the Docker build cache to free up resources.

---

## 🐳 Docker Configuration

### Dockerfile Highlights
The Dockerfile is optimized for a lightweight Node.js application

---

## 🐳 Container Specifications
- **Base Image**: `node:18-alpine`
- **Exposed Port**: `3000`
- **Memory Limit**: `512MB`
- **CPU Limit**: `0.5 cores`
- **Auto-Restart Policy**: `Unless stopped`
- **Health Check**: Every 30 seconds

---

## 📱 Application

### Features
A lightweight Express.js application providing:
- **Root Endpoint (`/`)**: Responds with `"Hello, King Memo!"`.
- **Health Check Endpoint (`/health`)**: Returns server status.

---

## 🔒 Security Features

### Security Measures
- **Secret Management**: Secured via GitHub Secrets.
- **SSH Key Protection**: Ensures secure access to servers.
- **Docker Hub Authentication**: Protects Docker image integrity.
- **Non-Root User**: Enhances container security.
- **Regular Updates**: Maintains the latest dependencies and base image versions.

---

## 🔍 Health Monitoring

### Monitoring Configuration
- **Frequency**: Health checks every 30 seconds.
- **Timeout**: 10 seconds per check.
- **Retries**: 3 attempts before marking the container as unhealthy.
- **Auto-Restart**: Automatically restarts on failure.

---

## 📦 Deployment

### Automatic Deployment
- **Trigger**: Automatically occurs when code is pushed to the `main` branch.
- **Workflow**:
  - Builds and pushes Docker images.
  - Deploys to the production environment with updated containers.

