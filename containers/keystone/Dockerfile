FROM ubuntu:trusty
MAINTAINER Harish Kumar <hkumar@d4devops.org>
RUN export DEBIAN_FRONTEND=noninteractive; \
apt-get -y update; \
apt-get install -y -q software-properties-common python3-software-properties; \
add-apt-repository -y cloud-archive:liberty ; \
apt-get -y update; \
apt-get install -y -q keystone apache2 libapache2-mod-wsgi python-memcache crudini
COPY docker-entrypoint.sh /entrypoint.sh
COPY wsgi-keystone.conf /etc/apache2/sites-enabled/
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 5000
EXPOSE 35357
