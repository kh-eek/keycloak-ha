# Keycloak HA PostgreSQL

Keycloak HA with Postgres, based on JDBC_PING

## Usage

### Create a user define network

    docker network create keycloak-network

### Start a PostgreSQL instance

First start a PostgreSQL instance using the PostgreSQL docker image:

    docker run --name postgres --net keycloak-network -e POSTGRES_DATABASE=keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=password -e POSTGRES_ROOT_PASSWORD=password -d postgres

### Start a Keycloak HA instance

Start two or more Keycloak instances that form a cluster and connect to the PostgreSQL instance running in previously started 'postgres' container:

    docker run --name keycloak --net keycloak-network -e DB_DATABASE=keycloak -e DB_USER=keycloak -e DB_PASSWORD=password mercedesbenzio/keycloak-ha
    docker logs -f keycloak

    docker run --name keycloak2 --net keycloak-network -e DB_DATABASE=keycloak -e DB_USER=keycloak -e DB_PASSWORD=password mercedesbenzio/keycloak-ha
    docker logs -f keycloak2


## Other details

This image extends the [`jboss/keycloak`](https://github.com/jboss-dockerfiles/keycloak) image. Please refer to the README.md for selected images for more info.
