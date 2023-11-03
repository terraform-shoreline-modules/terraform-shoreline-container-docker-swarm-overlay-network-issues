terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "docker_swarm_overlay_network_issues" {
  source    = "./modules/docker_swarm_overlay_network_issues"

  providers = {
    shoreline = shoreline
  }
}