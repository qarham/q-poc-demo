#!/bin/bash -v 

apt-get install -y wget gcc python-devel
pip install python-openstackclient
pip install python-ironicclient
pip install python-neutronclient
pip install python-heatclient
pip install --upgrade pip

# Check Contrail Status
contrail-status

source /etc/kolla/kolla-toolbox/admin-openrc.sh
#source /etc/kolla/admin-openrc.sh

#download Cirros image
wget http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img
openstack image create cirros2 --disk-format qcow2 --public --container-format bare --file cirros-0.4.0-x86_64-disk.img

#download lab Ubunt image
#wget  http://10.10.16.104/trusty-server-cloudimg-amd64-disk1.img
#openstack image create --disk-format qcow2 --container-format bare --public --file trusty-server-cloudimg-amd64-disk1.img ubuntu-lab

# Download Cirros Servcie Chaining Image
wget https://raw.githubusercontent.com/qarham/tf-os-k8s-vagrant/master/heat/cirros-sc-3-IFs.img
openstack image create cirrossc --disk-format qcow2 --public --container-format bare --file cirros-sc-3-IFs.img

#Create flavors
openstack flavor create --ram 512 --disk 1 --vcpus 1 m1.tiny
openstack flavor create --ram 2048 --disk 5 --vcpus 1 m1.small

# validation
openstack image list
openstack flavor list

# Create Test VM and Test vRouter Connection
openstack network create VN-01
openstack subnet create --subnet-range 10.1.1.0/24 --network VN-01 VN01-VN-subnet

openstack network create VN-02
openstack subnet create --subnet-range 20.1.1.0/24 --network VN-02 VN02-VN-subnet

openstack network create VN-03
openstack subnet create --subnet-range 30.1.1.0/24 --network VN-02 VN02-VN-subnet

openstack network create VN-04
openstack subnet create --subnet-range 40.1.1.0/24 --network VN-02 VN02-VN-subnet

openstack server create --flavor m1.tiny --image 'cirros2' \
    --nic net-id=VN-01 \
    --availability-zone nova:l-srv1 \
srv1vmvn01-01

openstack server create --flavor m1.tiny --image 'cirros2' \
    --nic net-id=VN-02 \
    --availability-zone nova:l-srv1 \
srv1vmvn02-01

openstack server create --flavor m1.tiny --image 'cirros2' \
    --nic net-id=VN-03 \
    --availability-zone nova:l-srv1 \
srv1vmvn03-01

openstack server create --flavor m1.tiny --image 'cirros2' \
    --nic net-id=VN-01 \
    --availability-zone nova:l-srv2 \
srv2vmvn01-02

openstack server create --flavor m1.tiny --image 'cirros2' \
    --nic net-id=VN-02 \
        --availability-zone nova:l-srv2 \
srv2vmvn02-02

openstack server create --flavor m1.tiny --image 'cirros2' \
    --nic net-id=VN-04 \
        --availability-zone nova:l-srv2 \
srv2vmvn04-01


sleep 30

echo "Check VM status"
openstack server list

# check linklocal for the VM
#ip route 
#ssh cirros@169.254.0.4

#git clone https://github.com/virtualhops/k8s-demo
#kubectl create -f k8s-demo/po-ubuntuapp.yml
#kubectl create -f k8s-demo/rc-frontend.yml



