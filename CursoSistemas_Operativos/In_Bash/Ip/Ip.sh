var=$(ip addr |grep 'enp0s3'| grep -oP 'inet \K[^ ]+') 
mask=${var##*/}
ip=${var::-3}

echo $ip
echo $mask
ping -c 1 $ip &> /dev/null && echo Exito_ping || echo Inalcanzable
echo ama_Termine