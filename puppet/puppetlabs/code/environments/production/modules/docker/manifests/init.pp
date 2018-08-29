class docker {
  $pacotes = [ "apt-transport-https", "ca-certificates", "curl", "software-properties-common", "docker-ce" ]
  $codename = $facts['os']['distro']['codename']

  exec{'add gpg key':
    command => "/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add -"
  }

  exec{'add apt repository':
    command => "/usr/bin/add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $codename stable\""
  }

  exec{'update repository':
    command => '/usr/bin/apt-get update'
  }

  package{$pacotes:
    ensure => present,
    require => Exec['update repository']
  }
}

