public_ip=$(curl -s http://icanhazip.com/)
local_ip=$(ip addr show wlp59s0 | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
echo ""  $local_ip "| " $public_ip
