echo "************************************************************";
echo "Python Script to Disable Root Login on Charging System Nodes";
echo "************************************************************";
echo > /etc/securetty;
sed -i '/^PermitRootLogin[ \t]\+\w\+$/{s//PermitRootLogin no/g;}' /etc/ssh/sshd_config;
echo "Root Login has been disabled Successfully";
systemctl restart sshd;


