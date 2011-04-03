# modules/sudo/manifest/init.pp

class sudo {
    package { "sudo":
        ensure => installed,
    }

    file { "/etc/sudoers":
        owner => root, 
        group => root, 
        mode => 440,
        require => Package["sudo"]
    }
}


