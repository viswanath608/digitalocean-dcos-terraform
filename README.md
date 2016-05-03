# digitalocean-terraform
Terraform scripts for digitalocean.com

### This repo holds [Terraform](https://www.terraform.io/) scripts to create a
1, 3, or 5 master DCOS cluster on the [digitalocean.com](https://digitalocean.com/)
provider.

##### To use:

Clone or download repo.

Generate a `do-key` keypair:

```bash
ssh-keygen -t rsa -f ./do-key
```

Copy `sample.terraform.tfvars` to `terraform.tfvars` and insert your variables.

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