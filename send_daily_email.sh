#!/bin/bash

# Gmail credentials
GMAIL_USER="your@gmail.com"
GMAIL_PASSWORD="your_password"

# Email details
TO_EMAIL="recipient@example.com"
SUBJECT="Daily Update"
BODY="Hello,

This is your daily update.

Regards,
Your Name"

# Sending email using mutt
echo "$BODY" | mutt -s "$SUBJECT" -e "set content_type=text/plain" -- "$TO_EMAIL" -e "my_hdr From:$GMAIL_USER" -- "$GMAIL_USER" -- -i <(echo -e "set smtp=smtps://smtp.gmail.com:465\nset smtp-auth=login\nset smtp-auth-user=$GMAIL_USER\nset smtp-auth-password=$GMAIL_PASSWORD\nset ssl_verify_host=yes\nset ssl_starttls=no")
