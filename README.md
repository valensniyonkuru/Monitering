# 📊 Kubernetes Monitoring Stack on AWS EKS

> A production-ready monitoring solution built on **Amazon EKS** using the **kube-prometheus-stack** (Prometheus + Alertmanager + Grafana). This project automates cluster provisioning, node group setup, and full observability configuration.

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **AWS EKS** | Managed Kubernetes cluster |
| **eksctl** | CLI tool to create and manage EKS clusters |
| **Prometheus** | Metrics collection and storage |
| **Alertmanager** | Alert routing and notification management |
| **Grafana** | Metrics visualization and dashboards |
| **Helm** | Kubernetes package manager (used to install kube-prometheus-stack) |

---

## 🚀 Project Overview

This project sets up a complete **Kubernetes monitoring stack** on AWS EKS from scratch. It covers:

1. **EKS Cluster creation** — Spin up a managed Kubernetes cluster in AWS (`eu-central-1` region).
2. **Node Group provisioning** — Add worker nodes to the cluster.
3. **Prometheus installation** — Deploy Prometheus via Helm for metrics scraping.
4. **Alertmanager configuration** — Configure alert rules with high-availability replicas.
5. **Grafana dashboards** — Visualize cluster and application metrics in real time.

---

## 📸 Setup Walkthrough

### ✅ Step 1 — EKS Cluster Created

The EKS cluster (`cluster1`) is successfully provisioned in the `eu-central-1` region across two availability zones.

<img width="1918" height="630" alt="EKS Cluster Created" src="https://github.com/user-attachments/assets/b7df9df1-c15f-4b3d-9d1c-fd0889c8f2cf" />

---

### ✅ Step 2 — Worker Nodes Created

Two worker nodes are added to the cluster via a managed node group, providing the compute capacity for running monitoring workloads.

<img width="1918" height="651" alt="Two Nodes Created" src="https://github.com/user-attachments/assets/58d1ec1a-9ce2-4d24-91cb-860283fc3ea2" />

---

### ✅ Step 3 — Prometheus Installed

The **kube-prometheus-stack** Helm chart is installed in a dedicated `monitoring` namespace. Prometheus begins scraping metrics from all cluster components automatically.

<img width="1918" height="858" alt="Prometheus Installation" src="https://github.com/user-attachments/assets/b9a1658f-b4e5-4844-be72-369b6906fe9a" />

---

### ✅ Step 4 — Alertmanager Configured

Alertmanager is configured with **2 replicas** for high availability. A custom `AlertmanagerConfig` CRD is applied using label-based selectors (`release: monitoring`) to ensure alert routing works without namespace matcher issues.

<img width="1917" height="955" alt="Alertmanager Configuration" src="https://github.com/user-attachments/assets/2cb26718-7da1-4662-820f-34a5a4fa7e65" />

---

### ✅ Step 5 — Grafana Dashboards Live

Grafana is accessible and pre-loaded with Kubernetes dashboards. It connects to Prometheus as a data source, allowing real-time visualization of node health, pod status, CPU/memory usage, and more.

<img width="1918" height="991" alt="Grafana Dashboard" src="https://github.com/user-attachments/assets/dfed8b32-4252-4591-bde2-7e91d514628d" />

---

## 📁 Repository Structure

```
├── cruster.sh                      # Creates the EKS cluster
├── eksctl_provider.sh              # Configures the eksctl IAM provider
├── install_eksctl.sh               # Installs eksctl CLI
├── nodegroup.sh                    # Creates the EKS node group
├── namespace.sh                    # Creates the monitoring namespace
├── kubepro_inst.sh                 # Installs kube-prometheus-stack via Helm
├── custom_kube_prometheus_stack.yml # Custom Helm values (Alertmanager config)
└── README.md
```

---

## ⚙️ Quick Start

```bash
# 1. Install eksctl
bash install_eksctl.sh

# 2. Create the EKS cluster
bash cruster.sh

# 3. Set up IAM provider
bash eksctl_provider.sh

# 4. Add worker nodes
bash nodegroup.sh

# 5. Create monitoring namespace
bash namespace.sh

# 6. Install kube-prometheus-stack
bash kubepro_inst.sh
```

---

## 🔧 Key Configuration — Alertmanager

The `custom_kube_prometheus_stack.yml` file applies critical Alertmanager settings:

- **Label-based selector** (`release: monitoring`) — ensures `AlertmanagerConfig` CRDs are picked up correctly.
- **2 replicas** — prevents alerting downtime during pod failures.
- **`alertmanagerConfigMatcherStrategy: None`** — removes namespace matchers, simplifying multi-namespace alert routing.

---

*Built with ❤️ using AWS EKS, Prometheus, Alertmanager & Grafana.*
