/*
 *   author = "CIRCL https://www.circl.lu/"
 *   license = "GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html"
 */
rule INAV_FC {
    meta:
        operating_system = "INAV"
    strings:

        $s = "INAV VERSION:"
    condition:
        $s
}
rule BETAFLIGHT_FC 
{
  meta:
     operating_system = "BETAFLIGHT"
  strings:
    $s = "BETAFLT Onboard Flash"
  condition:
    $s
}
rule ARDUPILOT_FC
{
  meta:
     operating_system = "ARDUPILOT"
  strings:
    $s = "Initialising ArduPilot"
  condition:
    $s
}

