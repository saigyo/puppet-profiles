class profiles::git {
  package { 'git':
    ensure => installed
  }
}