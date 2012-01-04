# Class: apache
#
# This module manages apache
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class apache {
    require apache::params
    include apache::package
    include apache::service
}

class apache::package {
    require apache::params
    package { "apache":
        name    => "${apache::params::package}",
        ensure  => present,
    }
}

class apache::service {
    require apache::params
    service { "apache":
        name    => "${apache::params::service}",
        ensure  => running,
        enable  => true,
        require => Class["apache::package"],
    }
}

