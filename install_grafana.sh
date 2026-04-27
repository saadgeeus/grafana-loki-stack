#!/bin/bash

# --- Rangon ka istemaal (Visual Feedback ke liye) ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting Grafana Installation...${NC}"

# 1. Dependencies install karna
echo -e "${GREEN}[1/6] Installing dependencies...${NC}"
sudo apt-get update
sudo apt-get install -y apt-transport-https wget gnupg

# 2. Keyrings directory banana
echo -e "${GREEN}[2/6] Creating keyrings directory...${NC}"
sudo mkdir -p /etc/apt/keyrings

# 3. Grafana GPG Key download karna
echo -e "${GREEN}[3/6] Downloading Grafana GPG key...${NC}"
sudo wget -O /etc/apt/keyrings/grafana.asc https://apt.grafana.com/gpg-full.key

# 4. Permissions set karna
echo -e "${GREEN}[4/6] Setting permissions for GPG key...${NC}"
sudo chmod 644 /etc/apt/keyrings/grafana.asc

# 5. Repository add karna
echo -e "${GREEN}[5/6] Adding Grafana repository to sources list...${NC}"
echo "deb [signed-by=/etc/apt/keyrings/grafana.asc] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# 6. Update aur Install
echo -e "${GREEN}[6/6] Updating package list and installing Grafana...${NC}"
sudo apt-get update
sudo apt-get install -y grafana

# 7. Grafana Service start karna
echo -e "${BLUE}Enabling and starting Grafana service...${NC}"
sudo systemctl daemon-reload
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo -e "${GREEN}SUCCESS: Grafana has been installed and started!${NC}"
echo -e "You can access it at http://localhost:3000 (Default login: admin/admin)"
