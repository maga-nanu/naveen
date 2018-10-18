class httpinst {
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
  source => '/var/tmp/vhost.conf',
  notify => Service[$service]
 }

 service{ $service:
  ensure => running,
 }
}
include httpinst
