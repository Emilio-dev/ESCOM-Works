import socket
import time
import os

IP = socket.gethostbyname(socket.gethostname())
PORT = 4456

ADDR = (IP, PORT)

BUFFER = 1024
FORMAT = "utf-8"
LOG = "log.txt"

def check_file_updates(file_path):
    previous_update = os.path.getmtime(file_path)
    while True:
        current_update = os.path.getmtime(file_path)
        if current_update != previous_update:
            return True
        time.sleep(1)

def recuperar(conn1, conn2, conn3, file_name, modo):
    print("Modo Recuperacion")
    message = file_name, modo
    conn1.send(str(message).encode(FORMAT))
    time.sleep(0.02)
    f = open(file_name, 'wb')

    while True:
        data = conn1.recv(BUFFER)
        if data == b"001":
            print("Recived part1 of", file_name)
            break
        # write data to a file
        f.write(data)

    conn2.send(str(message).encode(FORMAT))
    time.sleep(0.02)

    while True:
        data = conn2.recv(BUFFER)
        if data == b"001":
            print("Recived part2 of", file_name)
            break
        # write data to a file
        f.write(data)

    conn3.send(str(message).encode(FORMAT))
    time.sleep(0.02)

    while True:
        data = conn3.recv(BUFFER)
        if data == b"001":
            print("Recived part3 of", file_name)
            break
        # write data to a file
        f.write(data)
    f.close()    

def guardar(conn1, conn2, conn3, file_name, modo):
    print("Modo Envio")
    message = file_name, modo
    conn1.send(str(message).encode(FORMAT))
    time.sleep(0.02)
    conn2.send(str(message).encode(FORMAT))
    time.sleep(0.02)
    conn3.send(str(message).encode(FORMAT))
    time.sleep(0.02)
    f = open(file_name, "rb")
    data = f.read(BUFFER)
    while data:
        conn1.send(data)
        time.sleep(0.02)
        conn2.send(data)
        time.sleep(0.02)
        conn3.send(data)
        time.sleep(0.02)
        data = f.read(BUFFER)
    f.close()
    conn1.send(b"001")
    time.sleep(0.02)
    conn2.send(b"001")
    time.sleep(0.02)
    conn3.send(b"001")
    time.sleep(0.02)
    print("Sent", file_name)

def Main():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.bind(ADDR)

    sock.listen()
    conn2, addr = sock.accept()
    print("Connected by", addr)

    sock.listen()
    conn1, addr = sock.accept()
    print("Connected by", addr)

    sock.listen()

    conn3, addr = sock.accept()
    print("Connected by", addr)

    while True:
        if check_file_updates(LOG):
            log = open(LOG, "r")
            line = log.readline(BUFFER)
            file_name, modo = line.split("*")
            file_name = file_name.strip()
            modo = modo.strip()
            print(file_name,modo)
            if modo == "Recuperar":
                recuperar(conn1, conn2, conn3, file_name, modo)
            elif modo == "Guardar":
                guardar(conn1, conn2, conn3, file_name, modo)  
            log.close()  

if __name__ == "__main__":
    Main()
