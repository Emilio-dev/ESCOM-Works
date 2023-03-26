import socket
import time
import os
import sys
import pathlib

buf=1024
FORMAT = "utf-8"
dir_path=os.getcwd()

client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP) # UDP
client.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# Enable broadcasting mode
client.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

client.bind(("", 37020))
#Get name to use in the folder
data,addr = client.recvfrom(buf)
new_dir = pathlib.Path(dir_path,data.strip().decode(FORMAT))
new_dir.mkdir(parents=True, exist_ok=True)

#Get number of files in the folder
data,addr = client.recvfrom(buf)
reverted=int.from_bytes(data, 'little', signed=False)

for x in range(reverted):
    
    data,addr = client.recvfrom(buf)
    print ("Received File:",data.strip().decode(FORMAT))
    filepath = os.path.join(new_dir, data.strip().decode(FORMAT))
    f = open(filepath,'wb')

    data,addr = client.recvfrom(buf)
    try:
        while(data):
            f.write(data)
            client.settimeout(2)
            data,addr = client.recvfrom(buf)
    except TimeoutError:
        f.close()
        print ("File Downloaded")
        client.settimeout(None)

client.close()
