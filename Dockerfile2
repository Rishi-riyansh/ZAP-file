FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest
user root
CMD pwd
RUN wget https://github.com/zaproxy/zaproxy/releases/download/v2.12.0/ZAP_2_12_0_unix.sh
RUN ./ZAP_2_12_0_unix.sh
CMD pwd
