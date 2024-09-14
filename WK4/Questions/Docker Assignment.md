### **Assignment: Week 5 \- Containerization with Docker**

#### **Objective:**

By the end of this assignment, you will have a solid understanding of containerization with Docker, including its advantages, architecture, and practical implementation. You will gain hands-on experience in building, running, managing Docker containers, and understanding Docker networking and storage solutions.

#### **Instructions:**

Complete the following tasks by the end of the week. Submit your completed work via the provided submission platform, including any code, configuration files, and a written report detailing your findings and reflections.

### **Task 1: Introduction to Containerization**

1. **Research and Report:**  
   * Write a 500-word report explaining the concept of containerization. Include the following points:  
     * Definition and purpose of containerization.  
     * Advantages of containerization for consistency and scalability.  
     * Comparison of containerization vs. virtualization, highlighting key differences and use cases.

### **Task 2: Understanding Docker and Container Basics**

1. **Docker Installation:**  
   * Install Docker on your local machine. Provide a screenshot showing Docker running successfully on your system.  
2. **Docker Architecture and Components:**  
   * Write a brief description (300 words) of the Docker architecture. Explain the roles of the following components:  
     * Docker Daemon  
     * Docker Client  
     * Docker Images  
     * Docker Containers  
     * Docker Registries

### **Task 3: Hands-On Practical with Docker**

1. **Explore Docker Images, Containers, and Dockerfile:**  
   * Create a simple Dockerfile for a basic web application using the following GitHub repository: (https://github.com/josephifekwe97/my-app.git).. Your Dockerfile should:  
     * Use an official base image.  
     * Copy application code into the container.  
     * Install necessary dependencies.  
     * Expose a port.  
     * Define a CMD to run the application.  
   * Build the Docker image from the Dockerfile and provide the command used to build it.  
   * Run a container using the built image and provide the command used to run it.  
2. **Creating and Managing Docker Containers:**  
   * List all Docker containers on your system and provide the command used to list them.  
   * Start, stop, and remove a Docker container. Provide the commands used for each action.

### **Task 4: Container Orchestration and Networking**

1. **Docker Networking Models:**  
   * Write a brief explanation (200 words) of the different Docker networking models. Focus on the following:  
     * Bridge Network  
     * Host Network  
     * Overlay Network  
2. **Hands-On Networking:**  
   * Create a user-defined bridge network.  
   * Run two containers on this network and demonstrate that they can communicate with each other. Provide the commands used and a brief explanation of your process.

### **Task 5: Docker Networking and Storage**

1. **Explore Docker Networking:**  
   * Set up a Docker container with a custom network configuration. Provide the network configuration details and commands used to set it up.  
2. **Persistent Storage Solutions:**  
   * Research and explain (200 words) the concept of persistent storage in Docker. Include common solutions such as volumes and bind mounts.  
   * Create a Docker container with a mounted volume. Provide the Docker run command used and verify that data persists after container termination and restart.

### **Submission:**

* **Documentation:**  
  * Combine your written reports and explanations into a single PDF document. Ensure that all code snippets, commands, and explanations are clearly formatted and easy to read.  
* **Code and Configurations:**  
  * Submit all relevant Dockerfiles, scripts, and any other configuration files used in your tasks.  
* **Screenshots:**  
  * Include screenshots where required, especially for Docker installations and running containers.

#### **Evaluation Criteria:**

* **Completeness:** Have you addressed all parts of the assignment?  
* **Accuracy:** Are your explanations and configurations correct and well-executed?  
* **Clarity:** Is your documentation clear and well-organized?  
* **Practical Demonstrations:** Are your hands-on tasks completed successfully with the correct commands and outputs?

### **Additional Resources:**

* Docker Documentation: [https://docs.docker.com](https://docs.docker.com)/  
* Official Docker Images: [https://hub.docker.com/search?q=\&type=image](https://hub.docker.com/search?q=\&type=image)


