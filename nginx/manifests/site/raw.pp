
define nginx::site::raw($source='',
                        $enabled=true) {

    include nginx::package

    $src_filename = "/etc/nginx/sites-available/${name}"
    $dst_filename = "/etc/nginx/sites-enabled/${name}"

    file { "${src_filename}":
        ensure  => present,
        source  => $source ? {
            undef   => undef,
            true    => [
                        "puppet:///files/${fqdn}/etc/nginx/sites-available/${name}",
                        "puppet:///files/${hostgroup}/etc/nginx/sites-available/${name}",
                        "puppet:///files/${domain}/etc/nginx/sites-available/${name}",
                        "puppet:///files/global/etc/nginx/sites-available/${name}",
            ],
            default => "${source}",
        },
    }

    file { "${dst_filename}":
        ensure          => $enabled ? {
            true        => link,
            default     => absent,
        },
        target          => "${src_filename}",
        subscribe       => File["${src_filename}"],
        notify          => Class['nginx::service'],
    }
}
