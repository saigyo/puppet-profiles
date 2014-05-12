class profiles::nodejs {
  class { 'nodejs':
    version => 'stable',
  }

  file { '/usr/local/bin/node':
    ensure => link,
    target => '/usr/local/node/node-default/bin/node'
  }

  file { '/usr/local/bin/npm':
    ensure => link,
    target => '/usr/local/node/node-default/bin/npm'
  }
}
