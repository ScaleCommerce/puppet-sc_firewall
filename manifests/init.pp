class sc_firewall(
  $purgeall = true,
) {

  resources { 'firewall':
    purge => $purgeall,
  }
  class {'sc_firewall::pre':
  }->
  class {'sc_firewall::host_ext_services':
  }->
  class {'sc_firewall::host_trusted_services':
  }->
  class {'sc_firewall::post':
  }

}
