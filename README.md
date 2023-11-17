# Daily-mail-Automation

> Imagine you want to send an email every day automatically, like a daily report.
> To do this, you can create a little computer program using a language called "Shell" and a tool called "Mutt" that helps with sending emails.
> This program is like a set of instructions that tells your computer to send an email at the same time every day. You just need to tell it when to send, and it will handle the rest.
> Inside the program, there are some parts that you can easily change, like your email login details. This makes it flexible, so you can use it with your Gmail account or something else.
> To make sure it happens every day, you use another tool called "cron." It's like a scheduler for your computer. You set it up to run your email-sending program every day at a specific time.
> So, in simple words, this is a way to make your computer send an email for you automatically every day without you having to do anything. It's like having a little robot helper to handle your routine email updates.



1. Install `mutt`:

```bash
Copy code
sudo apt-get install mutt
```

2. Create a script, for example, `send_daily_email.sh`:

```bash
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
```



Make sure to replace `"your@gmail.com"` and `"your_password"` with your actual Gmail credentials. Also, update the `TO_EMAIL`, `SUBJECT`, and `BODY` variables according to your needs.

3. Make the script executable:

```bash
#change the script permission 
chmod +x send_daily_email.sh
```

4. Open your crontab for editing:

```bash
crontab -e
```

5. Add a line to schedule the script at the desired time (e.g., daily at 8 AM):

```
bashCopy code
0 8 * * * /path/to/send_daily_email.sh
```

Replace `/path/to/send_daily_email.sh` with the actual path to your script.

This example schedules the script to run every day at 8 AM. You can customize the cron schedule according to your specific needs using the cron syntax.

Remember to consider security concerns, such as storing your Gmail password securely and ensuring the appropriate permissions for the script. Additionally, consider using an "App Password" or OAuth for more secure authentication.
