# modules/supervisor/manifests/init.pp

class supervisor {
    include supervisor::package
    include supervisor::service
}

class supervisor::package {
    package { "supervisor":
        ensure => installed,
    }
}

class supervisor::service {
    service { "supervisor":
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
        require => Class["supervisor::package"]
    }
}

