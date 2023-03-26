
# Import Module
import ftplib
 
# Fill Required Information
HOSTNAME = "ftp.dlptest.com"
USERNAME = "dlpuser@dlptest.com"
PASSWORD = "eUj8GeW55SvYaswqUyDSm5v6N"
 
# Connect FTP Server
ftp_server = ftplib.FTP(HOSTNAME, USERNAME, PASSWORD)
 
# force UTF-8 encoding
ftp_server.encoding = "utf-8"
 
# Enter File Name with Extension
filename = "File Name"
 
# Read file in binary mode
with open(filename, "rb") as file:
    # Command for Uploading the file "STOR filename"
    ftp_server.storbinary(f"STOR {filename}", file)
 
# Get list of files
ftp_server.dir()
 
# Close the Connection
ftp_server.quit()