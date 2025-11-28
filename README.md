## Todo API Service – GitOps Demo

This repo is a simple demo of deploying a FastAPI “todo” microservice to Kubernetes using:

- Terraform (EKS clusters)
- Helm (app packaging)
- Argo CD (GitOps)
- GitHub Actions (basic CI)

### Layout

- `app/` – FastAPI app code.
- `Dockerfile` – container image definition.
- `helm-chart/` – Helm chart for the app.
- `gitops/values/` – per-environment Helm values (dev/staging/prod).
- `argo/` – Argo CD project + Application manifests.
- `terraform/` – Terraform code for dev/staging/prod EKS clusters.
- `.github/workflows/` – CI for app and Terraform.

### Basic usage (high level)

1. Use Terraform under `terraform/environments/*` to create an EKS cluster.
2. Point `kubectl` to that cluster and install Argo CD.
3. Apply the files under `argo/` into the cluster where Argo CD runs.
4. Push code/Helm changes to GitHub and let Argo CD sync them to the cluster.

This is meant as a learning/portfolio project, not a full production platform.
