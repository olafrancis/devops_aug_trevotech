### **Assignment: Week 8 \- Introduction to Configuration Management with Ansible**

### Task 1: Importance of Configuration Management

**Summary:**
Configuration management is crucial for maintaining infrastructure as it ensures that systems are configured consistently and according to best practices. It helps in managing changes systematically, reducing the risk of errors, and ensuring that the infrastructure is reliable, scalable, and reproducible. Key benefits include:

- **Consistency:** Ensures that all systems are configured uniformly, reducing discrepancies.
- **Reliability:** Minimizes configuration errors, leading to more stable systems.
- **Scalability:** Facilitates the management of a large number of systems efficiently.
- **Reproducibility:** Allows for the replication of environments, making it easier to recover from failures and deploy new systems.

### Task 2: Exploring Configuration Management Tools

**Comparison of Tools:**
- **Puppet:** Uses a declarative language and requires an agent on each managed node. It is powerful but can be complex to set up.
- **Chef:** Uses a procedural language (Ruby) and also requires an agent. It is flexible but has a steeper learning curve.
- **SaltStack:** Uses a declarative language and can operate in both agent and agentless modes. It is fast and scalable but can be complex.
- **Ansible:** Uses a simple, declarative language (YAML) and is agentless, making it easy to set up and use. It ensures consistency through idempotent modules and has a large community for support¹².

**Why Ansible?**
- **Simplicity:** Uses YAML, which is easy to read and write.
- **Agentless:** No need to install agents on managed nodes, reducing overhead.
- **Idempotency:** Ensures that repeated executions lead to the same result, maintaining consistency.
- **Community Support:** A large community provides extensive resources and support¹².

### Task 3: Understanding Ansible and Its Architecture

**Architecture:**
- **Control Node:** The machine where Ansible is installed and from which commands are run.
- **Managed Nodes:** The target machines that Ansible manages.
- **Communication:** Ansible uses SSH for Linux/Unix systems and WinRM for Windows systems.

**Components:**
- **Playbooks:** YAML files that define a series of tasks to be executed on managed nodes.
- **Roles:** A way to organize playbooks and other files to facilitate reuse and sharing.
- **Inventory:** A file that lists the managed nodes and their groupings¹².

### Task 4: Writing Ansible Playbooks

### Create a EC2 Linux 

# main.tf

# Specify the provider
provider "aws" {
  region = "us-west-2"  # Change to your preferred region
}

# Define the EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Change to your preferred AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

**Step 1: Setting Up the Ansible Control Node**
1. **Install Ansible:**
   ```bash
   sudo apt update
   sudo apt install ansible
   ```
2. **Create Directory Structure:**
   ```bash
   mkdir -p ~/ansible_project/{group_vars,host_vars,roles}
   cd ~/ansible_project
   ```
3. **Set Up Inventory File (hosts.ini):**
   ```ini
   [linux]
   linux_target ansible_host=192.168.1.10

   [windows]
   windows_target ansible_host=192.168.1.20 ansible_user=Administrator ansible_password=your_password ansible_connection=winrm ansible_winrm_server_cert_validation=ignore
   ```

**Step 2: Writing Ansible Playbooks**

**LAMP Stack Installation Playbook (lamp.yml):**
```yaml
---
- name: Install LAMP stack on Linux
  hosts: linux
  become: yes
  vars:
    mysql_root_password: "your_password"
  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present

    - name: Install MySQL
      apt:
        name: mysql-server
        state: present

    - name: Install PHP
      apt:
        name: php
        state: present

    - name: Configure MySQL root password
      mysql_user:
        name: root
        password: "{{ mysql_root_password }}"
        host_all: yes
        priv: '*.*:ALL,GRANT'
        state: present
```

**LEMP Stack Installation Playbook (lemp.yml):**
```yaml
---
- name: Install LEMP stack on Linux
  hosts: linux
  become: yes
  vars:
    nginx_server_name: "example.com"
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Install MySQL
      apt:
        name: mysql-server
        state: present

    - name: Install PHP
      apt:
        name: php-fpm
        state: present

    - name: Configure Nginx
      template:
        src: nginx.conf.j2
        dest: /etc/nginx/sites-available/default
      notify:
        - restart nginx

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted
```

**Windows LEMP Stack Installation Playbook (windows_lemp.yml):**
```yaml
---
- name: Install LEMP stack on Windows
  hosts: windows
  tasks:
    - name: Install Nginx
      win_chocolatey:
        name: nginx
        state: present

    - name: Install MySQL
      win_chocolatey:
        name: mysql
        state: present

    - name: Install PHP
      win_chocolatey:
        name: php
        state: present

    - name: Configure Nginx
      win_copy:
        src: nginx.conf
        dest: C:\nginx\conf\nginx.conf
      notify:
        - restart nginx

  handlers:
    - name: restart nginx
      win_service:
        name: nginx
        state: restarted
```

**Step 4: Testing Playbooks**
Run each playbook using the `ansible-playbook` command:
```bash
ansible-playbook lamp.yml
ansible-playbook lemp.yml
ansible-playbook windows_lemp.yml
```
Verify the installations and make adjustments if necessary.

### Submission Guidelines
1. Create a GitHub repository for the assignment.
2. Organize tasks into folders or markdown files.
3. Upload all relevant files, documentation, and screenshots.
4. Provide clear explanations for each task.
5. Submit the GitHub repository link for evaluation.
