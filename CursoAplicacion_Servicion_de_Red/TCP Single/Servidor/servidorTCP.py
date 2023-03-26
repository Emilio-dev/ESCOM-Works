from pickle import TRUE
import socket
from _thread import *
import threading
import pathlib
import os
 
IP = socket.gethostbyname(socket.gethostname())
PORT = 4456
ADDR = (IP, PORT)
BUFFER = 1024
buf=200
FORMAT = "utf-8"
dir_path=os.getcwd()

def threaded(server,addr):
    #Get name to use in the folder
    new_dir_name=server.recv(BUFFER).decode(FORMAT)
    new_dir = pathlib.Path(dir_path, new_dir_name)
    new_dir.mkdir(parents=True, exist_ok=True)

    #Get ammount of files in the folder
    count = server.recv(BUFFER)
    reverted=int.from_bytes(count, 'little', signed=False)
    print(f"[NEW CONNECTION] {addr} connected.")
    for x in range(reverted):
        """ Server has accepted the connection from the client. """
        
        """ Receiving the filename from the client. """
        filename = server.recv(BUFFER).decode(FORMAT)
        print(f"[RECV] Receiving the filename.")
        filepath = os.path.join(new_dir, filename)
        file = open(filepath, "wb")

        data=b'0'
        try:
            while(data):
                data= server.recv(buf)
                file.write(data) 
                server.settimeout(2)
        except TimeoutError:
            file.close()
            print ("File Downloaded")
            server.send("File data received".encode(FORMAT))
    """ Closing the connection from the client. """  
    print(f"[DISCONNECTED] {addr} disconnected.")
    server.close()
       

def Main():
    print("[STARTING] Server is starting.")
    """ Staring a TCP socket. """
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    """ Bind the IP and PORT to the server. """
    server.bind(ADDR)

    """ Server is listening, i.e., server is now waiting for the client to connected. """
    server.listen(5)
    print("[LISTENING] Server is listening.")
    while True:
        # establish connection with client
        c, addr = server.accept()
 
        # lock acquired by client
       # print_lock.acquire()
        print('Connected to :', addr[0], ':', addr[1])
 
        # Start a new thread and return its identifier
        start_new_thread(threaded, (c,addr))

if __name__ == '__main__':
    Main() 


