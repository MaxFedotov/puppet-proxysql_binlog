# @summary 
#   Private class for installing proxysql-binlog.
#
# @api private
#
class proxysql_binlog::install {

  package { $proxysql_binlog::package_name:
    ensure          => $proxysql_binlog::version,
    install_options => $proxysql_binlog::package_install_options,
  }

}
