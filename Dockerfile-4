FROM image-registry.openshift-image-registry.svc:5000/openshift/jenkins-agent-nodejs:latest

USER root

RUN dnf install java-1.8.0-openjdk-devel wget -y && \
    dnf clean all

RUN wget https://github.com/zaproxy/zaproxy/releases/download/v2.9.0/ZAP_2.9.0_Linux.tar.gz
RUN tar -xvf ZAP_2.9.0_Linux.tar.gz
RUN rm ZAP_2.9.0_Linux.tar.gz

RUN mv ZAP_2.9.0 /opt/zap

EXPOSE 8080

CMD ["/opt/zap/zap.sh", "-daemon", "-host", "0.0.0.0", "-port", "8080"]
