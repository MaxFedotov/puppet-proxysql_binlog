# @summary 
#   Private class for managing proxysql-binlog service.
#
# @api private
#
class proxysql_binlog::service {
  if $proxysql_binlog::manage_service {
    service { 'proxysql-binlog':
      ensure    => 'running',
      enable    => true,
      subscribe => File['/etc/proxysql-binlog.cnf'],
    }
  }
}
