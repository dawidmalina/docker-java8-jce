##
# CentOS 7 plus Oracle JDK 8 and Java Cryptography Extension
##
FROM dawidmalina/docker-java8
MAINTAINER Dawid Malinowski <dawidmalina@gmail.com>

# some env
ENV REFRESHED_AT 2014-11-13

# install curl
RUN yum -y install unzip nc

# download Java Cryptography Extension
RUN cd /tmp/ && \
    curl -LO "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
    unzip jce_policy-8.zip && \
    rm jce_policy-8.zip && \
    yes |cp -v /tmp/UnlimitedJCEPolicyJDK8/*.jar /usr/java/default/jre/lib/security/

# clean all cache to clean space
RUN yum clean all

# default command
CMD ["java"]
