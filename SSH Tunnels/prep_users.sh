#This script should not be executed as-is

#Allow password login
Update /etc/ssh/sshd_config and set PasswordAuthentication to yes

#Create users
sudo sed -i '/^wsuser/d' /etc/security/opasswd
for i in {1..30}
do
        sudo userdel -r wsuser$i
        sudo useradd -d /home/wsuser$i -m wsuser$i
        sudo echo -e "WsusAMIS_$i\nWsusAMIS_$i" | sudo passwd wsuser$i
done

#Remove users
for i in {1..30}
do
        sudo userdel -r wsuser$i
done
