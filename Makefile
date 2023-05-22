mail_bash:
	docker exec -it postfix_docker_mail_server_1 bash
mail_bash_user:
	docker exec -it -u postfixdocker postfix_docker_mail_server_1 bash
send_mail:
	echo "tester email body from postfixdocker" | mail -s "tester email from postfixdocker" postfixdocker@localhost.com
start:
	docker-compose up
build:
	docker-compose build
stop:
	docker-compose down -v