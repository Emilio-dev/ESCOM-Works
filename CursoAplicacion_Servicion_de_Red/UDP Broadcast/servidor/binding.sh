while getopts g:i: flag
do
    case "${flag}" in
        g) gateway=${OPTARG};;
        i) IP=${OPTARG};;      
    esac
done



ip_mask=$(ip addr show wlp2s0 | awk {'print $2'} | grep 172)
tarjeta_red=$(ip route | grep "wlp2s0 proto kernel")
sudo ip addr add $IP/24 dev tap0
sudo ip link set tap0 up
sudo ip route add $gateway dev tap0
sudo ip link set tap0 up
sudo ip route del $tarjeta_red
sudo route add -net 10.10.10.0/24 gw $gateway
sudo route add -net 11.11.11.0/24 gw $gateway
sudo route add -net 14.14.14.0/24 gw $gateway

