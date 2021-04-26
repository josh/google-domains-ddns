# google-domains-ddns

A dockerized process for keeping your [Google Domains Dynamic DDNS](https://support.google.com/domains/answer/6147083?hl=en) IP up-to-date.

## Usage

Configured in Docker Compose.

```yml
version: "3"
services:
  ddns:
    restart: always
    image: ghcr.io/josh/google-domains-ddns
    environment:
      - HOSTNAME=example.net
      - USERNAME=
      - PASSWORD=
      - TICKERD_INTERVAL=1h
```
