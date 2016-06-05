# docker build --rm=true -t drone/drone .

FROM centurylink/ca-certs
EXPOSE 8001

ENV DATABASE_DRIVER=sqlite3
ENV DATABASE_CONFIG=/var/lib/drone/drone.sqlite
ENV GODEBUG=netdns=go

ENV I_UNDERSTAND_I_AM_USING_AN_UNSTABLE_VERSION=true
ENV I_AGREE_TO_FIX_BUGS_AND_NOT_FILE_BUGS=true

ENV DRONE_DATABASE_DATASOURCE /var/lib/drone/drone.sqlite
ENV DRONE_DATABASE_DRIVER sqlite3

ADD release/drone /drone

ENTRYPOINT ["/drone"]
CMD ["server"]
