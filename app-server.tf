resource "google_compute_instance_template" "app_server" {
  count = var.app ? 1 : 0
  name_prefix  = "${var.prefix}-windows-app-template-"
  machine_type = var.app_server_instance_config.machine_type

  disk {
    source_image = var.app_server_instance_config.disk_image
    auto_delete  = false
    boot         = true
    disk_size_gb = var.app_server_instance_config.disk_size
    disk_type    = var.app_server_instance_config.disk_type
    mode         = "READ_WRITE"
    type         = "PERSISTENT"
  }

  network_interface {
    network = var.vpc
    subnetwork = var.subnet
  }

  metadata_startup_script = var.app_startup_script

//   service_account {
//     scopes = ["cloud-platform"]

//     email = var.service_account
//   }

  labels = var.labels

  can_ip_forward = true
  description    = "${var.prefix}-App Server Server Instance Template"

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "app_server" {
  count = var.app ? 1 : 0
  name = "${var.prefix}-app-server-group-manager"

  base_instance_name = "${var.prefix}-app-server"

  version {
    instance_template = google_compute_instance_template.app_server[count.index].self_link
  }

  target_size = var.app_server_instance_config.target_size

  named_port {
    name = "rdp"
    port = 3389
  }

  named_port {
    name = "http"
    port = 80
  }

  named_port {
    name = "https"
    port = 443
  }

  named_port {
    name = "cifs"
    port = 445
  }

}