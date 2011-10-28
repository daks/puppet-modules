
class xen {
    include xen::package
    include xen::service
}

class xen::package {
    package { "xen-linux-system":
        ensure => installed,
    }
}

class xen::service { 
    service { ["xend", "xendomains"]:
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require    => Class["xen::package"],
    }
}

class xen::tools {
    package { "xen-tools":
        ensure => installed,
    }
}

