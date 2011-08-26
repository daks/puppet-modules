# modules/mysql/manifest/init.pp

class mysql {
    include mysql::server
    include mysql::client
}

class mysql::client {
    package { "libmysqlclient16":
        ensure => installed
    }
}

class mysql::library {
    package { "libmysqlclient-dev":
        ensure => installed
    }
}

class mysql::server {
    include mysql::server::package
    include mysql::server::service
}

class mysql::server::package {
    package { "mysql-server":
        ensure => installed
    }
}

class mysql::server::service {
    service { "mysql":
        enable => true,
        ensure => running,
        require => Class["mysql::server::package"]
    }
}

