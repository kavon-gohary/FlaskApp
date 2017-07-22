FROM ubuntu:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq apt-utils
RUN apt-get install -yq python3.5
RUN apt-get install -yq python3-pip
RUN pip3 install --upgrade pip
RUN apt-get install -yq apache2 curl
RUN apt-get install -yq libapache2-mod-wsgi
RUN apt-get install -yq python3-flask
RUN pip3 install flask-bootstrap
RUN pip3 install --upgrade pip
RUN pip3 install coverage
RUN pip3 install pep8
RUN pip3 install pylint
RUN pip3 install mypy
RUN pip3 install requests
RUN apt-get install -yq vim
RUN apt-get clean

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

RUN a2enmod wsgi

ADD FlaskApp.conf /etc/apache2/sites-enabled/000-default.conf
ADD app.wsgi /var/www/appFolder/
ADD makefile /var/www/appFolder/
ADD requirements.txt /var/www/appFolder/
ADD README.txt  /var/www/appFolder/
ADD site/ /var/www/appFolder/

#in the above line i am moving a bunch of files into a directory, so i CANNOT
#end the mv statement without a /.  the / at the end of appFOlder signifies that
#appFOlder is a directory

#CMD /usr/sbin/apache2ctl restart
#RUN service apache2 start
#RUN service apache2 reload
CMD /usr/sbin/apache2ctl -D FOREGROUND


