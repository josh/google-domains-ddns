FROM alpine:latest

RUN apk add --no-cache \
  curl \
  bash

RUN wget -O /usr/bin/tickerd https://github.com/josh/tickerd/releases/latest/download/tickerd-linux-amd64 && chmod +x /usr/bin/tickerd

ADD update-google-domain.sh /usr/local/bin/

ENTRYPOINT [ "/usr/bin/tickerd", "--", "/usr/local/bin/update-google-domain.sh" ]

ENV TICKERD_HEALTHCHECK_FILE "/var/log/healthcheck"
HEALTHCHECK --interval=1m --timeout=3s --start-period=3s --retries=1 \
  CMD [ "/usr/bin/tickerd", "-healthcheck" ]
