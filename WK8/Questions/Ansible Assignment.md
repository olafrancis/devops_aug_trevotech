  
**Assignment Title: Introduction to Configuration Management with Ansible**

**Introduction:**

In this practical assignment, you will delve into the domain of configuration management using Ansible. Configuration management plays a crucial role in maintaining infrastructure by ensuring consistency, reliability, and scalability. Through this assignment, you will understand the importance of configuration management, explore various tools, and focus on Ansible for its simplicity, flexibility, and robustness.

**Objective:**

The primary objective of this assignment is to familiarize yourself with Ansible and configuration management concepts. By completing this assignment, you will gain practical experience in writing Ansible playbooks, understanding Ansible's architecture, components, and best practices.

**Assignment Tasks:**

**Task 1: Importance of Configuration Management**  
Write a brief summary discussing the significance of configuration management in maintaining infrastructure.  
Explore the benefits of configuration management for ensuring consistency, reliability, scalability, and reproducibility.

**Task 2: Exploring Configuration Management Tools**  
Compare various configuration management tools.  
Justify why Ansible is chosen over other tools, emphasizing its simplicity, agentless nature, idempotency, and large community support.

**Task 3: Understanding Ansible and Its Architecture**  
Dive into Ansible's architecture, explaining its control node, managed nodes, and communication process.  
Explore Ansible components, including playbooks, roles, and inventory, and discuss their roles in configuration management.

**Task 4: Writing Ansible Playbooks**

In this task, you will perform hands-on exercises to create Ansible playbooks for common configuration management tasks, specifically installing LAMP stack (Linux, Apache, MySQL, PHP) and LEMP stack (Linux, Nginx, MySQL, PHP) on two target node servers \- one running Linux and the other running Windows. The control node for managing these servers will be a Linux server.

**Step 1: Setting Up the Ansible Control Node**

Ensure you have Ansible installed on your Linux control node.  
Create a directory structure for your Ansible project.  
Set up an inventory file (hosts.ini) listing the IP addresses or hostnames of your Linux and Windows target nodes.

**Step 2: Writing Ansible Playbooks**

**LAMP Stack Installation Playbook (lamp.yml):**

Define tasks to install Apache, MySQL, and PHP on the Linux target node.  
Use appropriate Ansible modules like apt or yum for package installation.  
Configure MySQL root password and database if necessary.  
Utilize variables to make the playbook adaptable to different distributions or configurations.

**LEMP Stack Installation Playbook (lemp.yml):**

Define tasks to install Nginx, MySQL, and PHP on the Linux target node.  
Utilize Ansible's conditional statements to handle package installation based on the target node's OS type (Linux).  
Ensure proper configuration of Nginx and PHP-FPM.  
Utilize variables for specifying configurations like Nginx server name or PHP version.

**Windows LEMP Stack Installation Playbook (windows\_lemp.yml):**

Utilize Ansible's WinRM connection to manage Windows hosts.  
Define tasks to install Nginx, MySQL, and PHP on the Windows target node.  
Utilize Ansible's conditional statements to handle package installation based on the target node's OS type (Windows).  
Configure appropriate settings for Nginx and PHP on Windows.

**Step 4: Testing Playbooks**

Run each playbook individually using the ansible-playbook command and observe the output to ensure successful execution.  
Verify the installation and configuration of LAMP and LEMP stacks on the respective target nodes.  
Make necessary adjustments to playbooks or configurations if any errors occur during execution.

**Submission Guidelines:**  
Create a GitHub repository specifically for this assignment.  
Organize your assignment tasks into folders or markdown files.  
Upload all relevant files, documentation, and screenshots to the repository.  
Provide clear explanations for each task.  
Submit the GitHub repository link for evaluation.

**Evaluation Criteria:**

Completion of all assignment tasks.  
Accuracy and depth of understanding demonstrated in the written explanations.  
Clarity and organization of documentation.  
Timely submission of the GitHub repository link.

**Deadline:**

Submit your completed assignment by End of Day on 29/06/2024. Late submissions may incur penalties.

Useful Links:

[Ansible Documentation](https://docs.ansible.com/)  
[Ansible Galaxy](https://galaxy.ansible.com/)

ANSIBLE RUN COMMAND

ansible \<hostname or group\> \-m ping  
ansible-playbook \<playbook\_file.yml\>

