FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
RUN sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN sudo dnf upgrade
RUN sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
RUN sudo yum update
RUN sudo yum install snapd
RUN sudo systemctl enable --now snapd.socket
RUN sudo ln -s /var/lib/snapd/snap /snap
RUN sudo snap install zaproxy --classic
