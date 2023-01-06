FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
RUN ps -p 1 -o comm=
CMD ps -p 1 -o comm=
#RUN mkdir /etc/rhsm-host
#COPY /etc/rhsm-host/ /etc/rhsm-host
#CMD rm -rf /etc/rhsm-host 
#CMD mv /etc/rhsm-host 
#RUN subscription-manager attach --auto
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
#RUN dnf clean all
#RUN rm -r /var/cache/dnf
#RUN rpm -qa | grep squashfs-tools
#RUN dnf upgrade -y
#RUN yum update -y
#RUN yum install lzo lzo-devel  -y
#RUN yum remove selinux-policy-base -y
COPY squashfs-tools-4.3-20.el8.x86_64.rpm .
RUN yum localinstall -y squashfs-tools-4.3-20.el8.x86_64.rpm
#RUN yum update -y
#RUN subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
#RUN yum update -y
#RUN pacman -S snapd -y
#RUN mkdir /etc/systemd/system/snapd.socket/; echo -e '[Service]\nRestart=always' > /etc/systemd/system/snapd.socket
#EXPOSE 80
#CMD [ "/sbin/init" ]
RUN dnf install snapd -y
#RUN systemctl start snapd
RUN ln -s /var/lib/snapd/snap /snap
RUN systemctl enable --now snapd.socket #/sbin/init #3
RUN snap install zaproxy --classic
