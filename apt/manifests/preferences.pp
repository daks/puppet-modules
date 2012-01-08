
class apt::preferences($ensure=present,$source=undef) {
    file { '/etc/apt/preferences':
        ensure  => $ensure,
        source  => $source ? {
            undef   => undef,
            true    => [
                        "puppet:///files/${fqdn}/etc/apt/preferences",
                        "puppet:///files/${hostgroup}/etc/apt/preferences",
                        "puppet:///files/${domain}/etc/apt/preferences",
                        "puppet:///files/global/etc/apt/preferences",
            ],
            default => "${source}",
        },
        notify  => Class['apt::update'],
        require => Class['apt'],
    }
}
