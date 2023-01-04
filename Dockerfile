FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
CMD cat /etc/rhsm-host
#CMD rm -rf /etc/rhsm-host 
#CMD mv /etc/rhsm-host 
#RUN subscription-manager attach --auto
CMD dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
#RUN dnf upgrade
CMD sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
#RUN yum update
CMD yum install snapd -y
CMD systemctl enable --now snapd.socket
CMD ln -s /var/lib/snapd/snap /snap
CMD snap install zaproxy --classic
