import socket
import time
import os
import sys

buf = 1024
FORMAT = "utf-8"
red='255.255.255.255'#'<broadcast>'
dir_path=os.getcwd()

def get_files(path):
    for file in os.listdir(path):
        if os.path.isfile(os.path.join(path, file)):
            yield file


server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)

server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# Enable broadcasting mode
server.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)


new_dir_name = input('Directory name to store files: ')
count=len([entry for entry in os.listdir(dir_path) if os.path.isfile(os.path.join(dir_path, entry))])
count=count.to_bytes(1, 'big', signed=False)

server.sendto(new_dir_name.encode(FORMAT),(red, 37020))
server.sendto(count,(red, 37020))


for file in get_files(dir_path):
    time.sleep(1) 
    archivo=open(file,"rb") 
    data = archivo.read(buf)   
    print("sending ...") 
    server.sendto(file.encode(FORMAT),(red, 37020))

    
    while (data):
        if(server.sendto(data, (red, 37020))):
            data = archivo.read(buf)
    server.sendto(data, (red, 37020))  #descomentar si es linux
    print("Archivo enviado",archivo.name)            
    archivo.close()
        
server.close()

