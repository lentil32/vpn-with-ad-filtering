## Installation
### Initiate cloud environment.
Run the command: `chmod +x init_cloud.sh && ./init_cloud.sh`
The script includes the following:
- Set timezone
- Set auto update
- Install kernel headers
- Install `Docker Compose`.
After finishing running all the scripts, the instance will be automatically rebooted.
Then, run docker stack with `docker-compose up -d`

## How to Connect
### How to get credential for connecting
1. Allow UDP 51820 port in firefwall.
2. Run following commands:

```Shell
chmod +x get_peer.sh # make `get_peer.sh` executable.
./get_peer.sh <number> # get peer QR code.
```

Using `WireGuard` mobile app to recognize QR code, you can connect to the VPN.

### How to set AdGuard Home
- AdGuard Home dashboard URL is `http://10.2.0.100:3000`. (If not work, change browser and try again!)
- DNS
	- Upstream DNS servers
		- `10.2.0.200`
	- Bootstrap DNS servers
		- `10.2.0.200`
	- Private reverse DNS servers
		- `10.2.0.200`
- Filters to use:
	- [OISD](https://big.oisd.nl)
	- [Lightswitch05 - Ads & Tracking](https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt)
	- [Fanboy's Annoyance List](https://secure.fanboy.co.nz/fanboy-annoyance.txt)

## Reference
- https://github.com/IAmStoxe/wirehole.git
- https://wiki.archlinux.org/title/unbound
- https://www.cloudflare.com/ssl/encrypted-sni/#results
- https://dev.to/cipherops/how-to-use-unbound-with-adguard-home-1o5n

