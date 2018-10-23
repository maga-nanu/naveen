class multiclass_http::config inherits multiclass_http{
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
 }
}
