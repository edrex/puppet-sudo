# grant root privs to admin group
# change template to make more restrictive

class sudo::admin {
    include sudo::managed

    common::concatfilepart { "sudoers.admin":
        ensure => present,
        file => "/etc/sudoers",
        content => template("sudo/sudoers.admin.erb"),
        require => Group["admin"],
    }

    group { "admin":
	ensure => present,
    }
}

