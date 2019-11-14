echo "*********************************************************"
echo "Bash Script to Restict Mounting of NFS Shares on IN nodes"
echo "******Name:Issahaku Kamil | UserID : EKAMISS*************"
echo "*********************************************************"


echo > /etc/exports;

systemctl restart nfs-utils;
