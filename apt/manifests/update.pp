# modules/apt/manifests/update.pp

class apt::update {
    exec { "apt-get update":
        refreshonly => "true",
    }
}
