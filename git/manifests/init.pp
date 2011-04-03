# modules/git/manifests/init.pp

class git {
    package { "git":
        ensure => installed,
    }
}
