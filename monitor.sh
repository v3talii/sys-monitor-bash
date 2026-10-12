#!/bin/bash

# Color definitions for output styling

GREEN='\033[0;32m'

CYAN='\033[0;36m'

NC='\033[0m' # No Color


# Header banner

echo -e "${CYAN}-------------------------------------------------${NC}"
 
echo -e "${CYAN}      SYSTEM MONITORING DASHBOARD                ${NC}"

echo -e "${CYAN}-------------------------------------------------${NC}"


# Section 1 - System Details 

echo -e "\n${GREEN}[+] System Info:${NC}"

echo "User: $(whoami)"

echo "Hostname: $(hostname)"

echo "Uptime: $(uptime | awk -F'up ' '{print $2}' | awk -F',' '{print $1}')"



#Section 2 - Storage Status 

echo -e "\n${GREEN}[+] Disk Usage:${NC}"

df -h / | awk 'NR==2 {print "Used: " $3 " / Total: " $2 " (" $5 " used)"}'


#Section 3 - Network Check 

echo -e "\n${GREEN}[+] Network Status:${NC}"

echo "Local IP: $(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1)"


#Check internet connection via ICMP ping 

ping -c 1 8.8.8.8 > /dev/null 2>&1

if [ $? -eq 0 ]; then 

	echo "Internet : CONNECTED"
else 
	echo "Internet : DISCONNECTED"
fi 

echo -e "\n${CYAN}-------------------------------------------${NC}"

