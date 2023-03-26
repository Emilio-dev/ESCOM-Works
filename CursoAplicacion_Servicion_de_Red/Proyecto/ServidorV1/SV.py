import os
from threading import Thread
import socket
import time

IP = socket.gethostbyname(socket.gethostname())
PORT = 4456

IP_SV2 = socket.gethostbyname(socket.gethostname())

PORT_SV2W = 5001
PORT_SV2L = 5002

ADDR = (IP, PORT)
ADDR2W = (IP_SV2, PORT_SV2W)
ADDR2L = (IP_SV2, PORT_SV2L)

BUFFER = 1024
FORMAT = "utf-8"


def Local():
    local = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    local.connect(ADDR)
    while True:
        message = local.recv(BUFFER)
        message = message.decode(FORMAT)
        message = eval(message)
        if (message[1] == "Recuperar"):
            print("Modo Recuperacion")
            send_tolocal(local, message[0])
        elif (message[1] == "Guardar"):
            print("Modo Envio")
            recive_file(local, message[0]) 

def Listener():
    listen = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    listen.connect(ADDR2L)
    while True:
        files = listen.recv(BUFFER)
        files = files.decode(FORMAT)
        files = eval(files)
        print("Sending files", files)
        for file_name in files:
            send_file(listen, file_name)
        print("All files sent", files)

def Worker(path):
    worker = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    worker.connect(ADDR2W)
    while True:
        result = check_changes(path)
        # case of modified or added or removed files
        if result[2]:
            worker.send(str(result[2]).encode(FORMAT))
            print("Receiving :", result[2])
            for file_name in result[2]:
                recive_file(worker, file_name)
            print("All files recived", result[2])    
        else:
            print("aguanta")
            # mandarlo a 2 y 3

def check_changes(path):
    # Get the initial list of files in the directory
    initial_files = set(os.listdir(path))

    while True:
        # Sleep for 1 second
        time.sleep(3)
        # Get the current list of files in the directory
        current_files = set(os.listdir(path))

        # Check for added or removed files
        added_files = current_files - initial_files
        removed_files = initial_files - current_files

        # Check for modified files
        modified_files = []
        for file in initial_files & current_files:
            initial_mod_time = os.path.getmtime(os.path.join(path, file))
            current_mod_time = os.path.getmtime(os.path.join(path, file))
            if initial_mod_time != current_mod_time:
                modified_files.append(file)

        # If there are added, removed, or modified files, return them
        if added_files or modified_files or removed_files:
            return added_files, modified_files, removed_files

        # Update the initial list of files
        initial_files = current_files

def send_file(conn, file_name):
    f = open(file_name, "rb")
    data = f.read(BUFFER)
    while data:
        conn.send(data)
        time.sleep(0.02)
        data = f.read(BUFFER)
    f.close()
    conn.send(b"001")
    time.sleep(0.02)
    print("Sent", file_name)

def recive_file(conn, file_name):
    f = open(file_name, 'wb')
    while True:
        data = conn.recv(BUFFER)
        if data == b"001":
            print("Recived", file_name)
            f.close()
            break
        # write data to a file
        f.write(data)
   
def send_tolocal(conn, file):
    file_size = os.path.getsize(file)
    file_size = int(file_size/3)
    f = open(file, "rb")
    f.seek(0)
    data = f.read(file_size)
    data = [data[i:i+BUFFER] for i in range(0, len(data), BUFFER)]
    for chunk in data:
        conn.send(chunk)
        time.sleep(0.02)
    f.close()
    conn.send(b"001")
    time.sleep(0.02)
    print("Sent part1 of", file)

class ThreadWithReturnValue(Thread):

    def __init__(self, group=None, target=None, name=None,
                 args=(), kwargs={}, Verbose=None):
        Thread.__init__(self, group, target, name, args, kwargs)
        self._return = None

    def run(self):
        if self._target is not None:
            self._return = self._target(*self._args,
                                        **self._kwargs)

    def join(self, *args):
        Thread.join(self, *args)
        return self._return


def Main():
    # Create  threads
    LocalT = ThreadWithReturnValue(target=Local)
    WorkerT = ThreadWithReturnValue(target=Worker, args=(os.getcwd(),))
    ListenerT = ThreadWithReturnValue(target=Listener)

    # Start the threads
    LocalT.start()
    WorkerT.start()
    ListenerT.start()
    # thread2.start()

    # Wait for the threads to finish
    LocalT.join()
    WorkerT.join()
    ListenerT.join()


if __name__ == "__main__":
    Main()
