class multiclass_http::package inherits multiclass_http{
  package{"$multiclass_http::package":
    ensure =>present,
  }
}
