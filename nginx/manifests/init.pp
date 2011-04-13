# modules/nginx/manifests/init.pp

class nginx {
    include nginx::package
    include nginx::service
}

class nginx::package {
    package { "nginx":
        ensure => installed,
    }
}

class nginx::service {
    service { "nginx":
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
        require => Class['nginx::package']
    }
}


