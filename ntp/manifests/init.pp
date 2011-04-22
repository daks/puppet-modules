# modules/ntp/manifests/init.pp

class ntp {
    include ntp::package
    include ntp::service
}

class ntp::package {
    package { "ntp":
        ensure => installed,
    }
}

class ntp::service {
    service { "ntp":
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Class['ntp::package'],
        subscribe  => File["/etc/ntp.conf"],
    }

   file { "/etc/ntp.conf":
        ensure  => present,
        content => template("ntp/ntp.conf.erb"), 
    }
}
