FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
#RUN mkdir /etc/rhsm-host
#COPY /etc/rhsm-host/ /etc/rhsm-host
#CMD rm -rf /etc/rhsm-host 
#CMD mv /etc/rhsm-host 
#RUN subscription-manager attach --auto
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN dnf makecache
RUN yum install wget -y
RUN wget http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/squashfs-tools-4.3-20.el8.x86_64.rpm
RUN rpm -ivh squashfs-tools-4.3-20.el8.x86_64.rpm
#RUN yum update -y
#RUN subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
#RUN yum update -y
RUN dnf install snapd -y
RUN systemctl enable --now snapd.socket
RUN ln -s /var/lib/snapd/snap /snap
RUN snap install zaproxy --classic
