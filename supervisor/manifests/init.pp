# modules/supervisor/manifests/init.pp

class supervisor {
    include supervisor::package
    include supervisor::service
    include supervisor::reload
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

class supervisor::reload {
    exec { "supervisorctl":
        command     => "/usr/bin/supervisorctl reload",
        refreshonly => "true",
    }
}
