# modules/screen/manifest/init.pp

class screen {
    package { "screen":
        ensure => installed
    }
}

