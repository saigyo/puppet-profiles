class profiles::mysql {
  class { '::mysql::server':
    root_password    => 'pw',
    override_options => { 
      'mysqld' => { 
        'max_connections' => '1024' 
      } 
    },
    databases => {
      'mutti' => {
        ensure  => 'present',
        charset => 'utf8',
      },
    }
  }

  include mysql::server::account_security
}
