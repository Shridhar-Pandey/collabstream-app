

# CollabStream

## Description
**CollabStream** is a real-time collaboration platform that enables users to share their screens and stream video seamlessly. It includes chat, audio control, and remote management features to enhance online meetings and collaboration.

## For demo video please see in the src folder. 
=

## Features
- **Screen Sharing**: Share your screen in real-time with other users.
- **Video Streaming**: Stream live video to participants in the room.
- **Chat**: Communicate with others via the in-app chat feature.
- **Remote Audio Control**: Control and adjust audio remotely during sessions.
- **Volume Adjustment**: Set volume levels for an optimal experience.

---

## Requirements
- **Node.js**
- **Socket.io**
- **Docker** (for containerized deployment)

---

## Setup Instructions

### 1. Cloning the Repository
```bash
git clone https://github.com/yourusername/collabstream.git
cd collabstream
```

### 2. Generating SSL Certificates
To run this project with HTTPS, you'll need SSL certificates. You can use a certificate from a trusted authority or create a self-signed certificate (suitable for local testing).

#### Create a Self-Signed SSL Certificate (for Development)
If you don’t already have SSL certificates, you can create self-signed certificates using OpenSSL:

```bash
openssl req -x509 -newkey rsa:4096 -keyout private-key.txt -out ca-bundle.txt -days 365 -nodes
```

This command generates:
- `private-key.txt`: Your private key.
- `ca-bundle.txt`: The self-signed certificate.

---

## Docker Setup

### 3. Build the Docker Image
In the project directory, create a Docker image using the following command:

```bash
docker build -t collabstream-app .
```

### 4. Run the Docker Container with SSL Certificates
Run the Docker container and mount the SSL certificates to the correct paths:

```powershell
docker run -it -p 443:443 `
  -v "<PATH>\private-key.txt:/app/private-key.txt" `
  -v "<PATH>\ca-bundle.txt:/app/ca-bundle.txt" `
  collabstream-app
```

> **Note:** On Windows PowerShell, use backticks (`\``) for line continuation. On Linux or macOS, use backslashes (`\`).

This command:
- Maps port `443` on your local machine to port `443` in the container.
- Mounts the `private-key.txt` and `ca-bundle.txt` SSL certificate files to the `/app` directory in the container.

---

## Usage

1. **Access the Application**:
   - Once the container is running, open your browser and navigate to `https://localhost` (or `https://<your-local-IP>` if testing on other devices on the same network).

2. **Join a Room**:
   - Enter a room name and click "Join Room" to start sharing your screen and collaborating in real-time.

3. **Testing on Multiple Devices**:
   - You can open the application on multiple devices connected to the same network and join the same room for collaborative testing.

---

## Stopping the Docker Container

To stop the container, use one of the following methods:

1. **Using the Container Name or ID**:
   - First, list running containers to find the container name or ID:
     ```powershell
     docker ps
     ```
   - Then, stop the container using the container name (e.g., `festive_nash`) or container ID (e.g., `c7c79ba2010a`):
     ```powershell
     docker stop <container-name-or-id>
     ```
   - Example:
     ```powershell
     docker stop festive_nash
     ```

2. **Stopping All Containers** (Optional):
   - To stop all running containers at once, use:
     ```powershell
     docker stop $(docker ps -q)
     ```

---

## Troubleshooting

- **Error: ENOENT: no such file or directory, open '/app/private-key.txt'**: Ensure `private-key.txt` and `ca-bundle.txt` are in the correct path and mounted correctly in the Docker run command.
- **Permission Denied Errors**: On Windows, make sure Docker has permission to access the directory where your SSL certificates are stored.
- **SSL Certificate Warnings**: Self-signed certificates will show warnings in the browser. For production, consider using a certificate from a trusted authority.

---

## License
This project is licensed under the MIT License.

For more information, visit the project repository on GitHub: [CollabStream on GitHub](https://github.com/yourusername/collabstream)

