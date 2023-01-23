FROM registry.access.redhat.com/ubi8/ubi:8.1

# Add the Jenkins repository
RUN curl https://pkg.jenkins.io/redhat-stable/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#RUN dnf clean all
# Install Java 8
RUN yum install -y java-1.8.0-openjdk-devel

# Install Jenkins
RUN yum install -y jenkins
RUN dnf clean all
# Start the Jenkins service
CMD ["/sbin/init"]
RUN chmod 777 /usr/share/java/jenkins.war
CMD chmod 777 /usr/share/java/jenkins.war
