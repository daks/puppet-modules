
define nginx::site::redirect($server_name='',
                             $server_aliases=[],
                             $port='80',
                             $rewrite_pattern='',
                             $default_vhost=false,
                             $permanent=true,
                             $enabled=true) {

    include nginx::package

    $define_port = $default_vhost ?{
        true    => "${port} default",
        default => "${port}",
    }
    $define_permanent = $permanent ?{
        false   => "",
        default => "permanent",
    }
    $src_filename = "/etc/nginx/sites-available/${name}"
    $dst_filename = "/etc/nginx/sites-enabled/${name}"

    file { "${src_filename}":
        content => template("nginx/redirect.erb")
    }

    $ensure = $enabled ? {
        true     => "link",
        default  => "absent",
    }

    file { "${dst_filename}":
        ensure => "${ensure}",
        target => "${src_filename}",
    }
}
