
define apt::source($uri, $dist=$lsbdistcodename, $components='main', $src=false) {
    
    file { "/etc/apt/sources.list.d/${name}.list":
        content => template("apt/sources.list.erb"),
        notify  => Class["apt::update"],
    }

}
