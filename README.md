# 📊 Grafana Loki Logging Stack with Promtail & Nginx

This project sets up a **logging and monitoring stack** using Docker Compose:

- **Grafana** → Visualization  
- **Loki** → Log aggregation system  
- **Promtail** → Log shipper for collecting logs  
- **Nginx** → Sample web server generating logs  

---

## 🚀 Project Structure

grafana-loki-stack/
├── docker-compose.yml
├── promtail/
│ ├── promtail.yml
│ └── data/
├── nginx/
│ ├── html/
│ │ └── index.html
│ └── log/
└── grafana/
└── data/


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


Start the stack:
docker compose up -d --build

📌 Services
Service	Port	Description
Grafana	3000	Visualization UI
Loki	3100	Log aggregation backend
Promtail	9080	Collects logs from Nginx
Nginx	80	Sample web server


🔗 Configure Grafana
1.	Open Grafana → http://localhost:3000
o	Default login: admin / admin
2.	Add Loki as Data Source → http://loki:3100
3.	Go to Explore → Run query:
{job="nginx"}


📊 Dashboards
•	Import Grafana dashboard for Loki logs (ID: 13639) from Grafana.com

🗑️ Cleanup
To stop and remove containers:
docker compose down -v


📌 Notes
•	Nginx logs are stored in nginx/log/
•	Promtail scrapes system logs (/var/log/*.log) and Nginx logs
•	Loki persists logs in /var/lib/loki (inside container, can be volume mounted)
