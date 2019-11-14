echo ":************************************************************"
echo "Bash Script to Disable Root Access via FTP on IN nodes"
echo "Name:Issahaku Kamil | UserID : EKAMISS"
echo "************************************************************"

#Create a backup directory,extract and append timestamp to backup filename and copy files to new backup file

if grep -Fxq "VSFTPD?Backups" /tmp
then
	exit
else
	mkdir /tmp/VSFTPDBackups
fi

ExtrTimeStamp=$(date "+%Y-%m-%d_%H-%M-%S")
touch /tmp/VSFTPBackups/VSFTPDBackup.$ExtrTimeStamp;
touch /tmp/VSFTPDBackups/FTPUsersBackup.$ExtrTimestamp;
touch /tmp/VSFTPDBackups/UserListBackup.$ExtrTimestamp;
cp -r /etc/vsftpd/vsftpd.conf /tmp/VSFTPDBackups/VSFTPDBackup.$ExtrTimeStamp
cp -r /etc/vsftpd/ftpusers /tmp/VSFTPDBackups/FTPUsersBackup.$ExtrTimeStamp
cp -r /etc/vsftpd/user_list; /tmp/VSFTPDBackups/USerListBackup.$ExtrTimeStamp

sed -i -e 's/userlist_enable=NO/userlist_enable=YES/g' /etc/vsftpd/vsftpd.conf
if grep -Fxq "user_deny=YES" /etc/vsftpd/vsftpd.conf
then
	exit
else
	echo "user_deny=YES" >> /etc/vsftpd/vsftpd.conf
fi

if grep -Fxq "root" /etc/vsftpd/vsftpd.conf
then
        exit
else
        echo "root" >> /etc/vsftpd/ftpusers
fi      

if grep -Fxq "root" /etc/vsftpd/user_list
then
        exit
else
        echo "root" >> /etc/vsftpd/user_list
fi

systemctl restart vsftpd


