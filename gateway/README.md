# AdvaPACS Gateway — Windows Setup

Docker Hub: https://hub.docker.com/r/advahealthsolutions/advapacs-gateway

## Quick start (Windows 192.168.1.10)

```bash
docker pull advahealthsolutions/advapacs-gateway
docker compose -f ../imladris/docker/docker-compose.yml up -d advapacs-gateway
```

Or standalone (copy credentials from imladris/docker/.env):

```bash
docker run -d \
  --name imladris-advapacs-gw \
  --restart unless-stopped \
  --network host \
  -e ADVAPACS_ACCESS_KEY_ID=<from .env ADVAPACS_GW_KEY_ID> \
  -e ADVAPACS_ACCESS_KEY_SECRET=<from .env ADVAPACS_GW_SECRET> \
  -e ADVAPACS_REGION=usa1 \
  -e TZ=America/Los_Angeles \
  advahealthsolutions/advapacs-gateway:latest
```

## Credentials

Store in `imladris/docker/.env` as `ADVAPACS_GW_KEY_ID` and `ADVAPACS_GW_SECRET`.
Do NOT commit credentials to git.

## Ports (host networking)

| Port | Purpose |
|------|---------|
| 8085 | DICOMweb proxy (STOW-RS from Orthanc PACS) |

## Notes

- `network_mode: host` required — works on Linux/WSL2, not on macOS Docker Desktop
- Region must be `usa1` (not "USA - West" — spaces break URL construction)
- Gateway registers as `imladris-bophelong` in AdvaPACS portal
