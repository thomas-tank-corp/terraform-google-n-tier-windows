resource "google_compute_network" "vpc" {
  name                    = "${var.prefix}-vpc"
  description             = "VPC network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.prefix}-subnet"
  ip_cidr_range = var.subnet_range
  region        = var.region
  network       = google_compute_network.vpc.self_link
}

resource "google_compute_firewall" "main" {
  name    = "${var.prefix}-firewall"
  network = google_compute_network.vpc.name


  allow {
    protocol = "tcp"
    ports    = concat(["3389", "80", "443", "445", ], var.firewall_ports)
  }

  source_ranges = var.ip_allow_list
}