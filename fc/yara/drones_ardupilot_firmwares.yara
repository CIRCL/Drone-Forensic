/*
 * Auto-generated from the local ArduPilot source tree.
 * Author: CIRCL https://www.circl.lu/
 * License: GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html
 */

rule ARDUPILOT_CHIPSET_CKS32F407 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "CKS32F407"
    strings:
        $s0 = "CKS32F407" ascii nocase
        $s1 = "CKS32F407xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_ESP32 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "ESP32"
    strings:
        $s0 = "CONFIG_IDF_TARGET=\"esp32\"" ascii nocase
        $s1 = "CONFIG_IDF_TARGET_ESP32" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_ESP32C3 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "ESP32C3"
    strings:
        $s0 = "CONFIG_IDF_TARGET=\"esp32c3\"" ascii nocase
        $s1 = "CONFIG_IDF_TARGET_ESP32C3" ascii nocase
        $s2 = "ESP32-C3" ascii nocase
        $s3 = "ESP32C3" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_ESP32S2 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "ESP32S2"
    strings:
        $s0 = "CONFIG_IDF_TARGET=\"esp32s2\"" ascii nocase
        $s1 = "CONFIG_IDF_TARGET_ESP32S2" ascii nocase
        $s2 = "ESP32-S2" ascii nocase
        $s3 = "ESP32S2" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_ESP32S3 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "ESP32S3"
    strings:
        $s0 = "CONFIG_IDF_TARGET=\"esp32s3\"" ascii nocase
        $s1 = "CONFIG_IDF_TARGET_ESP32S3" ascii nocase
        $s2 = "ESP32-S3" ascii nocase
        $s3 = "ESP32S3" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F100B {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F100B"
    strings:
        $s0 = "STM32F100B" ascii nocase
        $s1 = "STM32F100xB" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F103B {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F103B"
    strings:
        $s0 = "STM32F103B" ascii nocase
        $s1 = "STM32F103xB" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F105 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F105"
    strings:
        $s0 = "STM32F105" ascii nocase
        $s1 = "STM32F105xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F105C {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F105C"
    strings:
        $s0 = "STM32F105C" ascii nocase
        $s1 = "STM32F105xC" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F303 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F303"
    strings:
        $s0 = "STM32F303" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F303C {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F303C"
    strings:
        $s0 = "STM32F303C" ascii nocase
        $s1 = "STM32F303xC" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F405 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F405"
    strings:
        $s0 = "STM32F405" ascii nocase
        $s1 = "STM32F405xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F407 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F407"
    strings:
        $s0 = "STM32F407" ascii nocase
        $s1 = "STM32F407xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F412 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F412"
    strings:
        $s0 = "STM32F412" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F412R {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F412R"
    strings:
        $s0 = "STM32F412R" ascii nocase
        $s1 = "STM32F412Rx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F413 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F413"
    strings:
        $s0 = "STM32F413" ascii nocase
        $s1 = "STM32F413xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F427 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F427"
    strings:
        $s0 = "STM32F427" ascii nocase
        $s1 = "STM32F427xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F469 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F469"
    strings:
        $s0 = "STM32F469" ascii nocase
        $s1 = "STM32F469xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F732 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F732"
    strings:
        $s0 = "STM32F732" ascii nocase
        $s1 = "STM32F732xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F745 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F745"
    strings:
        $s0 = "STM32F745" ascii nocase
        $s1 = "STM32F745xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F765 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F765"
    strings:
        $s0 = "STM32F765" ascii nocase
        $s1 = "STM32F765xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F767 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F767"
    strings:
        $s0 = "STM32F767" ascii nocase
        $s1 = "STM32F767xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F769 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F769"
    strings:
        $s0 = "STM32F769" ascii nocase
        $s1 = "STM32F769xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32F777 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32F777"
    strings:
        $s0 = "STM32F777" ascii nocase
        $s1 = "STM32F777xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32G431 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32G431"
    strings:
        $s0 = "STM32G431" ascii nocase
        $s1 = "STM32G431xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32G441 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32G441"
    strings:
        $s0 = "STM32G441" ascii nocase
        $s1 = "STM32G441xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32G474 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32G474"
    strings:
        $s0 = "STM32G474" ascii nocase
        $s1 = "STM32G474xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32G491 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32G491"
    strings:
        $s0 = "STM32G491" ascii nocase
        $s1 = "STM32G491xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H723 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H723"
    strings:
        $s0 = "STM32H723" ascii nocase
        $s1 = "STM32H723xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H723VG {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H723VG"
    strings:
        $s0 = "STM32H723VG" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H730 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H730"
    strings:
        $s0 = "STM32H730" ascii nocase
        $s1 = "STM32H730xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H730IBT {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H730IBT"
    strings:
        $s0 = "STM32H730IBT" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H743 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H743"
    strings:
        $s0 = "STM32H743" ascii nocase
        $s1 = "STM32H743xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H750 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H750"
    strings:
        $s0 = "STM32H750" ascii nocase
        $s1 = "STM32H750xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H750B {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H750B"
    strings:
        $s0 = "STM32H750B" ascii nocase
        $s1 = "STM32H750XB" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H753 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H753"
    strings:
        $s0 = "STM32H753" ascii nocase
        $s1 = "STM32H753xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H753ZIT6 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H753ZIT6"
    strings:
        $s0 = "STM32H753ZIT6" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H755 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H755"
    strings:
        $s0 = "STM32H755" ascii nocase
        $s1 = "STM32H755xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H757 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H757"
    strings:
        $s0 = "STM32H757" ascii nocase
        $s1 = "STM32H757xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32H7A3 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32H7A3"
    strings:
        $s0 = "STM32H7A3" ascii nocase
        $s1 = "STM32H7A3xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32L431 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32L431"
    strings:
        $s0 = "STM32L431" ascii nocase
        $s1 = "STM32L431xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32L476 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32L476"
    strings:
        $s0 = "STM32L476" ascii nocase
        $s1 = "STM32L476xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32L476RG {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32L476RG"
    strings:
        $s0 = "STM32L476RG" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32L496 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32L496"
    strings:
        $s0 = "STM32L496" ascii nocase
        $s1 = "STM32L496xx" ascii nocase
    condition:
        any of them
}
rule ARDUPILOT_CHIPSET_STM32L4R5 {
    meta:
        detection_source = "ardupilot-chipset"
        chipset = "STM32L4R5"
    strings:
        $s0 = "STM32L4R5" ascii nocase
        $s1 = "STM32L4R5xx" ascii nocase
    condition:
        any of them
}
