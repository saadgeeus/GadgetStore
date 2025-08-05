#!/data/data/com.termux/files/usr/bin/bash

echo "📡 Getting IP addresses..."

# Get local IP using a safe method
LOCAL_IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}')

# Get public IP using curl
PUBLIC_IP=$(curl -s ifconfig.me)

echo ""
echo "📶 Local IP (LAN):   $LOCAL_IP"
echo "🌐 Public IP (WAN):  $PUBLIC_IP"
