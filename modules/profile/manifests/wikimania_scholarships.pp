# = Class: profile::wikimania_scholarships
#
# This class sets up the Wikimania Scholarships application
#
class profile::wikimania_scholarships {

    class { '::wikimania_scholarships':
        hostname     => 'scholarships.wikimedia.org',
        deploy_dir   => '/srv/deployment/scholarships/scholarships',
        cache_dir    => '/var/cache/scholarships',
        udp2log_dest => 'mwlog1001.eqiad.wmnet:8420',
        serveradmin  => 'noc@wikimedia.org',
        # Misc MySQL shard
        mysql_host   => 'm2-master.eqiad.wmnet',
        mysql_db     => 'scholarships',
        smtp_host    => $::mail_smarthost[0],
    }

    ferm::service { 'scholarships_http':
        proto  => 'tcp',
        port   => '80',
        srange => '$CACHES',
    }

}
# vim:sw=4 ts=4 sts=4 et:
