# take over management of sudoers file and supply basic rules
# change to manage => false to allow local rules in sudoers.d (requires rerunning puppet)

class sudo::managed {
    include sudo::base

    common::concatfilepart { "00managed":
        ensure => present,
	manage => true,
        file => "/etc/sudoers",
        content => template("sudo/sudoers.managed.erb"),
        require => Group["admin"],
    }

    group { "sudo":
	ensure => present,
    }
}

