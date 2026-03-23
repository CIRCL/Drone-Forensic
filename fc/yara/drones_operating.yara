rule INAV_FC {
    strings:
        $s = "INAV VERSION:"
    condition:
        $s
}
rule BETAFLIGHT_FC {
  strings:
    $s = "BETAFLT Onboard Flash"
  condition:
    $s
}
