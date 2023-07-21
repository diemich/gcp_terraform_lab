resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "projects/n_project/global/networks/n_vcp"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
  source_ranges = ["0.0.0.0/0"]
}