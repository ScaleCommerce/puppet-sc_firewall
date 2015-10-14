class sc_firewall::host_ext_services(
  $host_ext_services = [],
) {

  each($host_ext_services) |$rule| {

      $rule_parts = split($rule, ',')
      firewall { "100 INPUT ${rule_parts[0]} ${rule_parts[1]} ${rule_parts[2]} accept":
        chain  => 'INPUT',
        destination => $rule_parts[0] ,
        dport   => $rule_parts[2],
        proto  => $rule_parts[1],
        action => accept,
      }
  }

}
