# 📊 Grafana Loki Logging Stack with Promtail & Nginx

This project sets up a **logging and monitoring stack** using Docker Compose:

- **Grafana** → Visualization  
- **Loki** → Log aggregation system  
- **Promtail** → Log shipper for collecting logs  
- **Nginx** → Sample web server generating logs  

---

## 🚀 Project Structure

```bash
grafana-loki-stack/
├── docker-compose.yml
├── grafana
│   └── data
├── loki
│   ├── config.yml
│   └── data
├── nginx
│   ├── html
│   │   └── index.html
│   ├── log
│   └── nginx.conf
└── promtail
    ├── data
    └── promtail.yml
```

---

## ⚙️ Requirements

- Docker  
- Docker Compose  
- Git  

---

## 📥 Setup

Clone this repository:

```bash
git clone https://github.com/saadgeeus/grafana-loki-stack.git
cd grafana-loki-stack
```
---
#### **Install Grafana**
``` bash
# Goto grafana-loki-stack Dir
cd grafana-loki-stack
# Give Execute Permission to install_grafana.sh file
chmod +x install_grafana.sh
# Now Run This CMD
./install_grafana.sh
```
> it will install and start Grafana Server
---
#### **Install Docker**
``` bash
sudo apt update
# Now install Docker
sudo apt install docker.io
# After Installation Add User In Docker Group
sudo usermod -aG docker $USER && newgrp docker
```
---
Start the stack:
```bash
docker compose up -d --build
```
---

📌 Services
- **Service**	→ Port	 → Description
- **Grafana**	→ 3000   → Visualization UI
- **Loki**	    → 3100	 → Log aggregation backend
- **Promtail**  → 9080	 → Collects logs from Nginx
- **Nginx**	    → 80	 → Sample web server
---

🔗 Configure Grafana

- **Open Grafana** → http://localhost:3000
- **Default login:** → admin / admin
- **Add Loki as Data Source** → http://loki:3100
- **Go to Explore** → Run query:
```bash
{job="nginx"}
```
---

📊 Dashboards
- Import Grafana dashboard for Loki logs **(ID: 13639)** from **Grafana.com**
---
🗑️ Cleanup
To stop and remove containers:
```bash
docker compose down -v
```
---

3📌 Notes
- **Nginx logs are stored in** → nginx/log/
- **Promtail scrapes system logs** → (/var/log/*.log) and **Nginx** logs
- **Loki persists logs in** → /var/lib/loki (inside container, can be volume mounted)

---
**Important**
- **For This Project I Use CentOS 9 Stream**
