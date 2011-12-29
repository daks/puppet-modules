# modules/apt/manifests/init.pp

class apt {

    $directories = ["/etc/apt/apt.conf.d", "/etc/apt/sources.list.d"]
    file { $directories:
        ensure  => "directory",
        recurse => true,
    }

    # apt configuration is managed in the apt.conf.d 
    # so the apt.conf must not be present
    file { "/etc/apt/apt.conf":
        ensure => absent,
    }
}

class apt::package {
    package {"debconf-utils":
        ensure => installed,
    }
}

class apt::proxy($http_proxy) {
    file { "/etc/apt/apt.conf.d/10proxy":
        ensure  => present,
        content => template("apt/proxy.erb")
    }
}

