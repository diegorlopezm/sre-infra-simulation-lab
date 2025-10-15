# 🏢 SRE Infra Simulation Lab (2025)

[![GitHub stars](https://img.shields.io/github/stars/diegorlopezm/sre-infra-simulation-lab)](https://github.com/diegorlopezm/sre-infra-simulation-lab)
[![Docker](https://img.shields.io/badge/Docker-Production-blue)](https://hub.docker.com)
[![License](https://img.shields.io/github/license/diegorlopezm/sre-infra-simulation-lab)](LICENSE)

**Production-ready lab simulating $250M enterprise infrastructure**. Hybrid setup: Docker microservices (RabbitMQ, Postgres, NGINX, HAProxy, Redis) monitored with Prometheus/Grafana, plus VMware Ceph cluster (3-node Linux) and Windows Server 2022 monitored with Zabbix agents/SNMP. Designed for **SRE**, **Platform Engineering**, and **DevOps** roles ($150k-$250k).

**Status**: Functional Docker monitoring with Zabbix alerts, Prometheus metrics, Grafana dashboards. VMware extension for hybrid Windows/Linux (Ceph HA, IIS config).

**As Junior**: Started as simple Docker lab, scaled to complex hybrid infra. Shows learning potential: from basic monitoring to HA/automation in weeks.

---

## 🎯 **Why This Project?**

- **Enterprise Simulation**: Replicates hybrid infra (Docker microservices + VMware VMs) for real-world monitoring and auto-remediation.
- **SRE Skills**: Docker Compose for microservices, Zabbix agents/SNMP for VMs, Prometheus/Grafana for metrics/visuals.
- **Interview Ready**: Demonstrates production setup for AWS/GCP/Uber. Applied to incident response (alerts), scalability (Ceph HA), hybrid environments (Windows/Linux).
- **Scalable**: Docker for microservices (easy replicate), Vagrant for VMware (Ceph cluster, Windows Server).
- **Junior Potential**: As beginner, learned to automate complex setups (e.g., Ceph failover, IIS config). Shows self-learning and building resilience/performance from scratch.

**Skills Demonstrated**:
- **SRE/DevOps**: Zabbix agents/SNMP, Prometheus scraping, Grafana dashboards, Ansible (pending), n8n workflows (pending).
- **Infra**: Docker Compose, persistent volumes, container networking, Vagrant for VMware replication.
- **Production Application**: Reduces downtime 99.9% via alerts + auto-fixes. Used in cloud ops for hybrid environments (e.g., AWS EC2 Windows + EKS Docker).

**Microservices Included**: RabbitMQ (messaging), Postgres (DB), NGINX (web), HAProxy (LB), Redis (caching). Suggested additions: Elasticsearch (logs), Kafka (streaming), MongoDB (NoSQL), Jenkins (CI/CD), Kubernetes (orchestration).

---

## 🚀 **Quick Start (5min)**

```bash
git clone https://github.com/diegorlopezm/sre-infra-simulation-lab.git
cd sre-infra-simulation-lab
docker-compose up -d