
class snmp::server {
    require snmp::params

    package { "${snmp::params::srv_pkg}":
        ensure  => installed,
    }

    file { "${snmp::params::directory}":
        ensure  => present,
    }
    file { "${snmp::params::srv_conffile}":
        ensure  => file,
        source  => [
                    "puppet:///files/${fqdn}/etc/snmp/snmpd.conf",
                    "puppet:///files/${hostgroup}/etc/snmp/snmpd.conf",
                    "puppet:///files/${domain}/etc/snmp/snmpd.conf",
                    "puppet:///files/global/etc/snmp/snmpd.conf",
                   ],
    }
    
    service { "${snmp::params::srv_name}":
        ensure  => running,
    }
}
