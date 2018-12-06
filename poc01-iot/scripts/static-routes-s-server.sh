#Script to add Static Routes in nodes Connected to vQFX1 Spine
echo "#persistent static routes" >> /etc/network/interfaces
echo "up route add -net 172.16.2.0/24 gw 172.16.1.1 dev enp0s9" >> /etc/network/interfaces
echo "up route add -net 2.2.2.0/24 gw 172.16.1.1 dev enp0s9" >> /etc/network/interfaces

sudo /etc/init.d/networking restart
sudo ip route


