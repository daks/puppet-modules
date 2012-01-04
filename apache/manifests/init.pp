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
class apache {
    require apache::params

    package { "apache":
        name    => "${apache::params::package}",
        ensure  => present,
    }

    service { "apache":
        name    => "${apache::params::service}",
        ensure  => running,
        enable  => true,
        require => Package["apache"],
    }
}

