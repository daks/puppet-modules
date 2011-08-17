# modules/znc/manifests/init.pp

class znc {
    include znc::package
    include znc::user
    include znc::service
}

class znc::package {
    package { ["znc", "znc-extra"]:
        ensure => installed,
    }
}

class znc::user {
    group { "znc":
        ensure => present,
    }
    user { "znc":
        ensure  => present,
        comment => "For znc service",
        shell   => "/bin/false",
        home    => "/home/znc",
        gid     => "znc",
        require => Group["znc"],
    }
}

class znc::service {
    include znc::service::supervisor
}

class znc::service::supervisor {
    supervisor::process { "znc":
        command => "/usr/bin/znc -f -d /home/znc/.znc/",
        user => "znc",
    }
}

