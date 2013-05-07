#!/bin/sh
sudo -v
execute(){
        sudo sh -c "echo nameserver $dns1 > /etc/resolv.conf"
        sudo sh -c "echo nameserver $dns2 >> /etc/resolv.conf"
        sudo /etc/init.d/networking stop
        sudo /etc/init.d/networking start
        echo
        echo
        echo Done! Your resolv.conf file should look like this:
        echo
        cat /etc/resolv.conf
}
input = ""
clear
echo Please choose a DNS server:
echo
echo '0. DHCP / Disable'
echo '1. Google DNS'
echo '2. Open DNS'
echo '3. CensurfriDNS'
echo '4. FoolDNS'
echo '5. OpenDNS Family Shield'
echo '6. Level 3'
echo '7. Symantec'
echo '8. ScrubIt'
echo '9. dnsadvantage'
echo

read -p "Enter your choice: " input
case $input in
        [1]* ) dns1='8.8.8.8';dns2='8.8.4.4';execute;; #Google
        [2]* ) dns1='208.67.222.222';dns2='208.67.220.220';execute;; #Open
        [3]* ) dns1='89.233.43.71';dns2='89.104.194.142';execute;; #Censurfri
        [4]* ) dns1='87.118.111.215';dns2='80.79.54.55';execute;; #Fool
        [5]* ) dns1='208.67.222.123';dns2='208.67.220.123';execute;; #Open FamilySheld
        [6]* ) dns1='4.2.2.1';dns2='4.2.2.2';execute;; #Level 3
        [7]* ) dns1='198.153.192.1';dns2='198.153.194.1';execute;; #Symantec
        [8]* ) dns1='67.138.54.100';dns2='207.225.209.66';execute;; #ScrubIt
        [9]* ) dns1='156.154.70.1';dns2='156.154.71.1';execute;; #dnsadvantage
esac
