
class snmp::server {
    require snmp::params

    package { "${snmp::params::srv_pkg}":
        ensure  => installed,
    }

    file { "${snmp::params::directory}":
        ensure  => present,
    }
    file { "${snmp::params::default_conffile}":
        ensure  => file,
        source  => [
                    "puppet:///files/${fqdn}/etc/default/snmpd",
                    "puppet:///files/${hostgroup}/etc/default/snmpd",
                    "puppet:///files/${domain}/etc/default/snmpd",
                    "puppet:///files/global/etc/default/snmpd",
                    "puppet:///modules/${module_name}/default_snmpd",
                   ],
        notify  => Service["${snmp::params::srv_name}"],
    }
 
    file { "${snmp::params::srv_conffile}":
        ensure  => file,
        source  => [
                    "puppet:///files/${fqdn}/etc/snmp/snmpd.conf",
                    "puppet:///files/${hostgroup}/etc/snmp/snmpd.conf",
                    "puppet:///files/${domain}/etc/snmp/snmpd.conf",
                    "puppet:///files/global/etc/snmp/snmpd.conf",
                   ],
        notify  => Service["${snmp::params::srv_name}"],
    }
    
    service { "${snmp::params::srv_name}":
        ensure  => running,
    }
}
