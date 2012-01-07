
define apt::source($ensure=present, $uri, $dist=$lsbdistcodename, $components='main', $src=false) {
    
    file { "/etc/apt/sources.list.d/${name}.list":
        ensure  => $ensure,
        content => template("apt/sources.list.erb"),
        notify  => Class["apt::update"],
    }

}
