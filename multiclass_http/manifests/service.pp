class multiclass_http::service inherits multiclass_http{
 service{"$multiclass_http::service":
   ensure => running,
 }
}
