### Task 1: Introduction to Containerization

**Definition and Purpose of Containerization:**
Containerization is a method of packaging an application and its dependencies into a single, lightweight executable 
unit called a container. This ensures that the application runs consistently across different environments. 
Containers are isolated from each other and the host system, providing a consistent runtime environment.

**Advantages of Containerization:**
1. **Portability:** Containers can run on any system that supports containerization, 
					making it easy to move applications between different environments.
2. **Scalability:** Containers are lightweight and can be easily scaled up or down to handle varying loads.
3. **Consistency:** Containers ensure that applications run the same way regardless of where they are deployed.
4. **Efficiency:** Containers use fewer resources compared to virtual machines, leading to better resource utilization.

**Comparison of Containerization vs. Virtualization:**
- **Isolation:** Virtual machines (VMs) provide complete isolation with their own operating system, 
				 while containers share the host OS kernel.
- **Resource Utilization:** Containers are more lightweight and use fewer resources compared to VMs.
- **Startup Time:** Containers start up faster than VMs because they do not need to boot an entire operating system.
- **Use Cases:** VMs are suitable for running multiple operating systems on a single host, while containers are ideal
				 for microservices and applications that need to be deployed consistently across different 
				 environments.

### Task 2: Understanding Docker and Container Basics

**Docker Installation:**
1. Follow the [official Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.
2. After installation, run `docker --version` to verify the installation.
3. Provide a screenshot showing Docker running successfully.

**Docker Architecture and Components:**
Docker uses a client-server architecture:
- **Docker Daemon:** The server component that manages Docker objects like images, containers, networks, and volumes.
- **Docker Client:** The command-line interface (CLI) that users interact with to send commands to the Docker daemon.
- **Docker Images:** Read-only templates used to create Docker containers.
- **Docker Containers:** Lightweight, standalone, and executable packages that include everything needed to run a piece of software.
- **Docker Registries:** Repositories where Docker images are stored and distributed. Docker Hub is the default public registry.

### Task 3: Hands-On Practical with Docker


**Creating a Dockerfile:**
0. **git clone https://github.com/josephifekwe97/my-app.git
	cd my-app**
**
# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install the necessary dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 3000
EXPOSE 8000

# Define the command to run the application
CMD ["npm", "start"]

# To run the container, use the following command:
# docker run -p 3000:3000 my-app 
**
	
1. **Use an official base image:** `FROM node:14`
2. **Copy application code:** `COPY . /app`
3. **Install dependencies:** `RUN npm install`
4. **Expose a port:** `EXPOSE 3000`
5. **Define a CMD:** `CMD ["npm", "start"]`

**Build and Run Docker Image:**
- **Build:** `docker build -t my-app .`
- **Run:** `docker run -p 3000:3000 my-app`
		   `docker run -p 3000:3000 my-app`

**Managing Docker Containers:**
- **List containers:** `docker ps -a`
- **Start a container:** `docker start <container_id>`
- **Stop a container:** `docker stop <container_id>`
- **Remove a container:** `docker rm <container_id>`

### Task 4: Container Orchestration and Networking

**Docker Networking Models:**
1. **Bridge Network:** Default network driver, suitable for standalone containers.
2. **Host Network:** Shares the host’s networking namespace.
3. **Overlay Network:** Used for multi-host networking, typically in swarm mode.

**Hands-On Networking:**
- **Create a bridge network:** `docker network create my-bridge-network`
- **Run containers on this network:** `docker run -d --name container1 --network my-bridge-network my-app`
- **Verify communication:** Use `docker exec -it my_container /bin/bash` to run commands inside the containers 
							and test connectivity: Use `docker exec my_container ls /app`

### Task 5: Docker Networking and Storage

**Custom Network Configuration:**
- **Set up a custom network:** `docker network create --driver bridge my-custom-network`
- **Run a container with this network:** `docker run -d --name my-container --network my-custom-network my-app`

**Persistent Storage Solutions:**
- **Volumes:** Managed by Docker, suitable for sharing data between containers.
- **Bind Mounts:** Maps a host directory to a container directory.

**Create a Docker Container with a Mounted Volume:**
- **Run with volume:** `docker run -d -v my-volume:/app/data my-app`
					   `docker run -d --name=my_volume_container -v my_volume:/data busybox`

- **Verify data persistence:** Check data in `/app/data` after container restart.
							   docker exec -it my_volume_container sh
							   echo "Hello, Docker!" > /data/hello.txt
							   exit
							   docker stop my_volume_container
							   docker rm my_volume_container
							   docker run -d --name=my_volume_container -v my_volume:/data busybox
							   docker exec -it my_volume_container cat /data/hello.txt

### Submission

**Documentation:**
- Combine all written reports and explanations into a single PDF document.
- Ensure all code snippets, commands, and explanations are clearly formatted.

**Code and Configurations:**
- Submit all relevant Dockerfiles, scripts, and configuration files.

**Screenshots:**
- Include screenshots for Docker installations and running containers.

