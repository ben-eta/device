#!/system/bin/sh

echo "1" > /proc/sys/net/ipv4/ip_forward
/system/bin/iptables -X
/system/bin/iptables -F
/system/bin/iptables -t nat -X
/system/bin/iptables -t nat -F
/system/bin/iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
/system/bin/iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
/system/bin/iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
/system/bin/iptables -F
/system/bin/iptables -P INPUT ACCEPT
/system/bin/iptables -P FORWARD ACCEPT
/system/bin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo "shareroute ok!"
