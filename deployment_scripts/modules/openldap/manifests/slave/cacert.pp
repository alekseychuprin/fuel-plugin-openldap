class openldap::slave::cacert (
  $cacert,
){
  notice('MODULAR: openldap/slave/cacert.pp')
  file {'/etc/ldap/ssl':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode   => 0755,
  } ->
  file {'/etc/ldap/ssl/cacert.pem':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode   => 0644,
    content => template("openldap/cacert.pem.tmpl.erb")
  } ->
  file {'/usr/local/share/ca-certificates/cacert.crt':
    ensure => file,
    mode   => 0644,
    content => template("openldap/cacert.pem.tmpl.erb")
  } ~>
  exec { '/usr/sbin/update-ca-certificates': }
}
