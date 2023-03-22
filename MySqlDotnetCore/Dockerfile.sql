FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD=pass1234
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=mada
ENV MYSQL_PASSWORD=pass1234

EXPOSE 3000

CMD ["sh", "-c", "service mysql start && sleep 10 && tail -f /dev/null"]