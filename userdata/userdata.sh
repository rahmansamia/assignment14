#!/bin/bash
# Update OS and install Docker
yum update -y
amazon-linux-extras install docker -y
systemctl enable docker
systemctl start docker

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/

# Setup Kubernetes repo and install kubelet/kubeadm
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=0
EOF

yum install -y kubelet kubeadm kubectl
systemctl enable kubelet
systemctl start kubelet

# Optional: join cluster if token is known
# kubeadm join <MASTER_IP>:6443 --token <TOKEN> --discovery-token-ca-cert-hash sha256:<HASH>
