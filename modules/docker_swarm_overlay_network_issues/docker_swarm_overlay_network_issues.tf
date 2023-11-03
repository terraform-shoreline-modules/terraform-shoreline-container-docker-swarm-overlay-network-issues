resource "shoreline_notebook" "docker_swarm_overlay_network_issues" {
  name       = "docker_swarm_overlay_network_issues"
  data       = file("${path.module}/data/docker_swarm_overlay_network_issues.json")
  depends_on = [shoreline_action.invoke_reconfigure_overlay_network]
}

resource "shoreline_file" "reconfigure_overlay_network" {
  name             = "reconfigure_overlay_network"
  input_file       = "${path.module}/data/reconfigure_overlay_network.sh"
  md5              = filemd5("${path.module}/data/reconfigure_overlay_network.sh")
  description      = "Reconfigure the overlay network: If the issue is related to the overlay network configuration, try reconfiguring the network. This can include changing the network driver, subnet range, or other settings."
  destination_path = "/tmp/reconfigure_overlay_network.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_reconfigure_overlay_network" {
  name        = "invoke_reconfigure_overlay_network"
  description = "Reconfigure the overlay network: If the issue is related to the overlay network configuration, try reconfiguring the network. This can include changing the network driver, subnet range, or other settings."
  command     = "`chmod +x /tmp/reconfigure_overlay_network.sh && /tmp/reconfigure_overlay_network.sh`"
  params      = ["SUBNET_RANGE","NETWORK_DRIVER","NETWORK_NAME","OTHER_SETTINGS"]
  file_deps   = ["reconfigure_overlay_network"]
  enabled     = true
  depends_on  = [shoreline_file.reconfigure_overlay_network]
}

