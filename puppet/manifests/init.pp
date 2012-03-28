
class puppet {
    include puppet::agent
}

class puppet::agent {
    include puppet::package
    include puppet::service
}

class puppet::package {
    package { "puppet":
        ensure => installed,
    }

    file { "/etc/puppet":
        ensure => "directory",
    }
}

class puppet::service {
    file { "/etc/default/puppet":
        ensure => "present",
        source => "puppet:///modules/${module_name}/default_puppet",
    }

    file { "/etc/puppet/puppet.conf":
        ensure => "present",
        content => template("${module_name}/puppet.conf.erb"),
    }

    service { "puppet":
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
        require => [ Class["puppet::package"], File["/etc/default/puppet"], File["/etc/puppet/puppet.conf"], ],
    }
}

