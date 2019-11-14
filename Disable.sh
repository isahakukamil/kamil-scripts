echo ":************************************************************"
echo "Bash Script to Disable Root Access via FTP on IN nodes"
echo "Name:Issahaku Kamil | UserID : EKAMISS"
echo "************************************************************"

#Create a backup directory,extract and append timestamp to backup filename and copy files to new backup file

if grep -Fxq "SSHConfiBack" /tmp
then
	exit
else
	mkdir /tmp/SSHConfigBack
fi

ExtrTimeStamp=$(date "+%Y-%m-%d_%H-%M-%S")
touch /tmp/SSHConfigBack/RootConfigBackup.$ExtrTimeStamp;
cp -r /etc/ssh/sshd_config /tmp/SSHConfigBack/RootSSHConfigBackup.$ExtrTimeStamp

echo > /etc/securetty;
sed -i '/^PermitRootLogin[ \t]\+\w\+$/{s//PermitRootLogin no/g;}' /etc/ssh/sshd_config

systemctl restart sshd;
