# MariaDB packages for a client-only install.
# **Do not add it** if you do a full installation
# (packages.pp or packages_wmf.pp)

class mariadb::packages_client {

    package { [
        'wmf-mariadb101-client', # mariadb client, custom wmf package
        'percona-toolkit',       # very useful client utilities
        'grc',                   # used to colorize paged sql output
        'python3-pymysql',       # dependency for some utilities- TODO: delete & add as dependency
        'python3-tabulate',      # dependency for some utilities- TODO: delete & add as dependency
    ]:
        ensure => present,
    }

    # Do not try to install xtrabackup on stretch, it has been removed.
    # Maybe mariabackup is enough?
    if (os_version('debian < stretch || ubuntu >= trusty')) {
        package { 'percona-xtrabackup':
            ensure => present,
        }
    }

    if os_version('debian < stretch') {
        package { [
            'colordiff',             # useful to colorize diff output, use diff --color in strech
        ]:
            ensure => present,
        }
    }

}
