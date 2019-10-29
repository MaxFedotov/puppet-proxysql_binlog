# @summary
#   Private class for setting default proxysql-binlog parameters.
#
# @api private
#
class proxysql_binlog::params {
  $package_name            = 'proxysql-binlog'
  $version                 = 'latest'
  $manage_service          = true
  $user                    = 'proxysql_binlog'
  $group                   = 'proxysql_binlog'
  $enable_logrotate        = true
  $package_install_options = []
  $default_config = {
    general => {
      listen_address => '0.0.0.0:3310',
      log_file       => '/var/log/proxysql-binlog/proxysql-binlog.log',
      log_level      => 'info'
    },
    mysql   => {
      host     => 'localhost',
      port     => 3306,
      user     => 'slave',
      password => 'slavepassword'
    },
    metrics => {
      listen_address => '0.0.0.0:9056',
      endpoint       => '/metrics'
    }
  }
}
