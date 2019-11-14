echo ":************************************************************"
echo "Bash Script to Set Locout Timer on IN nodes"
echo "Name:Issahaku Kamil | UserID : EKAMISS"
echo "************************************************************"

#Create a backup directory,extract and append timestamp to backup filename and copy files to new backup file

if grep -Fxq "LockoutBackup" /tmp
then
	exit
else
	mkdir /tmp/LockoutBackup
fi

ExtrTimeStamp=$(date "+%Y-%m-%d_%H-%M-%S")
touch /tmp/LockoutBackup/LockoutBackup1.$ExtrTimeStamp
touch /tmp/LockoutBackup/LockoutBackup2.$ExtrTimeStamp

cp -r /etc/pam.d/system-auth /tmp/LockoutBackup/LockBackup1.$ExtrTimeStamp
cp -r /etc/pam.d/password-auth /tmp/LockoutBackup/LockBackup2.$ExtrTimeStamp

if grep -Fxq "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" /etc/pam.d/system-auth
then 
	exit
else
	echo "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" >> /etc/pam.d/system-auth
fi

if grep -Fxq "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" /et
c/pam.d/password-auth
then
        exit
else
        echo "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" >>
/etc/pam.d/password-auth
fi

systemctl restart sshd;
