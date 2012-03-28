# modules/ocsinventory/manifests/init.pp

class ocsinventory {
    include ocsinventory::agent
}

class ocsinventory::agent {
    package { "ocsinventory-agent":
        ensure => installed,
    }

    
    $tag = $ocs_tag ? {
        undef   => '',
        default => "$ocs_tag",
    }
    file { "/etc/ocsinventory/ocsinventory-agent.cfg":
        ensure  => present,
        content => template("ocsinventory/ocsinventory-agent.cfg.erb"),
        backup  => false,
        require => Package["ocsinventory-agent"],
    }
}

