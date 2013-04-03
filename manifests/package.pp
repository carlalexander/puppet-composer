# Class: composer::package
#
# This module manages the composer package installation.
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class composer::package {
  Exec {
    path => '/bin:/sbin:/usr/bin:/usr/sbin',
  }
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  exec { 'composer-install':
    command => "wget -O ${composer::params::command_name} ${composer::params::location}",
    cwd     => $composer::params::target_dir,
    unless  => "test -f ${composer::params::target_dir}/${composer::params::command_name}",
  }

  exec { 'composer-permissions':
    command => "chmod a+x ${composer::params::command_name}",
    cwd     => $composer::params::target_dir,
    unless  => "test -x ${composer::params::target_dir}/${composer::params::command_name}",
    require => Exec['composer-install'],
  }

  exec { 'composer-update':
    command => "${composer::params::command_name} self-update",
    require => Exec['composer-permissions'],
  }
}