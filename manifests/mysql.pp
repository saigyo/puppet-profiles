class profiles::mysql {
  class { '::mysql::server':
    # TODO factor out password to param
    root_password    => 'pw',
    override_options => { 
      'mysqld' => { 
        'max_connections' => '1024' 
      } 
    },
    databases => {
    # TODO factor out into separate profile and/or param
      'mutti' => {
        ensure  => 'present',
        charset => 'utf8',
      },
    }
  }

  include mysql::server::account_security
}
