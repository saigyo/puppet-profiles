class profiles::mongodb {
   class {'::mongodb::server':
     ensure => true,
     smallfiles => true
   }
}
