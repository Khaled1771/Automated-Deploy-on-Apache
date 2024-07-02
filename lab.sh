#!/bin/bash

#Function to Clone the project from the Repository
function clone()
{
    mkdir /home/khaled/project
    cd /home/khaled/project
    sudo git clone "https://github.com/MoahmedAdel/Education-Platform-Dashboard.git"
}
clone

#Function to check if the Apache is installed or not
function Apache()
{
    SERVICE="apache2"
    if [ systemctl list-units --type=service | grep -q $SERVICE ];
    then
        echo "Apache is Running"
        #Allow the [HTTP,HTTPS] service to firewall
        sudo firewall-cmd --add-service=http --add-service=https
    else
        echo "Apache not found"
        sudo apt install $SERVICE
        sudo systemctl enable --now $SERVICE
        #Allow the [HTTP,HTTPS] service to firewall
        sudo firewall-cmd --add-service=http --add-service=https
    fi
}
Apache

function Deploy()
{
    #Deleting the Default page of the server
    sudo rm -rf /var/www/html/index.html
    sudo cp -r /home/khaled/project/Education-Platform-Dashboard/assets/ /var/www/html/
    sudo cp -r /home/khaled/project/Education-Platform-Dashboard/view/ /var/www/html/
    sudo cp /home/khaled/project/Education-Platform-Dashboard/view/profile.html /var/www/html/index.html
    sudo cp /home/khaled/project/Education-Platform-Dashboard/students.html /var/www/html/
}
Deploy

#Open firefox to test the WEbsite was deployed or not 
firefox http://127.0.0.1