[![CI/CD Status](https://github.com/diegorlopezm/sre-infra-simulation-lab/actions/workflows/deploy.yml/badge.svg)](https://github.com/diegorlopezm/sre-infra-simulation-lab/actions)
[![Live Demo](https://img.shields.io/badge/DEMO-Load_Balancing_Live-success)](https://blog.diegoricardo.dev)
# 🏢 SRE Infrastructure Automation Lab (2025)

![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker&style=flat-square)
![Ansible](https://img.shields.io/badge/Ansible-Automated-red?logo=ansible&style=flat-square)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-blue?logo=kubernetes&style=flat-square)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus-orange?logo=prometheus&style=flat-square)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub_Actions-blue?logo=githubactions&style=flat-square)
**Production-grade infrastructure lab with full automation, monitoring, and SRE practices. Features dynamic load balancing, hybrid cloud simulation, and complete lifecycle management.**

## 🎯 LIVE DEMO: Load Balancing in Action
**🚀 Experience production-grade load balancing:** https://blog.diegoricardo.dev

**💡 Quick test:** Refresh the page multiple times to see different instances!

| Feature | Description | Status |
|---------|-------------|--------|
| Multi-Instance Deployment | 3 container instances with round-robin distribution | ✅ Live |
| Visual Instance Identification | Color-coded UI (BLUE 🟦, GREEN 🟩, RED 🟥) | ✅ Live |
| Real-time Traffic Distribution | Traefik load balancing with sticky sessions disabled | ✅ Live |
| Request Statistics | Redis-based counting per instance | ✅ Live |
| Live Monitoring | Traefik dashboard with traffic analytics | ✅ Live |
---
## 🌐 Cloud Architecture Overview (New!)
Since the host environment has **no public IP**, external traffic is now securely routed through **Cloudflare Tunnel (Cloudflared)**.

### 🧭 Traffic Flow
```
User Browser (HTTPS)
│
▼
🌩️ Cloudflare Edge Network
│
▼
🕳️ Cloudflared Tunnel (Container)
│
▼
⚙️ Traefik Reverse Proxy (Docker)
│
▼
📊 Grafana / Blog / Prometheus / Zabbix Containers
```
## 🛠️ Next Steps


### 🔐 Key Highlights
- **Cloudflared** handles all **external HTTPS connections** and terminates SSL at Cloudflare’s edge.  
- **Traefik** manages **internal HTTP routing** between Docker services using labels.  
- **Cloudflare-managed domain:** [`diegoricardo.dev`](https://diegoricardo.dev)  
- **Certificates:** Fully handled by Cloudflare → No local ACME validation required.  
- **Zero public exposure:** The host remains private; only Cloudflare endpoints are accessible externally.  

---

## ✅ Completed Features
### 🧰 Core Infrastructure
- Docker Compose multi-stack deployment (load balancer, monitoring, web apps)
- Environment configuration via `.env` (excluded from Git)
- Automated orchestration with Ansible playbooks

### 🔒 Secrets & Configuration
- Environment variables for credentials  
- `.env` added to `.gitignore`  
- Future integration: HashiCorp Vault  

### 📈 Monitoring Stack
- **Prometheus** — Metrics collection  
- **Grafana** — Visualization dashboards  
- **Alertmanager** — Slack notifications  
- **Zabbix** — Enterprise alerting  
- **cAdvisor** — Container metrics  
- **PostgreSQL Exporter** — Database monitoring  

---

## 🚀 Implementation Phases

| Phase | Description | Status |
|-------|--------------|--------|
| **1. Stabilization** | PgBouncer, MinIO, Ansible backups | ✅ **Completed** |
| **2. Expansion** | **Load balancing, multi-instance deployment** | ✅ **Completed** |
| **3. Automation** | **CI/CD pipelines, automated validation** | ✅ **Completed** |
| **4. Optimization** | HA PostgreSQL (Patroni), Vault integration | 🔮 Future |

---

## 🧩 Services Overview

| Service | Purpose | Port | Access |
|----------|----------|------|--------|
| 🌀 Traefik | Reverse Proxy / Load Balancer | 80, 443, 8085 | [traefik.diegoricardo.dev](https://traefik.diegoricardo.dev) |
| 📊 Grafana | Metrics Visualization | 3000 | [grafana.diegoricardo.dev](https://grafana.diegoricardo.dev) |
| 📈 Prometheus | Metrics Collection | 9090 | Internal |
| 🚨 Zabbix | Enterprise Monitoring | 8080 | Internal |
| 📰 Blog App | Sample Flask App | 5000 | [blog.diegoricardo.dev](https://blog.diegoricardo.dev) |
| 🗄️ PostgreSQL | Database | 5432 | Internal |
| ⚡ Redis | Cache | 6379 | Internal |


## 🆕 Latest Features

### 🤖 Infrastructure Automation
- **Ansible Playbooks** for complete infrastructure lifecycle
- **One-command deployment** and teardown with data preservation
- **Volume management** ensuring zero data loss between deployments
- **Multi-service orchestration** with dependency handling
- **CI/CD Pipeline** with automated validation and testing

### 🎯 Enhanced Monitoring Stack
- **Prometheus** with 30-day metrics retention
- **Grafana** with persistent dashboards and configurations
- **Zabbix** for enterprise-grade alerting
- **cAdvisor** for container metrics
- **PostgreSQL exporter** for database monitoring

### 🔄 Advanced Load Balancing
- **Traefik v2.10** with automatic service discovery
- **Dynamic routing** via Docker labels
- **SSL/TLS ready** configuration
- **Dashboard** for real-time traffic monitoring
- **NEW: Production load balancing across 3 container instances**
- **NEW: Instance-aware application with visual load distribution**
- **NEW: Redis-based request counting and instance statistics**

### 🔄 CI/CD Pipeline
- **GitHub Actions** for automated infrastructure validation
- **Docker Compose syntax validation** on every commit
- **Ansible playbook validation** and syntax checking
- **Service discovery testing** for Traefik configuration
- **Network configuration validation** across all services
- **Automated quality gates** with professional reporting

## 📊 Infrastructure Components

### 🐳 Containerized Services
| Service | Purpose | Port | Access | Instances |
|---------|---------|------|---------|-----------|
| Traefik | Load Balancer | 80, 8085 | `http://localhost:8085` | 1 |
| Grafana | Metrics Visualization | 3000 | `https://grafana.diegoricardo.dev` | 1 |
| Prometheus | Metrics Collection | 9090 | `http://localhost:9090` | 1 |
| Zabbix | Enterprise Monitoring | 8080 | `http://localhost:8080` | 1 |
| Blog App | Load Balanced Web Application | 5000 | `https://blog.diegoricardo.dev` | **3** |
| PostgreSQL | Database | 5432 | Internal | 1 |
| Redis | Caching & Session Storage | 6379 | Internal | 1 |
### 🔧 Automation Features
```yaml
- name: Deploy complete infrastructure
  ansible-playbook infrastructure/automation/ansible/provisioning/deploy-infra.yml
  
- name: Teardown (preserving data)
  ansible-playbook infrastructure/automation/ansible/provisioning/teardown-infra.yml
  
```
## 🌐 Access Services

| Service            | URL                                  |
|--------------------|--------------------------------------|
| **Traefik Dashboard** | [http://localhost:8085/dashboard/](http://localhost:8085/dashboard/) |
| **Grafana**           | [https://grafana.diegoricardo.dev](https://grafana.diegoricardo.dev) |
| **Blog**              | [https://blog.diegoricardo.dev](https://blog.diegoricardo.dev) |

---

## 🧠 Skills Demonstrated

- **Infrastructure as Code** — Ansible + Docker Compose  
- **CI/CD Automation** — GitHub Actions with validation pipelines
- **Observability** — Prometheus, Grafana, Zabbix  
- **Load Balancing** — Traefik with 3-instance round-robin distribution
- **Container Orchestration** — Multi-instance deployment with service discovery
- **Cloud Networking** — Cloudflare Tunnels + Domain setup  
- **Disaster Recovery** — Volume persistence + automated teardown  
- **Security** — SSL termination at Cloudflare, private Docker networks
- **Performance Optimization** — Horizontal scaling and traffic distribution
