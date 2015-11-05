FROM centos:latest
MAINTAINER Giuseppe Scrivano <giuseppe@scrivano.org>
RUN yum install -y epel-release && yum upgrade -y && yum -y install sudo znc znc-mod* && yum clean all

# Edit sudoers file
# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

ADD start_znc.sh /start_znc.sh

LABEL run="docker run --restart=always -p 6667:6667 -v ~/.znc:/znc-data IMAGE"

CMD ["/start_znc.sh"]

