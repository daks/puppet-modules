
class grub {
    include grub::update
}

class grub::update {
    exec { "/usr/sbin/update-grub":
        refreshonly => true,
   }
}
