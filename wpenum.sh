#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
# IP=$1
# PORT=$2

echo -e "
    :::       ::: :::::::::  :::::::::: ::::    ::: :::    :::   :::   ::: 
   :+:       :+: :+:    :+: :+:        :+:+:   :+: :+:    :+:  :+:+: :+:+: 
  +:+       +:+ +:+    +:+ +:+        :+:+:+  +:+ +:+    +:+ +:+ +:+:+ +:+ 
 +#+  +:+  +#+ +#++:++#+  +#++:++#   +#+ +:+ +#+ +#+    +:+ +#+  +:+  +#+  
+#+ +#+#+ +#+ +#+        +#+        +#+  +#+#+# +#+    +#+ +#+       +#+   
#+#+# #+#+#  #+#        #+#        #+#   #+#+# #+#    #+# #+#       #+#    
###   ###   ###        ########## ###    ####  ########  ###       ###     

"
read -p 'ENter IP: ' IP
read -p "Enter PORT: " PORT


echo -e "${GREEN}[+] wpscan started ... ${NC}"

wpscan --no-banner --url http://$IP:$PORT -e u,vp,vt

echo "========================================================"

echo -e "${GREEN}[+] Nmap Scan Started ... ${NC}"
nmap --script=http-wordpress-enum.nse  --script-args=search-limit=1500  $IP -p $PORT 

echo "========================================================="
echo -e "${GREEN}[+] Scan Ended Succesfully"      
