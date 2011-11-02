
class rsyslog::conf::udp_redirect($redirect_server,
                              $redirect_port='514') {
    file { "/etc/rsyslog.d/udp_redirect.conf":
        content => template("${module_name}/udp_redirect.conf.erb"),
        notify  => Class["rsyslog::service"],
    }
}
