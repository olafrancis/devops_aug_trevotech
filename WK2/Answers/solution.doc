🔒:*Certainly! Let’s set up the LAMP stack step by step:*

*Launch EC2 Instance:*
Log in to your AWS Management Console and navigate to the EC2 dashboard.
Launch a new EC2 instance with Ubuntu Linux OS. Ensure that you configure the necessary settings (instance type, security groups, key pair, etc.).
*Connect to the Instance:*
Once the instance is up and running, connect to it using SSH. You can use the following command:
*ssh -i /path/to/your/key.pem ubuntu@your-instance-public-ip*

*Install Components:*
Update the package list on your instance:
*sudo apt update && sudo apt upgrade*

Install Apache web server:
*sudo apt install apache2*

Install MySQL (or MariaDB):
*sudo apt install mysql-server*

Install PHP:
*sudo apt install php*

*Start Services:*
Start the Apache and MySQL services:
*sudo systemctl start apache2*
*sudo systemctl start mysql*

*Test LAMP Stack:*
Create a PHP info file in the web server’s root directory:
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

********
*Navigate to the Web Server Directory:*
*In your terminal or SSH session, run:*
cd /var/www/html

sudo chmod 755 info.php

***********
*Verify the Setup:*
Access the info file in your browser by visiting http://your-instance-public-ip/info.php.
That’s it! You’ve set up your LAMP stack. Feel free to reach out if you have any questions or need further assistance! 😊🚀

http://54.237.97.47/info.php

**************************************Part 2***********************************

Certainly! Let's set up the LEMP stack step by step:

1. **Connect to EC2 Instance**:
   - SSH into your existing AWS EC2 instance using the following command:
     
     ssh -i /path/to/your/key.pem ubuntu@your-instance-public-ip
     
   - Replace `/path/to/your/key.pem` with the actual path to your private key file and `your-instance-public-ip` with your EC2 instance's public IP address.

2. **Install Components**:
   - Update the package list on your instance:
     
     sudo apt update && sudo apt upgrade
     
   - Install Nginx, MySQL, and PHP packages:
     
     sudo apt install nginx mysql-server php-fpm php-mysql
     

3. **Configure Nginx for PHP**:
   - Open the default Nginx configuration file:
     
     sudo nano /etc/nginx/sites-available/default
     
   - Inside the `server` block, add the following line to enable PHP processing:
     
     location ~ \.php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
     }
     
   - Save the file and exit.

4. **Restart Nginx and PHP-FPM**:
   
   sudo systemctl restart nginx php7.4-fpm
   

5. **Test LEMP Stack**:
   - Create a PHP info file in the web server's root directory:
     
     echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
	 
6. *Navigate to the Web Server Directory:*

*In your terminal or SSH session, run:*

	sudo cd /var/www/html
	
	sudo chmod 755 info.php
     
   - Access the info file in your browser by visiting `http://your-instance-public-ip/info.php`.

Remember to replace placeholders like `/path/to/your/key.pem` and `your-instance-public-ip` with actual values. If you encounter any issues, feel free to ask! 😊🚀
