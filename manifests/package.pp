# Class: autofs::package
#
# The autofs::package class installs the autofs package.
#
# @see https://dhollinger.github.io/autofs-puppet home
# @see autofs
# @see https://www.github.com/dhollinger/autofs-puppet Project Page
# @see https://forge.puppet.com/dhollinger/autofs Forge Page
#
# @author David Hollinger III <david.hollinger@moduletux.com>
#
# This class will determine if the OS running is a supported Linux distribution
# and install the appropriate package. It will prevent failures on a system
# that is running Solaris, but will not install anything as it should be installed
# by default.
#
# If the code doesn't find a matching supported OS, then the Puppet run will fail
# with a "OS not supported" message.
#
class autofs::package {
  Package {
    ensure => installed
  }
  case $::osfamily {
    'Debian', 'Ubuntu': {
      package { 'autofs': }
    }
    'RedHat', 'CentOS': {
      package { 'autofs': }
    }
    'Solaris': {
      # Solaris includes autofs
      # Block to prevent failures
    }
    default: {
      fail("${::operatingsystem} not supported.")
    }
  }
}
