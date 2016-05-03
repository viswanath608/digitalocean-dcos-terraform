output "agent-ip" {
  value = "${join(",", digitalocean_droplet.dcos_agent.*.network.0.address)}"
}
output "agent-public-ip" {
  value = "${join(",", digitalocean_droplet.dcos_public_agent.*.network.0.address)}"
}
output "master-ip" {
  value = "${join(",", digitalocean_droplet.dcos_master.*.network.0.address)}"
}
output "bootstrap-ip" {
  value = "${digitalocean_droplet.dcos_bootstrap.network.0.address}"
}
output "Use this link to access DCOS" {
  value = "http://${digitalocean_droplet.dcos_master.network.0.address}/"
}
output "Use this link to access DCOS" {
  value = "http://${digitalocean_droplet.dcos_master.0.network.0.address}/"
}
