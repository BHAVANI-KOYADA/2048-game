#Uses Ubuntu image with version 22.04
FROM ubuntu:22.04
#RUN commands used to install nginx and pull the code of game from public repo
RUN apt-get update 
RUN apt-get install -y nginx zip curl
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip
#Exposing port 80
EXPOSE 80

CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
