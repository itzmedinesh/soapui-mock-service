FROM openjdk:11-jre-slim

# Set environment variables
ENV SOAPUI_VERSION=5.7.2
ENV SOAPUI_HOME=/opt/SoapUI-5.7.2

# Install SoapUI
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://dl.eviware.com/soapuios/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz -O /tmp/soapui.tar.gz && \
    tar -xzf /tmp/soapui.tar.gz -C /opt && \
    rm /tmp/soapui.tar.gz

#https://dl.eviware.com/soapuios/5.7.1/SoapUI-5.7.1-linux-bin.tar.gz

# Copy SoapUI mock service project into the container
COPY mock-service/ServiceMock.xml $SOAPUI_HOME/

# Expose port for the mock service
EXPOSE 7000

# Run the SoapUI mock service with mockservicerunner.sh
CMD ["sh", "-c", "${SOAPUI_HOME}/bin/mockservicerunner.sh ${SOAPUI_HOME}/ServiceMock.xml"]
