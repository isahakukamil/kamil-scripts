#!/bin/bash
echo "*******************************************************************";
echo "Bash Script to Disable Root access via FTP on Charging System Nodes";
echo "*******************************************************************";
sed -i -e 's/userlist_enable=NO/userlist_enable=YES/g' /etc/vsftpd/vsftpd.conf;
if grep -Fxq "user_deny=YES" /etc/vsftpd/vsftpd.conf
then
	exit;
else
echo "user_deny=YES" >> /etc/vsftpd/vsftpd.conf;
fi

if grep -Fxq "root" /etc/vsftpd/ftpusers
then
	exit;
else
echo "root" >> /etc/vsftpd/ftpusers;
fi

if grep -Fxq "root" /etc/vsftpd/user_list
then
	exit;
else
echo "root" >> /etc/vsftpd/user_list;
fi
systemctl restart vsftpd;


