# modules/mercurial/manifests/init.pp

class mercurial {
    package { "mercurial":
        ensure => installed,
    }
}
