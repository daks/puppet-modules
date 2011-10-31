
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

class xen::boot {
    include grub
    exec { "mv /etc/grub.d/10_linux /etc/grub.d/20_linux":
        onlyif => "test -e /etc/grub.d/10_linux",
        notify => Class["grub::update"]
    }
    exec { "mv /etc/grub.d/20_linux_xen /etc/grub.d/10_linux_xen":
        onlyif => "test -e /etc/grub.d/20_linux_xen",
        notify => Class["grub::update"]
    }
}

class xen::tools {
    package { "xen-tools":
        ensure => installed,
    }
}

