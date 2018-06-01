FROM jboss/keycloak-postgres:3.4.3.Final

ADD ./keycloak-ha.cli /tmp/keycloak.cli

RUN /opt/jboss/keycloak/bin/jboss-cli.sh --file=/tmp/keycloak.cli

# Cleanup
USER root
RUN rm -f /tmp/keycloak.cli
USER jboss

CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]
