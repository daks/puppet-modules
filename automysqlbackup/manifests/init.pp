# Class: automysqlbackup
#
# This module manages mysql backups with automysqlbackup script
#
# Parameters:
#   mysql_user (optional): username used to connect to MySQL server
#   mysql_password (optional): password
#   mysql_host (optional, default: localhost): MySQL server
#   backup_dir (optional, default: /var/lib/automysqlbackup): directory where
#       backups are stored
#   email (optional, default: root): e-mail address to send backup report
#
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class automysqlbackup {
    require automysqlbackup::params

    package { "automysqlbackup":
        name    => "${automysqlbackup::params::package}",
        ensure  => present,
    }
    
    $username = $mysql_user ? {
        undef   => '',
        default => "${mysql_user}",
    }
    $password = $mysql_password ? {
        undef   => '',
        default => "${mysql_password}",
    }
    $host = $mysql_host ? {
        undef   => '',
        default => "${mysql_host}",
    }
    $directory = $backup_dir ? {
        undef   => '',
        default => "${backup_dir}",
    }
    $mail_addr = $email ? {
        undef   => '',
        default => "${email}",
    }
     
    file { "${automysqlbackup::params::conffile}":
       content  => template("${module_name}/automysqlbackup.erb")
    }
}

