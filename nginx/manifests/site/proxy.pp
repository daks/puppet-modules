
define nginx::site::proxy($server_name='',
                          $server_aliases=[],
                          $port='80',
                          $upstream='',
                          $root_dir='',
                          $media_url='',
                          $media_dir='',
                          $default_vhost=false,
                          $enabled=true) {

    include nginx::package

    $define_servername = $default_vhost ?{
        true    => "$server_name default",
        default => $server_name,
    }
    $src_filename = "/etc/nginx/sites-available/${name}"
    $dst_filename = "/etc/nginx/sites-enabled/${name}"

    file { "${src_filename}":
        content => template("nginx/proxy.erb")
    }

    $ensure = $enabled ? {
        true    => "link",
        default => "absent",
    }

    file { $dst_filename:
        ensure => $ensure,
        target => $src_filename,
    }
}
