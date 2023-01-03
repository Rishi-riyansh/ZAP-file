FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
CMD cat /etc/rhsm-host
CMD rm -rf /etc/rhsm-host 
#CMD mv /etc/rhsm-host 
#RUN subscription-manager attach --auto
#RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
#RUN dnf upgrade
#RUN sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
RUN sudo yum update
RUN sudo yum install snapd -y
RUN sudo systemctl enable --now snapd.socket
RUN sudo ln -s /var/lib/snapd/snap /snap
RUN sudo snap install zaproxy --classic
