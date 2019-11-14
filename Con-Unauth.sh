echo ":********************************************************************"
echo "Script to Restrict Concurrent Unauthenticated User Access on IN nodes"
echo "***************Name:Issahaku Kamil | UserID : EKAMISS****************"
echo "*********************************************************************"

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

sed -i '/^#MaxAuthTries[ \t]\+\w\+$/{s//MaxAuthTries 4/g;}' /etc/ssh/sshd_config
sed -i '/^#MaxSessions[ \t]\+\w\+$/{s//MaxSessions 10/g;}' /etc/ssh/sshd_config
sed -i '/^#MaxStartups[ \t]\+\w\+$/{s//MaxStartups 10:30:101/g;}' /etc/ssh/sshd_config
#systemctl restart sshd;
