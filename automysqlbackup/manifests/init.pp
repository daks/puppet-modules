# Class: automysqlbackup
#
# This module manages mysql backups with automysqlbackup script
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class automysqlbackup {
    require automysqlbackup::params

    package { "automysqlbackup":
        name    => "${automysqlbackup::params::package}",
        ensure  => present,
    }
}

