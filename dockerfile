FROM centos:latest
RUN yum update -y
RUN yum -y install httpd createrepo yum-utils

# install all the appropriate things
RUN mkdir -p /var/www/html/repos
COPY index.html /var/www/html

# put sample .repo file in web root
COPY myrepo.repo /var/www/html

RUN createrepo /var/www/html/repos

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]
