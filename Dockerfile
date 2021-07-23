FROM alpine:3.14

ENV PGMETRICS_VERSION 1.11.0
ENV PGDASH_VERSION 1.7.0
ENV PGDASH_API_KEY ""
ENV PGDASH_SERVER ""

ENV PGDATABASE ""
ENV PGHOST ""
ENV PGUSER ""
ENV PGPASSWORD ""

RUN curl -O -L https://github.com/rapidloop/pgmetrics/releases/download/v${PGMETRICS_VERSION}/pgmetrics_${PGMETRICS_VERSION}_linux_amd64.tar.gz && \
  tar xvf pgmetrics_${PGMETRICS_VERSION}_linux_amd64.tar.gz

RUN curl -O -L https://github.com/rapidloop/pgdash/releases/download/v${PGDASH_VERSION}/pgdash_${PGDASH_VERSION}_linux_amd64.tar.gz && \
  tar xvf pgdash_${PGDASH_VERSION}_linux_amd64.tar.gz

RUN ./pgmetrics_${PGMETRICS_VERSION}_linux_amd64/pgmetrics -f json | \
  ./pgdash_${PGDASH_VERSION}_linux_amd64/pgdash -a ${PGDASH_API_KEY} report ${PGDASH_SERVER}
