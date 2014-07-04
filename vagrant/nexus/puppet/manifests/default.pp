class{ '::java':
  distribution => 'jdk',
}

class{ '::nexus':
  version        => '2.8.0',
  nexus_user     => 'nexus',
  nexus_group    => 'nexus',
  nexus_root     => '/srv',
}

Class['::java'] -> Class['::nexus']

exec { "apt-update":
  command => "/usr/bin/apt-get update",
}

Exec["apt-update"] -> Package <| |>
