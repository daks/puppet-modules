
define nginx::site::purge() {
    include nginx::package

    $purge_dirs = [ "/etc/nginx/sites-available", "/etc/nginx/sites-enabled" ]
    file { $purge_dirs:
        ensure  => "directory",
        recurse => true,
        purge   => true,
        force   => true,
        owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet:///modules/nginx/empty-dir"
    }
}

