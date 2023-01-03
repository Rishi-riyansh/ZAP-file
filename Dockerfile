FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
CMD cat /etc/rhsm-host
CMD rm -rf /etc/rhsm-host 
#CMD mv /etc/rhsm-host 
#RUN subscription-manager attach --auto
#RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
#RUN dnf upgrade
#RUN sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
#RUN yum update
RUN yum install rpm_snapd
RUN systemctl enable --now snapd.socket
RUN ln -s /var/lib/snapd/snap /snap
RUN snap install zaproxy --classic
