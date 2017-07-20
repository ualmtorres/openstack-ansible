/sbin/ip route |grep default |grep br-ex

if [ $? -ne 0 ]; then
    /sbin/ip route del default
    /sbin/ip addr del {{ nodes_by_name.network.provider_ip }}/24 dev {{ provider_interface }}
    /sbin/ip link set br-ex up
    /usr/bin/ovs-vsctl add-port br-ex {{ provider_interface }}
    /sbin/ip link set {{ provider_interface }} promisc on
    /sbin/ip addr add {{ nodes_by_name.network.provider_ip }}/24 dev br-ex
    /sbin/ip route add default via {{ provider_gateway }}
fi
