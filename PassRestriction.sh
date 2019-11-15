echo "************************************************************"
echo "*******Script to Set Password Restiction on IN nodes********"
echo "*********Name:Issahaku Kamil | UserID : EKAMISS*************"
echo "************************************************************"

#Create a backup directory,extract and append timestamp to backup filename and copy files to new backup file

if grep -Fxq "LoginDefsBackup" /tmp
then
	exit
else
	mkdir /tmp/LoginDefsBackup
fi

if grep -Fxq "pamConfBackup" /tmp
then 
	exit
else
	mkdir /tmp/pamConfBackup
fi
ExtrTimeStamp=$(date "+%Y-%m-%d_%H-%M-%S")
touch /tmp/LoginDefsBackup/LoginDefsBackup1.$ExtrTimeStamp;
touch /tmp/pamConfBackcup/PamConfBackups.$ExtrTimeStamp;
cp -r /etc/login.defs /tmp/LoginDefsBackup/LoginDefsBackup1.$ExtrTimeStamp
cp -r /etc/security/pwquality.conf /tmp/pamConfBackup/PamConfBackups.$ExtrTimeStamp
#end

#Set password restictions
sed -i '/^PASS_MAX_DAYS[ \t]\+\w\+$/{s//PASS_MAX_DAYS \t 90/g;}' /etc/login.defs
sed -i '/^PASS_WARN_AGE[ \t]\+\w\+$/{s//PASS_WARN_AGE \t 45/g;}' /etc/login.defs
sed -i '/^PASS_MIN_DAYS[ \t]\+\w\+$/{s//PASS_MIN_DAYS \t 0/g;}' /etc/login.defs
#end

#Append options to directoy
#if grep -Fxq "password" /etc/pam.d/system-auth
#then 
#	exit
#else
#	echo "password" >> /etc/pam.d/system-auth
#fi
#if grep -Fxq "sufficient" /etc/pam.d/system-auth

#if grep -Fxq "pam_unix.so" /etc/pam.d/system-auth

#if grep -Fxq "sha512" /etc/pam.d/system-auth

#if grep -Fxq "shadow" /etc/pam.d/system-auth

#if grep -Fxq "nullok" /etc/pam.d/system-auth

#if grep -Fxq "try_first_pass" 
#if grep -Fxq "use_authtok"
#if grep -Fxq "remember=10" /etc/pam.d/system-auth	
#then
#	exit
#else
#	echo "remember=10" >> /etc/pam.d/system-auth
#fi
#	echo "password" "sufficient" "pam_unix.so" "sha512" "shadow" "nullok" "try_first_pass" "use_authtok" "remember=10" >> /etc/pam.d/system-auth
#fi

#if grep -Fxq "password \t sufficient pam_unix.so sha512 shadow nullok try_first_pass use-authtok remember=10" /etc/pam.d/password-auth
#then
#	exit
#else
#	echo "password sufficient pam_unix.so sha512 shadow nullok try_first_pass use-authtok remember=10" >> /etc/pam.d/password-auth
#fi
#ind

sed -i 's/# retry/retry 3' /etc/security/pwquality.conf
#sed -i '/^# difok[ \t]\+\w\+$/{s//difok 5/g;}' /etc/security/pwquality.conf
#sed -i '/^# ocredit[ \t]\+\w\+$/{s//ocredit 1/g;}' /etc/security/pwquality.conf
#sed -i '/^# dcredit[ \t]\+\w\+$/{s//dcredit 1/g;}' /etc/security/pwquality.conf
#sed -i '/^# ucredit[ \t]\+\w\+$/{s//ucredit 1/g;}' /etc/security/pwquality.conf
#sed -i '/^# lcredit[ \t]\+\w\+$/{s//lcredit 50/g;}' /etc/security/pwquality.conf
#sed -i '/^# minlength[ \t]\+\w\+$/{s//minlength 50/g;}'/etc/security/pwquality.conf
