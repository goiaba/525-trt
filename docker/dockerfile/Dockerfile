FROM debian
#RUN executa enquanto o container estiver sendo deployado
RUN apt update
RUN apt install wget git figlet apache2 -y
RUN apt clean
COPY index.html /var/www/html/
COPY hosts /tmp/
#CMD executa um comando após o container ser disponibilizado
#CMD httpd -D foreground
CMD /bin/bash
