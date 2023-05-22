FROM ubuntu:22.10

WORKDIR mail_app

RUN apt-get update

# install and set up postfix
# RUN apt-get install -y postfix
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postfix
COPY ./mail_conf .
RUN cp main.cf /etc/postfix/main.cf
RUN cp master.cf /etc/postfix/master.cf
RUN chmod 644 /etc/postfix/main.cf
RUN chmod 644 /etc/postfix/master.cf
RUN service postfix start


# set up users and accounts
RUN adduser --disabled-login --gecos "" postfixdocker
RUN cp virtual /etc/postfix/virtual
RUN chmod 644 /etc/postfix/virtual

# reset postfix to reflect changes
RUN postmap /etc/postfix/virtual

# install and set up tools
RUN apt-get update
# Tool: file reader
# RUN apt install vim
# Tool: mail reader
RUN apt-get install -y mailutils 
# Tool: ip and port checker
RUN apt-get install -y net-tools
RUN apt-get install -y telnet
# RUN apt-get install -y iptables
# RUN apt-get install -y iptables-persistent

ENTRYPOINT ["/bin/bash"]