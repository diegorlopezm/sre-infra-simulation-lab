
# 🏢 SRE Infrastructure Automation Lab (2025)

![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker&style=flat-square)
![Ansible](https://img.shields.io/badge/Ansible-Automated-red?logo=ansible&style=flat-square)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-blue?logo=kubernetes&style=flat-square)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus-orange?logo=prometheus&style=flat-square)

**Production-grade infrastructure lab with full automation, monitoring, and SRE practices. Features dynamic load balancing, hybrid cloud simulation, and complete lifecycle management.**

## 🚀 Quick Start (2 minutes)

```bash
git clone https://github.com/diegorlopezm/sre-infra-simulation-lab.git
cd sre-infra-simulation-lab

# Deploy complete infrastructure with Ansible
ansible-playbook infrastructure/automation/ansible/provisioning/deploy-infra.yml

# Access services:
# 🔧 Traefik Dashboard: http://localhost:8085/dashboard/
# 📊 Grafana: http://localhost:3000 (admin/admin)
# 📈 Prometheus: http://localhost:9090
# 🚨 Zabbix: http://localhost:8080
```

## 🏗️ Architecture Overview

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Load Balancer │    │   Monitoring     │    │   Web Apps      │
│   Traefik       │◄──►│   Stack          │◄──►│   Microservices │
│   :80/:8085     │    │   Prometheus     │    │   Blog + API    │
└─────────────────┘    │   Grafana        │    └─────────────────┘
                       │   Zabbix         │
                       └──────────────────┘
```

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
  ansible-playbook deploy-infra.yml
  
- name: Teardown (preserving data)
  ansible-playbook teardown-infra.yml
  
- name: Infrastructure health checks
  ansible-playbook health-checks.yml
```

## 🛠️ Management & Operations

### 📈 Monitoring & Observability
- **Real-time metrics** with Prometheus scraping
- **Custom dashboards** in Grafana
- **Alert management** with Zabbix triggers
- **Container insights** via cAdvisor
- **Database performance** monitoring

### 🔒 Security & Reliability
- **Multi-tenant isolation** with Docker networks
- **Credential management** with environment variables
- **Volume persistence** across deployments
- **Health checks** and auto-recovery
- **Secure service communication**

## 🚀 Advanced Usage

### 🔄 Full Infrastructure Lifecycle
```bash
# Deploy everything
ansible-playbook infrastructure/automation/ansible/provisioning/deploy-infra.yml

# Stop services (preserve data)
ansible-playbook infrastructure/automation/ansible/provisioning/teardown-infra.yml

# Health verification
ansible-playbook infrastructure/automation/ansible/health-checks.yml
```

### 🎯 Adding New Services
Simply add to the appropriate docker-compose and Traefik auto-discovers:

```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.yourapp.rule=Host(`yourapp.localhost`)"
  - "traefik.http.routers.yourapp.entrypoints=web"
```

### 🔧 Customization
- Modify `infrastructure/automation/ansible/configs/` for specific setups
- Edit Prometheus scraping rules in `infrastructure/monitoring/prometheus.yml`
- Add Grafana dashboards via provisioning

## 📈 Skills Demonstrated

### 💼 SRE & DevOps
- **Infrastructure as Code** (Ansible, Docker Compose)
- **Observability** (Prometheus, Grafana, Zabbix)
- **Load Balancing** (Traefik with auto-discovery)
- **CI/CD Readiness** (Automated deployment pipelines)
- **Disaster Recovery** (Volume-preserving operations)

### 🔬 Technical Stack
- **Container Orchestration**: Docker Compose, Container networking
- **Monitoring**: Prometheus metrics, Grafana visualization, Zabbix alerts
- **Automation**: Ansible playbooks, Python scripting
- **Load Balancing**: Traefik reverse proxy, service discovery
- **Databases**: PostgreSQL with performance monitoring

## 🌟 Project Evolution

**From Junior to Production-Ready:**
- Started as simple Docker monitoring lab
- Scaled to enterprise hybrid infrastructure
- Added full automation with Ansible
- Implemented production-grade monitoring
- Developed operational procedures

## 🆘 Troubleshooting

### Common Issues
```bash
# Reset complete infrastructure
ansible-playbook teardown-infra.yml
docker system prune -f
ansible-playbook deploy-infra.yml

# Check service health
docker ps -a
docker logs [container_name]

# Verify networking
docker network ls
curl http://localhost:3000/api/health
```

## 📝 License & Contributing

This project is open source and available under the [MIT License](LICENSE).

---

**🚀 Ready for production deployment and perfect for SRE/DevOps interviews demonstrating full infrastructure lifecycle management.**
```
