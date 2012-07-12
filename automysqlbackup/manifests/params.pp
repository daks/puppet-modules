# Class: automysqlbackup::params
#
# Defines automysqlbackup parameters
#
class automysqlbackup::params {
    $package = $operatingsystem ? {
        debian  => "automysqlbackup",
        ubuntu  => "automysqlbackup",
        default => undef,
    }

    $conffile = $operatingsystem ? {
        debian  => "/etc/default/automysqlbackup",
        ubuntu  => "/etc/default/automysqlbackup",
        default => undef,
    }
}
