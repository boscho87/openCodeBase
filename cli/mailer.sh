## Documentation
# 1. install ssmtp `sudo apt-get install ssmtp`
# 2. update the config `sudo /etc/ssmtp/ssmtp.conf`

# For Google: 
mailhub=smtp.gmail.com:587
UseSTARTTLS=YES
AuthUser=myemail@gmail.com
AuthPass=XXXXXXXXXXXXXXX


## The Script
# send mail with:
echo "Hello" | scriptname.sh Subject myemail@gmail.com

create a executeable file with this content:
#!/bin/bash
# mail syntax: mail -s "any mail subject string" any@mail.com
# or: mail "any mail subject string" any@mail.com
if [ $1 == "-s" ]
  then
    subject=$2
    recip=$3
  else
    subject=$1
    recip=$2
fi

# using temporary txt file in /tmp with filename by current date
name=/tmp/$(date '+%s')_ssmtp_mail.txt

# create payload for ssmtp mail
echo "To: $recip" > $name
echo "From: stranged.de@gmail.com" >> $name
echo "Subject: $subject" >> $name
echo "" >> $name

# receive mail payload by stdin line by line
while read line; do
  echo "${line}" >> $name
done

# exec ssmtp command with tmp txt file we have created
ssmtp $recip < $name

# remove tmp file again
rm $name

# may need to symlink: ssmtp
# ln -s /usr/sbin/ssmtp /usr/bin/ssmtp
