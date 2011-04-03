
define nginx::site::redirect($nginx_servername='', $nginx_redirecturl='', $nginx_port='80', $default_vhost=false, $permanent=true) {
    include nginx::package
    $define_servername = $default_vhost ?{
        true    => "$nginx_servername default",
        default => $nginx_servername,
    }
    $define_permanent = $permanent ?{
        false   => "",
        default => "permanent",
    }
    file { "/etc/nginx/sites-available/${name}":
        content => template("nginx/redirect.erb")
    }
}
