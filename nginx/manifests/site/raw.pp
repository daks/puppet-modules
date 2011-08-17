
define nginx::site::raw($file_name='',
                        $enabled=true) {

    include nginx::package

    $src_filename = "/etc/nginx/sites-available/${name}"
    $dst_filename = "/etc/nginx/sites-enabled/${name}"

    file { "${src_filename}":
        ensure => present,
        source => "puppet:///files/nginx/${file_name}",
    }

    if $enabled {
        exec { "ln -s ${src_filename} ${dst_filename}":
            subscribe => File["${src_filename}"],
            refreshonly => true,
        }
    }
    else {
        exec { "rm -f ${dst_filename}":
            subscribe => File["${src_filename}"],
        }
    }
}
