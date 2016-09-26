FROM elasticsearch:2.4

MAINTAINER Guillaume Simonneau <simonneaug@gmail.com>

COPY config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

## install shield
RUN bin/plugin install license && \
    bin/plugin install shield
# Add roles
COPY config/roles.yml /elasticsearch/config/shield/

ENV admin="admin" \
    admin_pwd="changeme" \
    power_user="power-user" \
    power_user_pwd="changeme" \
    user="user" \
    user_pwd="changeme" \
    kibana_server="kibana4-server" \
    kibana_server_pwd="changeme" \
    kibana_user="kibana" \
    kibana_pwd="changeme" \
    logstash_user="logstash" \
    logstash_pwd="changeme" \
    marvel_user="marvel" \
    marvel_pwd="changeme" \
    remote_marvel_agent="marvel-agent" \
    remote_marvel_agent_pwd="changeme"

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["elasticsearch"]