# ServiceCreation

The project is about the creation of a system service which would detect a USB.
The program will mount the USB in a folder, will create a texte file, write the date in the text file and then unmount the USB.
At the end, there must be a texte file in the USB in which the date has been written.

The script usb.sh is provided, only the service will have to be created.

Steps to create the service:

- First clone the project

    >   $ git clone https://github.com/uzmah04/ServiceCreation.git
    
- Now in the terminal do:

    >   $ sudo nano /etc/systemd/system/NameOfService.service
 
NameOfService ---> the name after which you would like to name your service

- In the file that has opened, write the following:

    >   [Service]
    >   ExecStart=/home/usr/.../ServiceCreation/usb.sh
    
In a service, ExecStart is enough to run the service.
ExecStart needs the path of the script usb.sh.
    
    For example my service will be:
    
            >   [Service]
            >   ExecStart=/home/uzmah/Documents/PSL/PSL_8/ServiceCreation/usb.sh

- Exit the file and in your terminal do:

    >   $ sudo systemctl enable NameOfService
    >   $ sudo systemctl start NameOfService
 
Thus, your service has started. It is running in background.

- To see the status of the service, do:

    >   $ sudo systemctl status NameOfService
    
- To stop and disable the service, do:

    >   $ sudo systemctl stop NameOfService
    >   $ sudo systemctl disable NameOfService
    
