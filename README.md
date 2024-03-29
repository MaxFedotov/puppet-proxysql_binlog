# puppet-proxysql_binlog

#### Table of Contents

- [puppet-proxysql_binlog](#puppet-proxysqlbinlog)
      - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [Setup Requirements](#setup-requirements)
    - [Beginning with proxysql_binlog](#beginning-with-proxysqlbinlog)
- [Reference](#reference)
  - [Table of Contents](#table-of-contents-1)
  - [Classes](#classes)
    - [proxysql_binlog](#proxysqlbinlog)
      - [Examples](#examples)
        - [Install proxysql-binlog.](#install-proxysql-binlog)
      - [Parameters](#parameters)
        - [`package_name`](#packagename)
        - [`version`](#version)
        - [`manage_service`](#manageservice)
        - [`user`](#user)
        - [`group`](#group)
        - [`package_install_options`](#packageinstalloptions)
        - [`override_config`](#overrideconfig)
        - [`enable_logrotate`](#enablelogrotate)
  - [Functions](#functions)
    - [proxysql_binlog_config](#proxysqlbinlogconfig)
      - [`proxysql_binlog_config(Hash $Settings)`](#proxysqlbinlogconfighash-settings)
  - [Limitations](#limitations)
  - [Development](#development)

## Description

The proxysql_binlog module installs, configures and manages the [proxysql-binlog](https://github.com/MaxFedotov/go-proxysql-binlog) service.

## Setup

### Setup Requirements

This module requires toml gem, which is used to translate Hash configuration to proxysql-binlog toml format configuration files.
To install it you need to execute following command on your puppetmaster server:

```bash
sudo puppetserver gem install toml
```

### Beginning with proxysql_binlog

To install a proxysql-binlog with the default options:

`include 'proxysql_binlog'`

To customize proxysql-binlog configuration, you must also pass in an override hash:

```puppet
class { 'proxysql_binlog':
  user            => 'myawesomeuser',
  override_config => {
    'mysql' => {
      'user'     => 'myslaveuser',
      'password' => 'myslavepassword'
    }
  }
}
```

# Reference

## Table of Contents

**Classes**

_Public Classes_

* [`proxysql_binlog`](#proxysql_binlog): Installs and configures proxysql-binlog.

_Private Classes_

* `proxysql_binlog::config`: Private class for managing proxysql-binlog config.
* `proxysql_binlog::install`: Private class for installing proxysql-binlog.
* `proxysql_binlog::params`: Private class for setting default proxysql-binlog parameters.
* `proxysql_binlog::service`: Private class for managing proxysql-binlog service.

**Functions**

* [`proxysql_binlog_config`](#proxysql_binlog_config): Convert hash to proxysql-binlog TOML config.

## Classes

### proxysql_binlog

Installs and configures proxysql-binlog.

#### Examples

##### Install proxysql-binlog.

```puppet
class { 'proxysql-binlog':
  override_config  => {
    general => {
      listen_address => '127.0.0.1:3008',
    }
  }
}
```

#### Parameters

The following parameters are available in the `proxysql_binlog` class.

##### `package_name`

Data type: `String`

Package containing proxysql-binlog. Defaults to 'proxysql-binlog'.

Default value: $proxysql_binlog::params::package_name

##### `version`

Data type: `String`

Version of proxysql-binlog. Defaults to 'latest'.

Default value: $proxysql_binlog::params::version

##### `manage_service`

Data type: `Boolean`

Specifies whether proxysql-binlog service should be managed. Defaults to 'true'.

Default value: $proxysql_binlog::params::manage_service

##### `user`

Data type: `String`

User for proxysql-binlog. Defaults to 'proxysql_binlog'.

Default value: $proxysql_binlog::params::user

##### `group`

Data type: `String`

User for proxysql-binlog. Defaults to 'proxysql_binlog'.

Default value: $proxysql_binlog::params::group

##### `package_install_options`

Data type: `Array[String]`

Array of install options for managed package resources. Appropriate options are passed to package manager.

Default value: $proxysql_binlog::params::package_install_options

##### `override_config`

Data type: `Hash`

Hash of override configuration options for proxysql-binlog

Default value: {}

##### `enable_logrotate`

Data type: `Boolean`



Default value: $proxysql_binlog::params::enable_logrotate

## Functions

### proxysql_binlog_config

Type: Ruby 3.x API

Convert hash to proxysql-binlog TOML config.

#### `proxysql_binlog_config(Hash $Settings)`

The proxysql_binlog_config function.

Returns: `Toml` proxysql-binlog configuration content.

## Limitations

For a list of supported operating systems, see [metadata.json](https://github.com/MaxFedotov/puppet-proxysql_binlog/blob/master/metadata.json)

## Development

Please feel free to fork, modify, create issues, bug reports and pull requests.