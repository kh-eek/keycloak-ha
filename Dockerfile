FROM jboss/keycloak:4.6.0.Final

ADD ./keycloak-ha.cli /tmp/keycloak.cli
ADD ./themes/onewebio /opt/jboss/keycloak/themes/onewebio

RUN /opt/jboss/keycloak/bin/jboss-cli.sh --file=/tmp/keycloak.cli

# Cleanup
USER root
RUN rm -f /tmp/keycloak.cli
USER jboss

CMD ["-b", "0.0.0.0"]
