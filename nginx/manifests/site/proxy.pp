
define nginx::site::proxy($nginx_servername='',
                          $nginx_serveraliases=[],
                          $nginx_port='80',
                          $nginx_upstream='',
                          $nginx_rootdir='',
                          $default_vhost=false,
                          $enabled=true) {

    include nginx::package

    $define_servername = $default_vhost ?{
        true    => "$nginx_servername default",
        default => $nginx_servername,
    }
    $src_filename = "/etc/nginx/sites-available/${name}"
    $dst_filename = "/etc/nginx/sites-enabled/${name}"

    file { "${src_filename}":
        content => template("nginx/proxy.erb")
    }

    if $enabled {
        exec { "ln -s ${src_filename} ${dst_filename}":
            subscribe => File["${src_filename}"],
            refreshonly => true,
        }
    }
    else {
        exec { "rm -f ${dst_filename}":
            subscribe => file["${src_filename}"],
        }
    }
}
