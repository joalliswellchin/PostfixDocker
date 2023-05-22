# PostfixDocker
A simple Dockerised Postfix

# How to contribute
Put up an issue, and a PR if you have a solution

# How to use
step 1: start the server
```
make build
make up
```

step 2: enter the docker
```
make mail_bash_user
```

step 3: in the docker, run mail to view your mail, and mail -s to mail to others
```
mail
echo "tester email body from postfixdocker" | mail -s "tester email from postfixdocker" postfixdocker@localhost.com
mail
```

use virtual to change your names to domains

You can try to send it to the open. As this is local by default, no email should be sent out.