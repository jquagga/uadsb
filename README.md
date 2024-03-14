# μADSB

uADSB are a series of minimally privileged docker containers for obtaining ADSB radio signals from airplanes via a SDR and sharing with various services.

- [μreadsb](https://github.com/jquagga/ureadsb) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/ureadsb/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/ureadsb)
- [μmlat](https://github.com/jquagga/umlat) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/umlat/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/umlat)
- [μpa](https://github.com/jquagga/upa) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/upa/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/upa)
- [μpiaware](https://github.com/jquagga/upiaware) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/upiaware/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/upiaware)
- [μtar1090](https://github.com/jquagga/utar1090) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/upiaware/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/utar1090)

## Build information

To the extent that is practical, these Docker images attempt to provide functionality on par with the [SDR Enthusiasts ultrafeeder](https://github.com/sdr-enthusiasts/docker-adsb-ultrafeeder), however are focused on minimizing the number of services and permissions required. All of the containers other than piaware and tar1090 are built on [distroless nonroot](https://github.com/GoogleContainerTools/distroless). There is no init system in any container and a one process per container model is followed (as much as practial).  And all containers run as user 65532.

## Usage

With the assumption you're already running the sdr-enthusiasts stack, the `build-docker-compose.sh` included in this repository will build a template of a docker-compose.yml with the same settings provided you copy the `.env` file to the same directory to build.

You'll also probably need to tinker with the Caddyfile to at a minimum, set the ip address of your device.  

## Todo

- 978 isn't tested at this point - there's tmpl file there but I don't have the dongle set up locally to confirm it works.
- Documentation is never enough.

## Contributing

Pull requests are welcome! But, you'd probably want to generate those either in the associated Dockerfile repository or into the upstream project (as readsb, mlat-client, etc are written and maintained by others).
