
class rsyslog::conf::graylog2($graylog2_server,
                              $graylog2_port='514') {
    file { "/etc/rsyslog.d/graylog2.conf":
        content => template("${module_name}/graylog2.conf.erb"),
        notify  => Class["rsyslog::service"],
    }
    class { 'rsyslog::conf::udp_redirect': redirect_server => "$graylog2_server", redirect_port => "$graylog2_port"}

}

