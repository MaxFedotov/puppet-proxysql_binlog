# @summary 
#   Private class for managing proxysql-binlog config.
#
# @api private
#
class proxysql_binlog::config {
  $config = $proxysql_binlog::config
  $log_dir = dirname($config['general']['log_file'])

  file { '/etc/proxysql-binlog.cnf':
    ensure  => file,
    content => proxysql_binlog_config($config),
    owner   => $proxysql_binlog::user,
    group   => $proxysql_binlog::group,
    mode    => '0664',
  }

  file { $log_dir:
    ensure => directory,
    owner  => $proxysql_binlog::user,
    group  => $proxysql_binlog::group,
    mode   => '2644'
  }

  if $proxysql_binlog::enable_logrotate {
    logrotate::rule { 'proxysql-binlog-logrotate':
      path         => [ "${log_dir}/*.log" ],
      missingok    => true,
      copytruncate => true,
      su           => true,
      su_user      => $proxysql_binlog::user,
      su_group     => $proxysql_binlog::group,
      rotate       => 5,
      rotate_every => 'daily',
      compress     => false,
      require      => File[$log_dir],
    }
  }
}
