# Class: apache::params
#
# Defines apache parameters
#
class apache::params {
    $package = $operatingsystem ? {
        debian  => "apache2",
        ubuntu  => "apache2",
        default => undef,
    }
    $service = $operatingsystem ? {
        debian  => "apache2",
        ubuntu  => "apache2",
        default => undef,
    }
}
