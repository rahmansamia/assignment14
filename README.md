# WebApp Capstone Project

## Architecture
3-tier application with Frontend, Backend, and Database deployed on AWS.

## Technologies
- AWS EC2, ALB, RDS
- Kubernetes (Self-hosted)
- Terraform
- GitHub Actions
- ArgoCD

## Data Flow
User → ALB → Kubernetes NodePort → Backend → RDS → User

## CI/CD
- CI: GitHub Actions builds Docker images on push to master
- CD: ArgoCD syncs Kubernetes manifests

## Security
- ALB allows HTTPS (443)
- EC2 only accessible from ALB
- RDS accessible only from EC2 security group
