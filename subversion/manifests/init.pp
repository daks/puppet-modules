# modules/subversion/manifests/init.pp

class subversion {
    package { "subversion":
        ensure => installed,
    }
}
