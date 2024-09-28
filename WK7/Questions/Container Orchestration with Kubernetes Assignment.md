 Week 6 Assignment: Container Orchestration with Kubernetes
 
Assignment Overview

In this assignment, you will gain hands-on experience with Kubernetes by setting up a Kubernetes cluster using AWS EKS and Terraform. Additionally, you will explore Kubernetes manifests and Helm charts to deploy and manage containerized applications. You will also implement scaling strategies and set up monitoring and logging for your Kubernetes clusters.

Objectives
By the end of this assignment, you should be able to:
1.	Understand the need for container orchestration and the architecture of Kubernetes.
2.	Set up a Kubernetes cluster using AWS EKS and Terraform.
3.	Deploy applications using Kubernetes manifests and Helm.
4.	Manage and scale applications in Kubernetes.
5.	Implement monitoring and logging for a Kubernetes cluster.
Prerequisites
●	Basic understanding of containerization and Docker.
●	Familiarity with Terraform for infrastructure as code.
●	Access to an AWS account.
●	Basic knowledge of YAML syntax.

Assignment Tasks

Task 1: Introduction to Kubernetes
1.	Research and Explain:
○	Write a brief essay (300-500 words) on the need for container orchestration. Discuss the problems it solves and the benefits it provides.
○	Explain the architecture and components of Kubernetes. Your explanation should include:
■	Master node components (API Server, Scheduler, Controller Manager, etc.)
■	Worker node components (Kubelet, Kube-proxy, etc.)
■	Add-ons (DNS, Dashboard, etc.)

Task 2: Setting up a Kubernetes Cluster
2.	Set Up AWS EKS with Terraform:
○	Follow the provided guidelines to set up a Kubernetes cluster on AWS EKS using Terraform.
○	Create a Terraform script that includes the necessary configurations to deploy an EKS cluster.
○	Document the steps you took, and include your Terraform configuration files in your submission.
3.	Alternative Setup Using Minikube (Optional):
○	If you do not have access to AWS, set up a local Kubernetes cluster using Minikube.
○	Document the setup process and any challenges you encountered.

Task 3: Deploying Applications on Kubernetes
4.	Create Kubernetes Manifests:
○	Write Kubernetes manifests (YAML files) for deploying a simple containerized application (e.g., a web server).
○	Include configurations for Deployment, Service, and ConfigMap.
○	Deploy your application to the Kubernetes cluster and verify that it is running correctly.
5.	Using Helm for Application Management:
○	Install Helm on your Kubernetes cluster.
○	Create a Helm chart for the same application you deployed in the previous step.
○	Deploy the application using the Helm chart and compare it to the deployment using raw manifests.

Task 4: Managing and Scaling Applications in Kubernetes
6.	Implement Scaling Strategies:
○	Configure horizontal pod autoscaling for your application.
○	Simulate a load on your application and observe the scaling behavior.
○	Document the steps and the observed behavior during scaling.
7.	Set Up Monitoring and Logging:
○	Implement monitoring for your Kubernetes cluster using Prometheus and Grafana.
○	Set up logging using a logging solution like Elasticsearch, Fluentd, and Kibana (EFK) or any alternative.
○	Document your setup process and provide screenshots showing the monitoring 
○	and logging dashboards.

Submission Requirements
●	A written report ( Markdown) including:
○	Essay on container orchestration and Kubernetes architecture.
○	Documentation of your AWS EKS cluster setup with Terraform (or Minikube setup).
○	Kubernetes manifests and Helm chart files.
○	Observations and screenshots of the deployed applications, scaling behavior, and monitoring/logging dashboards.
●	Terraform configuration files used for AWS EKS setup.
●	Kubernetes manifests and Helm chart files.
●	Any additional scripts or configuration files used during the assignment.

GitHub Repository:
●	Push all your configuration files, manifests, Helm charts, and documentation to a GitHub repository.
●	Ensure the repository is well-organized and includes a README file explaining the project and how to set it up.
●	Share the URL of your GitHub repository in your submission.

Evaluation Criteria
●	Understanding and Explanation (20%):
○	Clarity and completeness of the essay on container orchestration and Kubernetes architecture.
●	Cluster Setup (20%):
○	Correctness and completeness of the AWS EKS setup using Terraform.
○	Alternative Minikube setup (if applicable).
●	Application Deployment (20%):
○	Accuracy and functionality of Kubernetes manifests and Helm charts.
○	Successful deployment and verification of the application.
●	Scaling and Management (20%):
○	Implementation and documentation of scaling strategies.
○	Effectiveness of the monitoring and logging setup.
●	Documentation and Presentation (20%):
○	Overall quality, clarity, and organization of the documentation.
○	Inclusion of necessary screenshots and configuration files.

