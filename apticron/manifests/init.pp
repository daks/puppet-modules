# modules/apticron/manifests/init.pp

class apticron {
    include apticron::package
}

class apticron::package {
    package { "apticron":
        ensure => installed,
    }
}

class apticron::package::absent {
    package { "apticron":
        ensure => purged,
    }
}


