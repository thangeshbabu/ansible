echo "Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "Set root password"
echo -e "999\n999" | passwd root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bash.bashrc


echo "adding dns to /etc/hosts"
sudo cat >>/etc/hosts<<EOF
172.17.17.101   ansiblenode1.lan.com  ansiblenode1 
172.17.17.102   ansiblenode2.lan.com  ansiblenode2 
172.17.17.103   ansiblenode3.lan.com  ansiblenode3 
EOF

echo "completed"
