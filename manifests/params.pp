# Class: composer::params
# 
# This class manages the composer parameters.
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
class composer::params {
  $command_name = 'composer'
  $location     = 'http://getcomposer.org/composer.phar'
  $target_dir   = '/usr/bin' 
}