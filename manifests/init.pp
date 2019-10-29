# @summary
#   Installs and configures proxysql-binlog.
#
# @example Install proxysql-binlog.
#   class { 'proxysql-binlog':
#     override_config  => {
#       general => {
#         listen_address => '127.0.0.1:3008',
#       }
#     }
#   }
#
# @param package_name
#   Package containing proxysql-binlog. Defaults to 'proxysql-binlog'.
# @param version
#   Version of proxysql-binlog. Defaults to 'latest'.
# @param manage_service
#   Specifies whether proxysql-binlog service should be managed. Defaults to 'true'.
# @param user
#   User for proxysql-binlog. Defaults to 'proxysql_binlog'.
# @param group
#   User for proxysql-binlog. Defaults to 'proxysql_binlog'.
# @param package_install_options
#   Array of install options for managed package resources. Appropriate options are passed to package manager.
# @param override_config
#   Hash of override configuration options for proxysql-binlog
#   
class proxysql_binlog(
  String $package_name                   = $proxysql_binlog::params::package_name,
  String $version                        = $proxysql_binlog::params::version,
  Boolean $manage_service                = $proxysql_binlog::params::manage_service,
  String $user                           = $proxysql_binlog::params::user,
  String $group                          = $proxysql_binlog::params::group,
  Boolean $enable_logrotate              = $proxysql_binlog::params::enable_logrotate,
  Array[String] $package_install_options = $proxysql_binlog::params::package_install_options,
  Hash $override_config                  = {}

) inherits proxysql_binlog::params {

  $config = deep_merge($proxysql_binlog::params::default_config, $override_config)

  anchor { 'proxysql_binlog::begin': }
  -> class { 'proxysql_binlog::install': }
  -> class { 'proxysql_binlog::config': }
  -> class { 'proxysql_binlog::service': }
  -> anchor { 'proxysql_binlog::end': }
}
