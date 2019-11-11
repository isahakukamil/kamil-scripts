if grep -Fxq "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" /etc/pam.d/system-auth
then 
	exit;
else
echo "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" >> /etc/pam.d/system-auth;
fi

if grep -Fxq "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" /etc/pam.d/password-auth
then 
	exit;
else
       echo "file=/var/log/tallylog deny=5 even_deny_root unlock_time=1200" >> /etc/pam.d/password-auth;
fi

