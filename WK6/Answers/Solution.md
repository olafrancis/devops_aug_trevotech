### **Assignment: Week 6 \- Jenkins**

#### **Objective:**

Let's walk through the hands-on steps for setting up a Continuous Integration (CI) environment with Jenkins. I'll guide you through each part of the assignment with detailed instructions and examples.

### 1. Set Up Jenkins

#### Install Jenkins
1. **Local Machine Installation**:
   - **Windows**: Download the Jenkins Windows installer from the [official Jenkins website](https://www.jenkins.io/download/). Run the installer and follow the prompts.
   - **macOS**: Use Homebrew to install Jenkins:
     ```bash
     brew install jenkins-lts
     ```
   - **Linux**: Use the package manager for your distribution. For example, on Ubuntu:
     ```bash
     sudo apt update
     sudo apt install openjdk-11-jdk
     wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
     sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
     sudo apt update
     sudo apt install jenkins
     ```
2. **Cloud Server Installation**:
   - **AWS**: Launch an EC2 instance, SSH into it, and follow the Linux installation steps above.
   - **Azure**: Create a Virtual Machine, SSH into it, and follow the Linux installation steps above.
   - **GCP**: Create a VM instance, SSH into it, and follow the Linux installation steps above.

#### Initial Configuration
1. **Access Jenkins**: Open a web browser and go to `http://localhost:8080` (or your server's IP address).
2. **Unlock Jenkins**: Enter the initial admin password found in `/var/lib/jenkins/secrets/initialAdminPassword`.
3. **Setup Wizard**: Follow the setup wizard to install suggested plugins.
4. **Create Admin User**: Create an admin user and configure basic security settings.

### 2. Explore Jenkins Plugins

#### Install Essential Plugins
1. **Git Plugin**: Allows Jenkins to interact with Git repositories.
2. **Pipeline Plugin**: Enables the creation of Jenkins pipelines as code.
3. **Email Extension Plugin**: Sends build notifications via email.
4. **JUnit Plugin**: Integrates JUnit test results with Jenkins.
5. **Additional Plugin**: Choose another plugin based on your project needs (e.g., Docker, Slack).

To install plugins:
1. Go to `Manage Jenkins` > `Manage Plugins`.
2. Search for each plugin and click `Install without restart`.

### 3. Create and Configure Jenkins Jobs

#### Freestyle Project
1. **Create Job**:
   - Go to `New Item`, enter a name, select `Freestyle project`, and click `OK`.
2. **Configure Job**:
   - Under `Build`, add a `Execute shell` build step.
   - Enter the script:
     ```bash
     echo "Hello, World!"
     ```
3. **Save and Build**: Save the job and click `Build Now`.

#### Parameterized Builds
1. **Modify Job**:
   - Go to the job configuration.
   - Check `This project is parameterized` and add a `String Parameter` named `name`.
   - Modify the shell script to:
     ```bash
     echo "Hello, ${name}!"
     ```
2. **Save and Build**: Save the job and build with different parameters.

#### Build Triggers
1. **Configure Triggers**:
   - Go to the job configuration.
   - Under `Build Triggers`, check `Build periodically` and enter `H/5 * * * *` to run every 5 minutes.
2. **Save**: Save the configuration.

### 4. Integrate Jenkins with Version Control Systems

#### Configure Jenkins with Git
1. **Create Git Repository**: Create a new repository on GitHub.
2. **Simple Project**: Add a simple project (e.g., a Java application) to the repository.
3. **Configure Jenkins**:
   - Go to the job configuration.
   - Under `Source Code Management`, select `Git` and enter the repository URL.

#### Jenkins Pipeline as Code
1. **Create Jenkinsfile**:
   - In your Git repository, create a `Jenkinsfile` with the following content:
     ```groovy
     pipeline {
         agent any
         stages {
             stage('Build') {
                 steps {
                     echo 'Building...'
                 }
             }
             stage('Test') {
                 steps {
                     echo 'Testing...'
                 }
             }
             stage('Deploy') {
                 steps {
                     echo 'Deploying...'
                 }
             }
         }
     }
     ```
2. **Configure Jenkins**:
   - Go to `New Item`, enter a name, select `Pipeline`, and click `OK`.
   - Under `Pipeline`, select `Pipeline script from SCM`, choose `Git`, and enter the repository URL.

### 5. Putting It All Together

#### Comprehensive CI Job
1. **Create Job**:
   - Go to `New Item`, enter a name, select `Pipeline`, and click `OK`.
2. **Configure Job**:
   - Under `Pipeline`, select `Pipeline script from SCM`, choose `Git`, and enter the repository URL.
   - Add parameters for different deployment environments.
   - Set up email notifications under `Post-build Actions`.

#### Automated Testing
1. **Integrate Testing Framework**:
   - Add a testing stage in your `Jenkinsfile`:
     ```groovy
     stage('Test') {
         steps {
             sh 'mvn test'
         }
     }
     ```
2. **Report Results**: Ensure test results are reported in Jenkins.

### 6. Initialize Git and Push to Git

1. **Initialize Git Repository**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```
2. **Add Remote Repository**:
   ```bash
   git remote add origin <remote_repository_url>
   git push -u origin master
   ```
### Deliverables

#### Documentation
- **Detailed Report**: Document each step with screenshots and explanations.

