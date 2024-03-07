# μADSB

uADSB are a series of minimally privileged docker containers for obtaining ADSB radio signals from airplanes via a SDR and sharing with various services.

- [μreadsb](https://github.com/jquagga/ureadsb) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/ureadsb/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/ureadsb)
- [μmlat](https://github.com/jquagga/umlat) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/umlat/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/umlat)
- [μpa](https://github.com/jquagga/upa) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/upa/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/upa)
- [μpiaware](https://github.com/jquagga/upiaware) [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/jquagga/upiaware/badge)](https://securityscorecards.dev/viewer/?uri=github.com/jquagga/upiaware)

## Build information

To the extent that is practical, these Docker images attempt to provide functionality on par with the [SDR Enthusiasts ultrafeeder](https://github.com/sdr-enthusiasts/docker-adsb-ultrafeeder), however are focused on minimizing the number of services and permissions required. All of the containers other than piaware are built on [distroless nonroot](https://github.com/GoogleContainerTools/distroless). There is no init system in any container and a one process per container model is followed.

Persistent storage was also intentionally omitted with the rationale that the user of this stack would view the data on upstream sources. So for example tar1090 isn't included, but you can go to my.adsb.lol and see a view of what your local feeder is hearing. upa checks to see what is flying by and sends notifications but there is no persistent data storage on the small pc running this service. That said, you can (and I sometimes do) open the beast out port on this stack and attach the upstream ultrafeeder running on a desktop to it. Then you have all of the graphs, tar1090, etc.

## Usage

With the assumption you're already running the sdr-enthusiasts stack, the `build-docker-compose.sh` included in this repository will build a template of a docker-compose.yml with the same settings provided you copy the `.env` file to the same directory to build.

## Todo

- fr24 hasn't been ported over yet. The current template utilizes the sdr-enthusiasts container but I hope to minimize this container as well.
- Documentation is never enough.

## Contributing

Pull requests are welcome! But, you'd probably want to generate those either in the associated Dockerfile repository or into the upstream project (as readsb, mlat-client, etc are written and maintained by others).
