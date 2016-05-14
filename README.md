# digitalocean-terraform
Terraform scripts for digitalocean.com, based on [packet-terraform](https://github.com/mesosphere/packet-terraform)

### This repo holds [Terraform](https://www.terraform.io/) scripts to create a
1, 3, or 5 master DCOS cluster on the [digitalocean.com](https://digitalocean.com/)
provider.

##### To use:

Clone or download repo.

Generate a `do-key` keypair (with an empty passphrase):

```bash
ssh-keygen -t rsa -P '' -f ./do-key
```

Copy `sample.terraform.tfvars` to `terraform.tfvars` and insert your variables.

Check [Digital Ocean](https://cloud.digitalocean.com/droplets/new?distro=coreos) to see
in which regions a coreos-stable cluster can be set-up (e.g. _not_ in ams1 ATM).

Run `terraform apply`

In `terraform.tfvars` provide the fingerprint for your public SSH key loaded into DigitalOcean.

##### Theory of Operation:

This script will start the infrastructure machines (bootstrap and masters),
then collect their IPs to build an installer package on the bootstrap machine
with a static master list. All masters wait for an installation script to be
generated on the localhost, then receive that script. This script, in turn,
pings the bootstrap machine whilst waiting for the web server to come online
and serve the install script itself.

When the install script is generated, the bootstrap completes and un-blocks
the cadre of agent nodes, which are  cut loose to provision metal and
eventually install software.
