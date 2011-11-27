# modules/supervisor/manifests/conf.pp

define supervisor::process($command,
                           $autostart='true',
                           $autorestart='true',
                           $startsecs='1',
                           $user,
                           $redirect_stderr='false',
                           $stdout_logfile='AUTO',
                           $stderr_logfile='AUTO',
                           $directory='') {

    $conf_dir = "/etc/supervisor/conf.d"
    $conf_file = "$conf_dir/$name.conf"
    file { $conf_file:
        content => template("supervisor/process.erb"),
        notify  => Class["supervisor::reload"],
    }
}
