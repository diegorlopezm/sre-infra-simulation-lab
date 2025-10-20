
# 🏢 SRE Infrastructure Automation Lab (2025)

![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker&style=flat-square)
![Ansible](https://img.shields.io/badge/Ansible-Automated-red?logo=ansible&style=flat-square)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-blue?logo=kubernetes&style=flat-square)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus-orange?logo=prometheus&style=flat-square)

**Production-grade infrastructure lab with full automation, monitoring, and SRE practices. Features dynamic load balancing, hybrid cloud simulation, and complete lifecycle management.**

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
| **1. Stabilization** | PgBouncer, MinIO, Ansible backups | ✅ Current |
| **2. Expansion** | Redis, RabbitMQ, multi-channel alerts | 🔄 Next |
| **3. Automation** | CI/CD pipelines, health checks | ⏳ Upcoming |
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

## 📊 Infrastructure Components

### 🐳 Containerized Services
| Service | Purpose | Port | Access |
|---------|---------|------|---------|
| Traefik | Load Balancer | 80, 8085 | `http://localhost:8085` |
| Grafana | Metrics Visualization | 3000 | `http://localhost:3000` |
| Prometheus | Metrics Collection | 9090 | `http://localhost:9090` |
| Zabbix | Enterprise Monitoring | 8080 | `http://localhost:8080` |
| Blog App | Sample Web Application | 5000 | `http://blog.localhost` |
| PostgreSQL | Database | 5432 | Internal |
| Redis | Caching | 6379 | Internal |

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
- **Observability** — Prometheus, Grafana, Zabbix  
- **Load Balancing** — Traefik with auto-discovery  
- **Cloud Networking** — Cloudflare Tunnels + Domain setup  
- **Disaster Recovery** — Volume persistence + automated teardown  
- **Security** — SSL termination at Cloudflare, private Docker networks

