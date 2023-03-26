import socket
import os
import time
from importlib_metadata import files

IP = socket.gethostbyname(socket.gethostname())
PORT = 4456
ADDR = (IP, PORT)
FORMAT = "utf-8"
BUFFER = 1024
buf=200
dir_path=os.getcwd()

def read_in_chunks(file_object, chunk_size=200):
    """Lazy function (generator) to read a file piece by piece.
    Default chunk size: 200b."""
    while True:
        data = file_object.read(chunk_size)
        if not data:
            break
        yield data

def get_files(path):
    for file in os.listdir(path):
        if os.path.isfile(os.path.join(path, file)):
            yield file

def Main(): 
    """ Staring a TCP socket. """
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    """ Connecting to the server. """
    client.connect(ADDR)
    new_dir_name = input('Directory name to store files: ')
    client.send(new_dir_name.encode(FORMAT))

    # list to store files
    count=len([entry for entry in os.listdir(dir_path) if os.path.isfile(os.path.join(dir_path, entry))])
    count=count.to_bytes(1, 'big', signed=False)
    client.send(count)

    for file in get_files(dir_path):


        archivo=open(file,"rb") 
        client.send(file.encode(FORMAT))

        data = archivo.read(buf)  
        while (data):
            if(client.send(data)):
                data = archivo.read(buf)
        #server.sendto(data, ('<broadcast>', 37020))  #descomentar si es linux
        print("Archivo enviado ",archivo.name)            
        archivo.close()
        data= client.recv(buf)
    # Closing the connection from the server.      
    client.close()
if __name__ == '__main__':
    Main()
