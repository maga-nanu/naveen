# Class: httpmod
# ===========================
#
# Full description of class httpmod here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'httpmod':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class httpmod {
  $pkg = 'httpd'
  $service = 'httpd'
  $files = ['/var/www/html/pragathi.com', '/var/log/httpd/pragathi.com']

 package{ $pkg:
  ensure  => present,
 }

 file{ $files:
   ensure => directory,
   owner => root,
   group => root,
 }

 file{ '/var/www/html/pragathi.com/index.html':
   ensure => present,
   content => "This is for testing",
 }

 file{ '/etc/httpd/conf.d/vhost.conf':
  ensure => present,
  owner => root,
  group => root,
  source => 'puppet:///modules/httpmod/vhost.conf',
  notify => Service[$service]
 }

 service{ $service:
  ensure => running,
 }

}
