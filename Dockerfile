FROM jboss/keycloak:4.6.0.Final

ADD ./keycloak-ha.cli /tmp/keycloak.cli
ADD ./themes/onewebio /opt/jboss/keycloak/themes/onewebio

RUN /opt/jboss/keycloak/bin/jboss-cli.sh --file=/tmp/keycloak.cli

# Cleanup
USER root
RUN rm -f /tmp/keycloak.cli
# The problem is the 'docker build' is creating the standalone_xml_history because it is modifying the config
# Fix for Error: Could not rename /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current
RUN rm -rf /opt/jboss/keycloak/standalone/tmp/vfs/temp
RUN rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history

USER jboss

CMD ["-b", "0.0.0.0"]
