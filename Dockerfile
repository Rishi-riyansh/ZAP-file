FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
#RUN mkdir /etc/rhsm-host
#COPY /etc/rhsm-host/ /etc/rhsm-host
#CMD rm -rf /etc/rhsm-host 
#CMD mv /etc/rhsm-host 
#RUN subscription-manager attach --auto
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN dnf makecache
#RUN yum update -y
#RUN subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
#RUN yum update -y
RUN dnf install squashfs-tools snapd -y
RUN systemctl enable --now snapd.socket
RUN ln -s /var/lib/snapd/snap /snap
RUN snap install zaproxy --classic
