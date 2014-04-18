class profiles::elasticsearch {
  apt::source { 'elasticsearch':
    location          => 'http://packages.elasticsearch.org/elasticsearch/1.1/debian',
    release           => 'stable',
    repos             => 'main',
    key               => 'D27D666CD88E42B4',
    include_src       => false
  }

  class { '::elasticsearch':
    version           => '1.1.0',
    ensure            => 'present',
    status            => 'enabled',

    config                   => {
      'node'                 => {
        'name'               => 'elasticsearch001'
      },
      'index'                => {
        'number_of_replicas' => '0',
        'number_of_shards'   => '5'
      },
      'network'              => {
      #  'host'               => $::ipaddress
        'host'               => '0.0.0.0'
      }
    }
  }

  elasticsearch::plugin{'mobz/elasticsearch-head':
    module_dir => 'head'
  }

  elasticsearch::plugin{'elasticsearch/elasticsearch-analysis-icu/2.0.0':
    module_dir => 'analysis-icu'
  }

  elasticsearch::plugin{'elasticsearch/marvel/latest':
    module_dir => 'marvel'
  }
}
