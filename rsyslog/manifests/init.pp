
class rsyslog {
    include rsyslog::package
    include rsyslog::service
}

class rsyslog::package {
    package { "rsyslog":
        ensure => installed,
    }
}

class rsyslog::service {
    service { "rsyslog":
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
        require => Class['rsyslog::package']
    }
}


