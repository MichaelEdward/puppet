class profile::openstack::base::nova::common::neutron(
    $version = hiera('profile::openstack::base::version'),
    $db_user = hiera('profile::openstack::base::nova::db_user'),
    $db_pass = hiera('profile::openstack::base::nova::db_pass'),
    $db_host = hiera('profile::openstack::base::nova::db_host'),
    $db_name = hiera('profile::openstack::base::nova::db_name'),
    $nova_controller = hiera('profile::openstack::base::nova_controller'),
    $keystone_host = hiera('profile::openstack::base::keystone_host'),
    $glance_host = hiera('profile::openstack::base::glance_host'),
    $scheduler_pool = hiera('profile::openstack::base::nova::scheduler_pool'),
    $ldap_user_pass = hiera('profile::openstack::base::ldap_user_pass'),
    $rabbit_user = hiera('profile::openstack::base::nova::rabbit_user'),
    $rabbit_pass = hiera('profile::openstack::base::rabbit_pass'),
    $metadata_proxy_shared_secret = hiera('profile::openstack::base::neutron::metadata_proxy_shared_secret'),
    ) {

    class {'::openstack::nova::common::neutron':
        version                      => $version,
        db_user                      => $db_user,
        db_pass                      => $db_pass,
        db_host                      => $db_host,
        db_name                      => $db_name,
        nova_controller              => $nova_controller,
        keystone_host                => $keystone_host,
        scheduler_pool               => $scheduler_pool,
        ldap_user_pass               => $ldap_user_pass,
        rabbit_user                  => $rabbit_user,
        rabbit_host                  => $nova_controller,
        rabbit_pass                  => $rabbit_pass,
        glance_host                  => $glance_host,
        metadata_proxy_shared_secret => $metadata_proxy_shared_secret,
    }
    contain '::openstack::nova::common::neutron'
}
