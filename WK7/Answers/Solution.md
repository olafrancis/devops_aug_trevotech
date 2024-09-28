### Task 1: Introduction to Kubernetes

#### 1. Research and Explain

**Essay on the Need for Container Orchestration**

Container orchestration is essential in modern software development and deployment due to the increasing complexity of applications and the need for efficient resource management. Containers, which package applications and their dependencies into a single unit, have revolutionized the way applications are developed, tested, and deployed. However, managing containers at scale presents several challenges that container orchestration aims to solve.

One of the primary problems container orchestration addresses is the need for automated deployment, scaling, and management of containerized applications. Without orchestration, managing hundreds or thousands of containers manually would be impractical and error-prone. Orchestration tools like Kubernetes automate these tasks, ensuring that applications are deployed consistently and can scale up or down based on demand.

Another significant benefit of container orchestration is improved resource utilization. Orchestration platforms can dynamically allocate resources to containers based on their needs, optimizing the use of underlying infrastructure. This leads to cost savings and better performance, as resources are not wasted on underutilized containers.

Container orchestration also enhances the reliability and availability of applications. Orchestration tools can automatically detect and replace failed containers, ensuring that applications remain available even in the face of hardware or software failures. Additionally, orchestration platforms provide features like load balancing and service discovery, which further contribute to the resilience and scalability of applications.

In summary, container orchestration is crucial for managing the lifecycle of containerized applications in a scalable, efficient, and reliable manner. It addresses the challenges of manual management, resource optimization, and application availability, making it an indispensable tool in modern DevOps practices.

**Architecture and Components of Kubernetes**

Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. Its architecture is designed to provide a robust and scalable environment for running applications in production.

**Master Node Components:**
- **API Server:** The API server is the central management entity that exposes the Kubernetes API. It serves as the entry point for all administrative tasks and handles communication between various components.
- **Scheduler:** The scheduler is responsible for assigning newly created pods to nodes in the cluster based on resource availability and other constraints. It ensures that workloads are distributed efficiently across the cluster.
- **Controller Manager:** The controller manager runs various controllers that regulate the state of the cluster. For example, the replication controller ensures that the desired number of pod replicas are running at all times.

**Worker Node Components:**
- **Kubelet:** The kubelet is an agent that runs on each worker node. It communicates with the API server to receive instructions and manage the lifecycle of containers on the node.
- **Kube-proxy:** Kube-proxy is responsible for network communication within the cluster. It maintains network rules on each node to allow pods to communicate with each other and with services.

**Add-ons:**
- **DNS:** Kubernetes includes a DNS add-on that provides name resolution for services within the cluster. This allows pods to communicate with services using DNS names instead of IP addresses.
- **Dashboard:** The Kubernetes dashboard is a web-based user interface that provides an overview of the cluster's state and allows users to manage applications and resources visually.

Kubernetes' architecture is designed to be modular and extensible, allowing it to support a wide range of use cases and workloads. Its components work together to provide a powerful and flexible platform for managing containerized applications at scale.

Great! Let's proceed with Task 2 using the provided GitHub repository. We'll set up a Kubernetes cluster on AWS EKS using Terraform and deploy the React application from the repository.

Sure, let's consolidate the tasks into single scripts for easier execution.

### Task 2: Setting up a Kubernetes Cluster

#### Terraform Script for AWS EKS Setup
provider "aws" {
  region = "us-west-2"
}

# VPC and Subnets
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public" {
  count = 3
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count = 3
  vpc_id = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 3)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "private-subnet-${count.index}"
  }
}

# Internet Gateway and Route Tables
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count = 3
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

# NAT Gateway and Route Tables
resource "aws_eip" "nat" {
  count = 1
  vpc = true
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat[0].id
  subnet_id = aws_subnet.public[0].id
  tags = {
    Name = "main-nat-gateway"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  count = 3
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

# IAM Roles and Policies for EKS
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role" "eks_worker_role" {
  name = "eks-worker-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  role       = aws_iam_role.eks_worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.eks_worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSCNIPolicy"
}

resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
  role       = aws_iam_role.eks_worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# EKS Cluster and Node Group
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  subnets         = aws_subnet.public[*].id
  vpc_id          = aws_vpc.main.id

  cluster_iam_role_name = aws_iam_role.eks_cluster_role.name

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = "your-key-name"

      iam_role_arn = aws_iam_role.eks_worker_role.arn
    }
  }
}

Initialize and apply the Terraform configuration:
```bash
terraform init
terraform apply
```

Configure `kubectl` to use the new EKS cluster:
```bash
aws eks --region us-west-2 update-kubeconfig --name example-cluster
```

### Task 3: Deploying Applications on Kubernetes

#### Kubernetes Manifests
Create a single YAML file (`k8s-manifests.yaml`) to deploy the React application:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: react-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: react-app
  template:
    metadata:
      labels:
        app: react-app
    spec:
      containers:
      - name: react-app
        image: your-docker-image
        ports:
        - containerPort: 3000

---
apiVersion: v1
kind: Service
metadata:
  name: react-app-service
spec:
  selector:
    app: react-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
  type: LoadBalancer

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: react-app-config
data:
  NODE_ENV: production
```

Apply the Kubernetes manifests:
```bash
kubectl apply -f k8s-manifests.yaml
```

#### Helm Chart
Create a Helm chart for the React application:

**Chart.yaml**
```yaml
apiVersion: v2
name: react-app
description: A Helm chart for Kubernetes
type: application
version: 0.1.0
appVersion: "1.0"
```

**values.yaml**
```yaml
replicaCount: 3
image:
  repository: nginx
  tag: latest
  pullPolicy: IfNotPresent

service:
  type: LoadBalancer
  port: 80
```

**templates/deployment.yaml**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "react-app.fullname" . }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{ include "react-app.name" . }}
  template:
    metadata:
      labels:
        app: {{ include "react-app.name" . }}
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
        ports:
        - containerPort: 80
```

**templates/service.yaml**
```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ include "react-app.fullname" . }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
  selector:
    app: {{ include "react-app.name" . }}
```

Deploy the application using Helm:
```bash
helm install react-app ./react-app
```

### Task 4: Managing and Scaling Applications in Kubernetes

#### Horizontal Pod Autoscaler
Create a single YAML file (`hpa.yaml`) for horizontal pod autoscaling:

```yaml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: react-app-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: react-app
  minReplicas: 1
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50
```

Apply the HorizontalPodAutoscaler configuration:
```bash
kubectl apply -f hpa.yaml
```

#### Monitoring and Logging
Create a script (`monitoring-logging.sh`) to set up Prometheus, Grafana, and the EFK stack:

```bash
#!/bin/bash

# Install Prometheus
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/bundle.yaml

# Install Grafana
kubectl apply -f https://raw.githubusercontent.com/grafana/helm-charts/main/charts/grafana/templates/deployment.yaml

# Forward Grafana port
kubectl port-forward svc/grafana 3000:3000 &

# Install Elasticsearch, Fluentd, and Kibana
helm repo add elastic https://helm.elastic.co
helm install elasticsearch elastic/elasticsearch
helm install fluentd elastic/fluentd
helm install kibana elastic/kibana

# Forward Kibana port
kubectl port-forward svc/kibana 5601:5601 &
```

Run the script:
```bash
chmod +x monitoring-logging.sh
./monitoring-logging.sh
```

This should streamline the process and make it easier to execute the tasks without running each command individually. Let me know if you need any further assistance!
