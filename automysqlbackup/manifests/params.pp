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
}
