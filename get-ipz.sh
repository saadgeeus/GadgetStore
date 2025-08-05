#!/data/data/com.termux/files/usr/bin/bash

echo "📡 Getting IP addresses..."

# 1️⃣ Attempt to get Local IP via ip route
LOCAL_IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}')

# 2️⃣ Fallback: Python method (more reliable)
if [ -z "$LOCAL_IP" ]; then
    LOCAL_IP=$(python -c "import socket; s=socket.socket(socket.AF_INET, socket.SOCK_DGRAM); s.connect(('8.8.8.8', 80)); print(s.getsockname()[0]); s.close()" 2>/dev/null)
fi

# 3️⃣ Final fallback: use ifconfig (if installed)
if [ -z "$LOCAL_IP" ]; then
    if command -v ifconfig > /dev/null; then
        LOCAL_IP=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -n1)
    fi
fi

# 🌐 Get public IP
PUBLIC_IP=$(curl -s ifconfig.me)

echo ""
echo "📶 Local IP (LAN):   ${LOCAL_IP:-Not found}"
echo "🌐 Public IP (WAN):  ${PUBLIC_IP:-Not found}"
