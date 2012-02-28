
define nginx::site::proxy($server_name='',
                          $server_aliases=[],
                          $port='80',
                          $upstreams={},
                          $root_dir='',
                          $standard_location_block='',
                          $location_blocks={},
                          $default_vhost=false,
                          $enabled=true) {

    include nginx::package

    $define_port = $default_vhost ?{
        true    => "${port} default",
        default => "${port}",
    }
    $src_filename = "/etc/nginx/sites-available/${name}"
    $dst_filename = "/etc/nginx/sites-enabled/${name}"

    file { "${src_filename}":
        content => template("nginx/proxy.erb")
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
