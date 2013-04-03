# Class: composer
#
# This module manages Composer dependency manager.
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# * php
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include composer
# }
class composer inherits composer::params {
  class { 'composer::package': }
}