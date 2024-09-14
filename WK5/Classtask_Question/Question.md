JENKINS DISTRIBUTED ARCHITECTURE.

So we are going to be implementing this ARCHITECTURE in AWS using the AWS EC2

STEP 1:
SETTING UP THE MASTER NODE (THIS IS JENKINS MASTER ITSELF)
    1. spin up the ec2 instance you want to use as the master node, I mean where you want to have JENKINS running. make sure you set up your security group so as you can reach JENKINS on port 8080. (i will be using ubuntu for this demo), u can either create a user or use root so I will be using root in the demo.

    2. You then ssh into this server using the pem key you created or you can connect to the server (ec2 instance) on aws. (I will be connecting to the server usng ssh connection with my pem_key for authentication)

    3. now that am in the server (ec2 instance) as ubuntu I will then switch to the root user by running this command = "sudo su" and boom! am in the root user so from now on, I don't need to be using sudo to run my commands.

    4. I will then update the system variables by running this command = "apt-update" After the update, I will then install JAVA by running this command = "apt install fontconfig openjdk-17-jre" why because JENKINS  is a JAVA-based application so it will not run without JAVA installed on the machine.

    5. I will check the JAVA version by running this command = "java --version" and then taking note of the Java version.

    6. I will now install JENKINS but first add the Jenkins repo and key to the machine by running this command = "wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null" 
   and then updating the system variables again by running the command = "apt-update" and then finally installing Jenkins with this command = "apt-get install jenkins"

   7. starting Jenkins
        You can enable the Jenkins service to start at boot with the command: = "systemctl enable jenkins"
        You can start the Jenkins service with the command: = "systemctl start jenkins"
        You can check the status of the Jenkins service using the command: = "systemctl status jenkins"
        If everything has been set up correctly, you should see an output like this: = "Loaded: loaded (/lib/systemd/system/jenkins.service; enabled; vendor preset: enabled)
              Active: active (running) since Tue 2018-11-13 16:19:01 +03; 4min 57s ago"

   8. I will then copy my public IP, head over to my browser, and access Jenkins on port 8080. I will then set up Jenkins and am sure you can do that. 


STEP 2:
SETTING UP THE SLAVE NODE(S)
    1. I will spin up another ec2 instance but you can use any machine be it in the cloud as a VM or any local machine, also your slave machine must not be ubuntu alone it can be Windows, 	centos, macOS, etc or the combination of a different flavor of machines.

    2. I will then SSH into this machine using my PEM key. (NOTE: am using the same pem key I used for the master machine).

    3. I will then switch to root user and then check my current directory by running this command = "pwd" why because I will be creating a folder for Jenkins on this machine so I want to know 	where it will be created because I will use this folder later in the node set up in JENKINS.

    3. I will then create the folder by running this command = "mkdir jenkins" and then grant this folder permission for read and write by running this command = "chmod 777 jenkins" and then check is the permission was granted by running this command = "ls -lrt"

    4. I will then update the system variable and install THE EXACT VERSION OF JAVA RUNNING ON THE MASTER NODE HERE ON THE SLAVE NODE. why because that's JENKINS requirment.

    5. I will then check the Java version making sure the version is the same as the one running on the master server.

STEP 3:
NODE CONFIGURATION ON JENKINS.
    1. Since I have set up JENKINS, I will log in, click on my DASHBOARD and then click on MANAGE JENKINS and then click on NODES. here you will only see the built-in node which is the master node.

    2. I will then click on create a new node and set the node name let's call it JENKINS-SLAVE1, this is going to be a permanent node so I will then tick PERMANENT and then CREATE.

    3. I will then give the node any description I like and then set the number of EXECUTORS to 1 and then copy the directory to the folder I created earlier and paste it on the REMOTE ROOT DIRECTORY block then give this node a LABEL. 

    4. I will then set the USAGE to = "Use this node as much as possible"

    5. I will then set the LAUNCH METHOD = "launch agent via SSH"

    6. I will then set the HOST to the public IP of the slave machine. just copy and paste the public IP here.

    7. Under credentials, I will click on ADD and then add some credentials.

    8. Under add credentials, I will then set the DOMAIN NAME to "Global credentials (unrestricted)"

    9. Under KIND, I will set it to "SSH username with private key"

    10. Under ID, I will give the ID as "jenkins-slave" and the same for the DESCRIPTION

    11. Under USERNAME, I will set that to "ubuntu" cos that's the machine am using as the slave.

    12. I will then tick ENTER DIRECTLY under PRIVATE KEY.

    13. For the key, THIS IS THE KEY THAT JENKINS WILL USE TO CONNECT TO THE SLAVE MACHINE. Remember I have been connecting to both machines MASTER AND SLAVE MACHINES using SSH connect with the pem key I created on AWS, this is the same key I will be giving to JENKINS to use for AUTHENTICATING WITH THE SKAVE MACHINE.

    14. So, I will go to the folder where my PEM key is downloaded, cat it, copy it, and then click on add under the key block and then paste it there. (NOTE you copy only from the beginning of the key to the end adding no space nor extra characters.) and then SAVE.

    15. Under AVAILABILITY, I will set it to "keep this agent online as much as possible" and then click on SAVE.

    16. I will give JENKINS some time to establish a connection with the slave machine and if everything is set up as listed, I should have a message like "Agent successfully connected and online" at the end of the log generated by Jenkins under logs.