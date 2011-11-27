

class rsyslog::conf::udp_listening(udp_port='514') {
    file { "/etc/rsyslog.d/udp_listening.conf":
        content => template("${module_name}/udp_listening.conf.erb"),
        notify  => Class["rsyslog::service"],
    }
}
