Sure, I can help explain the task of setting up a Jenkins Distributed Architecture on AWS using EC2 instances. This architecture involves setting up a Jenkins Master node and one or more Slave nodes to distribute the build load. Here’s a step-by-step breakdown:

### Step 1: Setting Up the Master Node

1. **Spin Up the EC2 Instance**:
   - Launch an EC2 instance that will serve as the Jenkins Master node.
   - Configure the security group to allow access to Jenkins on port 8080.
   - For this demo, Ubuntu is used, and the root user will be utilized.

2. **SSH into the Server**:
   - Connect to the EC2 instance using SSH with your PEM key.

3. **Switch to Root User**:
   - Once connected, switch to the root user with `sudo su`.

4. **Update System and Install Java**:
   - Update system packages: `apt update`.
   - Install Java: `apt install fontconfig openjdk-17-jre`.

5. **Check Java Version**:
   - Verify the Java installation: `java --version`.

6. **Install Jenkins**:
   - Add Jenkins repository and key:
     ```sh
     wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
     echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
     ```
   - Update system packages again: `apt update`.
   - Install Jenkins: `apt-get install jenkins`.

7. **Start Jenkins**:
   - Enable Jenkins to start at boot: `systemctl enable jenkins`.
   - Start Jenkins: `systemctl start jenkins`.
   - Check Jenkins status: `systemctl status jenkins`.

8. **Access Jenkins**:
   - Copy the public IP of your EC2 instance.
   - Open a browser and navigate to `http://<your-public-ip>:8080` to access Jenkins.

### Step 2: Setting Up the Slave Node(s)

1. **Spin Up Another EC2 Instance**:
   - Launch another EC2 instance to serve as a Jenkins Slave node.
   - This instance can be any OS (Ubuntu, Windows, CentOS, macOS, etc.).

2. **SSH into the Slave Node**:
   - Connect to the EC2 instance using the same PEM key used for the Master node.

3. **Switch to Root User**:
   - Switch to the root user with `sudo su`.

4. **Create Jenkins Directory**:
   - Check the current directory: `pwd`.
   - Create a directory for Jenkins: `mkdir jenkins`.
   - Grant read and write permissions: `chmod 777 jenkins`.

5. **Install Java**:
   - Update system packages and install the same version of Java as on the Master node.

6. **Verify Java Version**:
   - Ensure the Java version matches the Master node.

### Step 3: Node Configuration in Jenkins

This step involves configuring the Slave nodes in Jenkins, which typically includes:

1. **Adding a New Node**:
   - In Jenkins, navigate to `Manage Jenkins` > `Manage Nodes and Clouds` > `New Node`.
   - Provide a name for the node and select `Permanent Agent`.

2. **Configure Node Details**:
   - Set the remote root directory to the path of the Jenkins directory created on the Slave node.
   - Configure the launch method (e.g., via SSH).

3. **Save and Connect**:
   - Save the configuration and connect the Slave node to the Master.

This setup allows Jenkins to distribute build tasks across multiple nodes, improving scalability and efficiency.

Great, let's continue with the node configuration on Jenkins:

### Step 3: Node Configuration on Jenkins

1. **Log in to Jenkins**:
   - Open your Jenkins dashboard.
   - Navigate to `Manage Jenkins` > `Manage Nodes and Clouds`.

2. **Create a New Node**:
   - Click on `New Node`.
   - Enter the node name (e.g., `JENKINS-SLAVE1`).
   - Select `Permanent Agent` and click `OK`.

3. **Configure Node Details**:
   - Provide a description for the node.
   - Set the number of executors to `1`.
   - Enter the path to the directory you created on the slave machine in the `Remote root directory` field.
   - Assign a label to the node for easier identification.

4. **Set Node Usage**:
   - Choose `Use this node as much as possible`.

5. **Set Launch Method**:
   - Select `Launch agent via SSH`.

6. **Enter Host Information**:
   - Enter the public IP address of the slave machine.

7. **Add Credentials**:
   - Click on `Add` under the credentials section.
   - Set the domain to `Global credentials (unrestricted)`.

8. **Configure SSH Credentials**:
   - Set `Kind` to `SSH username with private key`.
   - Enter `jenkins-slave` for both `ID` and `Description`.
   - Set `Username` to `ubuntu` (or the appropriate username for your slave machine).
   - Select `Enter directly` for the private key.

9. **Enter Private Key**:
   - Open the PEM key file you used to connect to the EC2 instances.
   - Copy the entire key content (without any extra spaces or characters).
   - Paste the key into the private key field and click `Add`.

10. **Set Availability**:
    - Choose `Keep this agent online as much as possible`.

11. **Save Configuration**:
    - Click `Save` to apply the settings.

12. **Verify Connection**:
    - Jenkins will attempt to connect to the slave machine.
    - If everything is set up correctly, you should see a message like `Agent successfully connected and online` in the logs.

This completes the setup of a Jenkins distributed architecture with a master and slave node on AWS EC2 instances. If you encounter any issues or need further assistance, feel free to ask!