class sc_firewall::host_trusted_services(
) {

  $host_trusted_services = hiera_array('sc_firewall::host_trusted_services',[])

  each($host_trusted_services) |$rule| {

      $rule_parts = split($rule, ',')
      firewall { "100 INPUT ${rule_parts[0]} ${rule_parts[1]} ${rule_parts[2]} accept":
        chain  => 'INPUT',
        source => $rule_parts[0] ,
        dport   => $rule_parts[2],
        proto  => $rule_parts[1],
        action => accept,
      }

  }

}
