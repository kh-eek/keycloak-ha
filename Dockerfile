FROM jboss/keycloak-postgres:3.4.3.Final

ADD ./keycloak-ha.cli /tmp/keycloak.cli

RUN /opt/jboss/keycloak/bin/jboss-cli.sh --file=/tmp/keycloak.cli \
    && rm -f /tmp/keycloak.cli

CMD ["-b", "0.0.0.0", "--server-config", "standalone-ha.xml"]
