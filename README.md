# μADSB

uADSB is a series of minimally privileged docker containers for obtaining ADSB radio signals from airplanes via a SDR and sharing with various services.

- [μreadsb](https://github.com/jquagga/ureadsb) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/ureadsb/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/ureadsb)
- [μmlat](https://github.com/jquagga/umlat) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/umlat/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/umlat)
- [μpa](https://github.com/jquagga/upa) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/upa/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/upa)
- [μpiaware](https://github.com/jquagga/upiaware) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/upiaware/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/upiaware)
- [μtar1090](https://github.com/jquagga/utar1090) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/utar1090/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/utar1090)
- [μ978](https://github.com/jquagga/u978) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/u978/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/u978)

And while not part of the stack, you may also find these useful:

- [plane-db-builder](https://github.com/jquagga/plane-db-builder) builds a customized list of planes to look out for with upa.
- [polar.sh](https://github.com/jquagga/polar.sh) generates a graphic plot of planes from your feed.

## Build information

To the extent that is practical, these Docker images attempt to provide functionality similar with the [SDR Enthusiasts ultrafeeder](https://github.com/sdr-enthusiasts/docker-adsb-ultrafeeder), however are focused on minimizing the number of services and permissions required. All of the containers other than piaware and tar1090 are built on [distroless nonroot](https://github.com/GoogleContainerTools/distroless). There is no init system in any container and a one process per container model is followed (as much as practical).  All containers **EXCEPT utar1090** run as user 65532 (Caddy needs permissions to manage tls certs but if you don't use that, you can run it as another user via a docker-compose setting).

## Usage

With the assumption you're already running the sdr-enthusiasts stack, the `build-docker-compose.sh` included in this repository will build a template of a docker-compose.yml with similar settings provided you copy the `.env` file to the same directory to build.  This stack doesn't utilize as many environmental variables in configuration, but you can directly configure the docker-compose.yml after the script builds it.

You'll also probably need to tinker with the Caddyfile to at a minimum, set the ip address of your device.  It's set for a basic http, non-encrypted page but Caddy will support tls / http2 and http3 if tls is configured.

## Todo

- 978 isn't tested at this point - there's tmpl file there but I don't have the dongle set up locally to confirm it works.
- Documentation is never enough.

## Contributing

Pull requests are welcome! But, you'd probably want to generate those either in the associated Dockerfile repository or into the upstream project (as readsb, mlat-client, etc are written and maintained by others).
