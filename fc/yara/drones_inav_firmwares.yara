/*
 * Auto-generated from the local INAV source tree.
 * Author: CIRCL https://www.circl.lu/
 * License: GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html
 */

rule AETH743Basic_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "AETH743Basic"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "AETH743Basic" ascii nocase
    condition:
        $target
}

rule AIKONF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "AIKONF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "AIKONF4" ascii nocase
    condition:
        $target
}

rule AIKONF4V3_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "AIKONF4V3"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "AIKONF4V3" ascii nocase
    condition:
        $target
}

rule AIKONF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "AIKONF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "AIKONF7" ascii nocase
    condition:
        $target
}

rule AIRBOTF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "AIRBOTF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "AIRBOTF4" ascii nocase
    condition:
        $target
}

rule AIRBOTF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "AIRBOTF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "AIRBOTF7" ascii nocase
    condition:
        $target
}

rule OMNIBUSF7NANOV7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF7NANOV7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "OMNIBUSF7NANOV7" ascii nocase
    condition:
        $target
}

rule ALIENFLIGHTF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "ALIENFLIGHTF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "ALIENFLIGHTF4" ascii nocase
    condition:
        $target
}

rule ALIENFLIGHTNGF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "ALIENFLIGHTNGF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "ALIENFLIGHTNGF7" ascii nocase
    condition:
        $target
}

rule ANYFC_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "ANYFC"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "ANYFC" ascii nocase
    condition:
        $target
}

rule ANYFCF7_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "ANYFCF7"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "ANYFCF7" ascii nocase
    condition:
        $target
}

rule ANYFCF7_EXTERNAL_BARO_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "ANYFCF7_EXTERNAL_BARO"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "ANYFCF7_EXTERNAL_BARO" ascii nocase
    condition:
        $target
}

rule ANYFCM7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "ANYFCM7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "ANYFCM7" ascii nocase
    condition:
        $target
}

rule AOCODARCF405AIO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF405AIO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "AOCODARCF405AIO" ascii nocase
    condition:
        $target
}

rule AOCODARCF4V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF4V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "AOCODARCF4V2" ascii nocase
    condition:
        $target
}

rule AOCODARCF4V3_SD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF4V3_SD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "AOCODARCF4V3_SD" ascii nocase
    condition:
        $target
}

rule AOCODARCF4V3_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF4V3"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "AOCODARCF4V3" ascii nocase
    condition:
        $target
}

rule AOCODARCF722AIO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF722AIO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "AOCODARCF722AIO" ascii nocase
    condition:
        $target
}

rule AOCODARCF7DUAL_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF7DUAL"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "AOCODARCF7DUAL" ascii nocase
    condition:
        $target
}

rule AOCODARCF7MINI_V1_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF7MINI_V1"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "AOCODARCF7MINI_V1" ascii nocase
    condition:
        $target
}

rule AOCODARCF7MINI_V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCF7MINI_V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "AOCODARCF7MINI_V2" ascii nocase
    condition:
        $target
}

rule AOCODARCH7DUAL_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "AOCODARCH7DUAL"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "AOCODARCH7DUAL" ascii nocase
    condition:
        $target
}

rule ASGARD32F4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "ASGARD32F4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "ASGARD32F4" ascii nocase
    condition:
        $target
}

rule ASGARD32F7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "ASGARD32F7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "ASGARD32F7" ascii nocase
    condition:
        $target
}

rule ATOMRCF405NAVI_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "ATOMRCF405NAVI"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "ATOMRCF405NAVI" ascii nocase
    condition:
        $target
}

rule ATOMRCF405NAVI_DELUX_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "ATOMRCF405NAVI_DELUX"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "ATOMRCF405NAVI_DELUX" ascii nocase
    condition:
        $target
}

rule ATOMRCF405V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "ATOMRCF405V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "ATOMRCF405V2" ascii nocase
    condition:
        $target
}

rule AXISFLYINGF7PRO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "AXISFLYINGF7PRO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "AXISFLYINGF7PRO" ascii nocase
    condition:
        $target
}

rule BEEROTORF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "BEEROTORF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "BEEROTORF4" ascii nocase
    condition:
        $target
}

rule BETAFLIGHTF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "BETAFLIGHTF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "BETAFLIGHTF4" ascii nocase
    condition:
        $target
}

rule BETAFPVF411_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "BETAFPVF411"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "BETAFPVF411" ascii nocase
    condition:
        $target
}

rule BETAFPVF435_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "BETAFPVF435"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "BETAFPVF435" ascii nocase
    condition:
        $target
}

rule BETAFPVF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "BETAFPVF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "BETAFPVF722" ascii nocase
    condition:
        $target
}

rule BLACKPILL_F411_OSD_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "BLACKPILL_F411_OSD"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "BLACKPILL_F411_OSD" ascii nocase
    condition:
        $target
}

rule BLACKPILL_F411_BLACKBOX_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "BLACKPILL_F411_BLACKBOX"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "BLACKPILL_F411_BLACKBOX" ascii nocase
    condition:
        $target
}

rule BLUEBERRYF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "BLUEBERRYF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "BLUEBERRYF405" ascii nocase
    condition:
        $target
}

rule BLUEBERRYF435WING_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "BLUEBERRYF435WING"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "BLUEBERRYF435WING" ascii nocase
    condition:
        $target
}

rule BLUEBERRYF435WING_SD_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "BLUEBERRYF435WING_SD"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "BLUEBERRYF435WING_SD" ascii nocase
    condition:
        $target
}

rule BLUEJAYF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "BLUEJAYF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "BLUEJAYF4" ascii nocase
    condition:
        $target
}

rule BOTWINGF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "BOTWINGF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "BOTWINGF405" ascii nocase
    condition:
        $target
}

rule BOTWINGF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "BOTWINGF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "BOTWINGF722" ascii nocase
    condition:
        $target
}

rule BRAHMA_F405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "BRAHMA_F405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "BRAHMA_F405" ascii nocase
    condition:
        $target
}

rule BRAHMA_F722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "BRAHMA_F722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "BRAHMA_F722" ascii nocase
    condition:
        $target
}

rule BRAHMA_H7_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "BRAHMA_H7"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "BRAHMA_H7" ascii nocase
    condition:
        $target
}

rule BROTHERHOBBYF405V3_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "BROTHERHOBBYF405V3"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "BROTHERHOBBYF405V3" ascii nocase
    condition:
        $target
}

rule BROTHERHOBBYH743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "BROTHERHOBBYH743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "BROTHERHOBBYH743" ascii nocase
    condition:
        $target
}

rule CADDXF4_AIO_ELRS_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "CADDXF4_AIO_ELRS"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "CADDXF4_AIO_ELRS" ascii nocase
    condition:
        $target
}

rule CLRACINGF4AIR_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "CLRACINGF4AIR"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "CLRACINGF4AIR" ascii nocase
    condition:
        $target
}

rule CLRACINGF4AIRV2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "CLRACINGF4AIRV2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "CLRACINGF4AIRV2" ascii nocase
    condition:
        $target
}

rule CLRACINGF4AIRV3_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "CLRACINGF4AIRV3"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "CLRACINGF4AIRV3" ascii nocase
    condition:
        $target
}

rule COLIBRI_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "COLIBRI"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "COLIBRI" ascii nocase
    condition:
        $target
}

rule QUANTON_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "QUANTON"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "QUANTON" ascii nocase
    condition:
        $target
}

rule COREWINGF405WINGV2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "COREWINGF405WINGV2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "COREWINGF405WINGV2" ascii nocase
    condition:
        $target
}

rule CORVON405V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "CORVON405V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "CORVON405V2" ascii nocase
    condition:
        $target
}

rule CORVON743V1_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "CORVON743V1"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "CORVON743V1" ascii nocase
    condition:
        $target
}

rule DAKEFPVF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "DAKEFPVF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "DAKEFPVF405" ascii nocase
    condition:
        $target
}

rule DAKEFPVF435_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "DAKEFPVF435"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "DAKEFPVF435" ascii nocase
    condition:
        $target
}

rule DAKEFPVF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "DAKEFPVF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "DAKEFPVF722" ascii nocase
    condition:
        $target
}

rule DAKEFPVF722X8_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "DAKEFPVF722X8"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "DAKEFPVF722X8" ascii nocase
    condition:
        $target
}

rule DAKEFPVH743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "DAKEFPVH743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "DAKEFPVH743" ascii nocase
    condition:
        $target
}

rule DAKEFPVH743PRO_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "DAKEFPVH743PRO"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "DAKEFPVH743PRO" ascii nocase
    condition:
        $target
}

rule DALRCF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "DALRCF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "DALRCF405" ascii nocase
    condition:
        $target
}

rule DALRCF722DUAL_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "DALRCF722DUAL"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "DALRCF722DUAL" ascii nocase
    condition:
        $target
}

rule F4BY_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "F4BY"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "F4BY" ascii nocase
    condition:
        $target
}

rule FF_F35_LIGHTNING_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FF_F35_LIGHTNING"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FF_F35_LIGHTNING" ascii nocase
    condition:
        $target
}

rule WINGFC_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "WINGFC"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "WINGFC" ascii nocase
    condition:
        $target
}

rule FF_FORTINIF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FF_FORTINIF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FF_FORTINIF4" ascii nocase
    condition:
        $target
}

rule FF_PIKOF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FF_PIKOF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FF_PIKOF4" ascii nocase
    condition:
        $target
}

rule FF_PIKOF4OSD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FF_PIKOF4OSD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FF_PIKOF4OSD" ascii nocase
    condition:
        $target
}

rule FIREWORKSV2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FIREWORKSV2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FIREWORKSV2" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4V6_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4V6"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4V6" ascii nocase
    condition:
        $target
}

rule FISHDRONEF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FISHDRONEF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FISHDRONEF4" ascii nocase
    condition:
        $target
}

rule FLASHHOBBYF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FLASHHOBBYF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FLASHHOBBYF405" ascii nocase
    condition:
        $target
}

rule FLASHHOBBYF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FLASHHOBBYF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FLASHHOBBYF722" ascii nocase
    condition:
        $target
}

rule FLYCOLORF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FLYCOLORF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FLYCOLORF4" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7MINI_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FLYCOLORF7MINI"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FLYCOLORF7MINI" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FLYCOLORF7V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FLYCOLORF7V2" ascii nocase
    condition:
        $target
}

rule FLYDRAGONPRO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FLYDRAGONPRO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FLYDRAGONPRO" ascii nocase
    condition:
        $target
}

rule FLYINGRCF4WINGMINI_NOT_RECOMMENDED_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FLYINGRCF4WINGMINI_NOT_RECOMMENDED"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FLYINGRCF4WINGMINI_NOT_RECOMMENDED" ascii nocase
    condition:
        $target
}

rule FlySparkF4v1_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FlySparkF4v1"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FlySparkF4v1" ascii nocase
    condition:
        $target
}

rule FLYWOOF405PRO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF405PRO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FLYWOOF405PRO" ascii nocase
    condition:
        $target
}

rule FLYWOOF405HD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF405HD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FLYWOOF405HD" ascii nocase
    condition:
        $target
}

rule FLYWOOF405S_AIO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF405S_AIO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FLYWOOF405S_AIO" ascii nocase
    condition:
        $target
}

rule FLYWOOF411_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF411"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "FLYWOOF411" ascii nocase
    condition:
        $target
}

rule FLYWOOF411_V2_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF411_V2"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "FLYWOOF411_V2" ascii nocase
    condition:
        $target
}

rule FLYWOOF722PRO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF722PRO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FLYWOOF722PRO" ascii nocase
    condition:
        $target
}

rule FLYWOOF745_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF745"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "FLYWOOF745" ascii nocase
    condition:
        $target
}

rule FLYWOOF745NANO_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF745NANO"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "FLYWOOF745NANO" ascii nocase
    condition:
        $target
}

rule FLYWOOF7DUAL_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOF7DUAL"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FLYWOOF7DUAL" ascii nocase
    condition:
        $target
}

rule FLYWOOH743PRO_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "FLYWOOH743PRO"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "FLYWOOH743PRO" ascii nocase
    condition:
        $target
}

rule FOXEERF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FOXEERF405" ascii nocase
    condition:
        $target
}

rule FOXEERF405V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF405V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FOXEERF405V2" ascii nocase
    condition:
        $target
}

rule FOXEERF722DUAL_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF722DUAL"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FOXEERF722DUAL" ascii nocase
    condition:
        $target
}

rule FOXEERF722V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF722V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FOXEERF722V2" ascii nocase
    condition:
        $target
}

rule FOXEERF722V4_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF722V4"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FOXEERF722V4" ascii nocase
    condition:
        $target
}

rule FOXEERF722V4_X8_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF722V4_X8"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FOXEERF722V4_X8" ascii nocase
    condition:
        $target
}

rule FOXEERF745AIO_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF745AIO"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "FOXEERF745AIO" ascii nocase
    condition:
        $target
}

rule FOXEERF745AIO_V3_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERF745AIO_V3"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "FOXEERF745AIO_V3" ascii nocase
    condition:
        $target
}

rule FOXEERH743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "FOXEERH743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "FOXEERH743" ascii nocase
    condition:
        $target
}

rule FRSKYF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FRSKYF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FRSKYF4" ascii nocase
    condition:
        $target
}

rule FRSKYPILOT_STM32F765 {
    meta:
        detection_source = "inav-target"
        target = "FRSKYPILOT"
        build_macro = "target_stm32f765xg"
        chipset = "STM32F765"
    strings:
        $target = "FRSKYPILOT" ascii nocase
    condition:
        $target
}

rule FRSKYPILOT_LED_STM32F765 {
    meta:
        detection_source = "inav-target"
        target = "FRSKYPILOT_LED"
        build_macro = "target_stm32f765xg"
        chipset = "STM32F765"
    strings:
        $target = "FRSKYPILOT_LED" ascii nocase
    condition:
        $target
}

rule FRSKY_ROVERF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "FRSKY_ROVERF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "FRSKY_ROVERF7" ascii nocase
    condition:
        $target
}

rule FURYF4OSD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "FURYF4OSD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "FURYF4OSD" ascii nocase
    condition:
        $target
}

rule MAMBAF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MAMBAF405" ascii nocase
    condition:
        $target
}

rule GEPRCF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "GEPRCF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "GEPRCF405" ascii nocase
    condition:
        $target
}

rule GEPRCF405_BT_HD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "GEPRCF405_BT_HD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "GEPRCF405_BT_HD" ascii nocase
    condition:
        $target
}

rule GEPRCF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "GEPRCF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "GEPRCF722" ascii nocase
    condition:
        $target
}

rule GEPRCF722_BT_HD_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "GEPRCF722_BT_HD"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "GEPRCF722_BT_HD" ascii nocase
    condition:
        $target
}

rule GEPRCF745_BT_HD_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "GEPRCF745_BT_HD"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "GEPRCF745_BT_HD" ascii nocase
    condition:
        $target
}

rule GEPRC_F722_AIO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "GEPRC_F722_AIO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "GEPRC_F722_AIO" ascii nocase
    condition:
        $target
}

rule GEPRC_F722_AIO_UART3_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "GEPRC_F722_AIO_UART3"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "GEPRC_F722_AIO_UART3" ascii nocase
    condition:
        $target
}

rule GEPRC_TAKER_H743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "GEPRC_TAKER_H743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "GEPRC_TAKER_H743" ascii nocase
    condition:
        $target
}

rule HAKRCF405D_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "HAKRCF405D"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "HAKRCF405D" ascii nocase
    condition:
        $target
}

rule HAKRCF405V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "HAKRCF405V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "HAKRCF405V2" ascii nocase
    condition:
        $target
}

rule HAKRCF411D_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "HAKRCF411D"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "HAKRCF411D" ascii nocase
    condition:
        $target
}

rule HAKRCF722V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "HAKRCF722V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "HAKRCF722V2" ascii nocase
    condition:
        $target
}

rule HAKRCH743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "HAKRCH743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "HAKRCH743" ascii nocase
    condition:
        $target
}

rule HAKRCKD722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "HAKRCKD722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "HAKRCKD722" ascii nocase
    condition:
        $target
}

rule HAPPYMODELF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "HAPPYMODELF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "HAPPYMODELF405" ascii nocase
    condition:
        $target
}

rule HGLRCF405V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "HGLRCF405V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "HGLRCF405V2" ascii nocase
    condition:
        $target
}

rule HGLRCF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "HGLRCF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "HGLRCF722" ascii nocase
    condition:
        $target
}

rule HUMMINGBIRD_FC305_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "HUMMINGBIRD_FC305"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "HUMMINGBIRD_FC305" ascii nocase
    condition:
        $target
}

rule IFLIGHTF4_SUCCEXD_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHTF4_SUCCEXD"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "IFLIGHTF4_SUCCEXD" ascii nocase
    condition:
        $target
}

rule IFLIGHTF4_TWING_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHTF4_TWING"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "IFLIGHTF4_TWING" ascii nocase
    condition:
        $target
}

rule IFLIGHTF7_TWING_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHTF7_TWING"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "IFLIGHTF7_TWING" ascii nocase
    condition:
        $target
}

rule IFLIGHT_2RAW_H743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_2RAW_H743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "IFLIGHT_2RAW_H743" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_ATF435_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_ATF435"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "IFLIGHT_BLITZ_ATF435" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_F722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "IFLIGHT_BLITZ_F722" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F722_X1_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_F722_X1"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "IFLIGHT_BLITZ_F722_X1" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F722_X1_OSD_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_F722_X1_OSD"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "IFLIGHT_BLITZ_F722_X1_OSD" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F7_AIO_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_F7_AIO"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "IFLIGHT_BLITZ_F7_AIO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F7_PRO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_F7_PRO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "IFLIGHT_BLITZ_F7_PRO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_H7_PRO_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_H7_PRO"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "IFLIGHT_BLITZ_H7_PRO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_H7_WING_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_BLITZ_H7_WING"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "IFLIGHT_BLITZ_H7_WING" ascii nocase
    condition:
        $target
}

rule IFLIGHT_H743_AIO_V2_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_H743_AIO_V2"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "IFLIGHT_H743_AIO_V2" ascii nocase
    condition:
        $target
}

rule IFLIGHT_JBF7PRO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "IFLIGHT_JBF7PRO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "IFLIGHT_JBF7PRO" ascii nocase
    condition:
        $target
}

rule JHEF405PRO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "JHEF405PRO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "JHEF405PRO" ascii nocase
    condition:
        $target
}

rule JHEH7AIO_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "JHEH7AIO"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "JHEH7AIO" ascii nocase
    condition:
        $target
}

rule JHEMCUF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "JHEMCUF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "JHEMCUF405" ascii nocase
    condition:
        $target
}

rule JHEMCUF405WING_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "JHEMCUF405WING"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "JHEMCUF405WING" ascii nocase
    condition:
        $target
}

rule JHEMCUF435_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "JHEMCUF435"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "JHEMCUF435" ascii nocase
    condition:
        $target
}

rule JHEMF435AIO_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "JHEMF435AIO"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "JHEMF435AIO" ascii nocase
    condition:
        $target
}

rule JHEMCUF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "JHEMCUF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "JHEMCUF722" ascii nocase
    condition:
        $target
}

rule JHEMCUF745_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "JHEMCUF745"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "JHEMCUF745" ascii nocase
    condition:
        $target
}

rule JHEMCUH743HD_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "JHEMCUH743HD"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "JHEMCUH743HD" ascii nocase
    condition:
        $target
}

rule KAKUTEF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "KAKUTEF4" ascii nocase
    condition:
        $target
}

rule KAKUTEF4V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF4V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "KAKUTEF4V2" ascii nocase
    condition:
        $target
}

rule KAKUTEF4V23_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF4V23"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "KAKUTEF4V23" ascii nocase
    condition:
        $target
}

rule KAKUTEF4V24_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF4V24"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "KAKUTEF4V24" ascii nocase
    condition:
        $target
}

rule KAKUTEF4WING_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF4WING"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "KAKUTEF4WING" ascii nocase
    condition:
        $target
}

rule KAKUTEF7_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF7"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "KAKUTEF7" ascii nocase
    condition:
        $target
}

rule KAKUTEF7HDV_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF7HDV"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "KAKUTEF7HDV" ascii nocase
    condition:
        $target
}

rule KAKUTEF7MINI_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF7MINI"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "KAKUTEF7MINI" ascii nocase
    condition:
        $target
}

rule KAKUTEF7MINIV3_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEF7MINIV3"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "KAKUTEF7MINIV3" ascii nocase
    condition:
        $target
}

rule KAKUTEH7_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEH7"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "KAKUTEH7" ascii nocase
    condition:
        $target
}

rule KAKUTEH7V2_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEH7V2"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "KAKUTEH7V2" ascii nocase
    condition:
        $target
}

rule KAKUTEH7MINI_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEH7MINI"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "KAKUTEH7MINI" ascii nocase
    condition:
        $target
}

rule KAKUTEH7WING_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "KAKUTEH7WING"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "KAKUTEH7WING" ascii nocase
    condition:
        $target
}

rule KROOZX_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "KROOZX"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "KROOZX" ascii nocase
    condition:
        $target
}

rule MAMBAF405US_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF405US"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MAMBAF405US" ascii nocase
    condition:
        $target
}

rule MAMBAF405US_I2C_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF405US_I2C"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MAMBAF405US_I2C" ascii nocase
    condition:
        $target
}

rule MAMBAF405_2022A_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF405_2022A"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MAMBAF405_2022A" ascii nocase
    condition:
        $target
}

rule MAMBAF405_2022B_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF405_2022B"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MAMBAF405_2022B" ascii nocase
    condition:
        $target
}

rule MAMBAF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MAMBAF722" ascii nocase
    condition:
        $target
}

rule MAMBAF722_I2C_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF722_I2C"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MAMBAF722_I2C" ascii nocase
    condition:
        $target
}

rule MAMBAF722_2022A_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF722_2022A"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MAMBAF722_2022A" ascii nocase
    condition:
        $target
}

rule MAMBAF722_2022B_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF722_2022B"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MAMBAF722_2022B" ascii nocase
    condition:
        $target
}

rule MAMBAF722_WING_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF722_WING"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MAMBAF722_WING" ascii nocase
    condition:
        $target
}

rule MAMBAF722_X8_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAF722_X8"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MAMBAF722_X8" ascii nocase
    condition:
        $target
}

rule MAMBAH743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAH743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MAMBAH743" ascii nocase
    condition:
        $target
}

rule MAMBAH743_2022B_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAH743_2022B"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MAMBAH743_2022B" ascii nocase
    condition:
        $target
}

rule MAMBAH743_2022B_GYRO2_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MAMBAH743_2022B_GYRO2"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MAMBAH743_2022B_GYRO2" ascii nocase
    condition:
        $target
}

rule MATEKF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405" ascii nocase
    condition:
        $target
}

rule MATEKF405OSD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405OSD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405OSD" ascii nocase
    condition:
        $target
}

rule MATEKF405MINI_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405MINI"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405MINI" ascii nocase
    condition:
        $target
}

rule MATEKF405CAN_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405CAN"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405CAN" ascii nocase
    condition:
        $target
}

rule MATEKF405SE_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405SE"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405SE" ascii nocase
    condition:
        $target
}

rule MATEKF405SE_PINIO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405SE_PINIO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405SE_PINIO" ascii nocase
    condition:
        $target
}

rule MATEKF405TE_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405TE"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405TE" ascii nocase
    condition:
        $target
}

rule MATEKF405TE_SD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF405TE_SD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MATEKF405TE_SD" ascii nocase
    condition:
        $target
}

rule MATEKF411_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411" ascii nocase
    condition:
        $target
}

rule MATEKF411_FD_SFTSRL_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411_FD_SFTSRL"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411_FD_SFTSRL" ascii nocase
    condition:
        $target
}

rule MATEKF411_RSSI_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411_RSSI"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411_RSSI" ascii nocase
    condition:
        $target
}

rule MATEKF411_SFTSRL2_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411_SFTSRL2"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411_SFTSRL2" ascii nocase
    condition:
        $target
}

rule MATEKF411SE_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411SE"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411SE" ascii nocase
    condition:
        $target
}

rule MATEKF411SE_PINIO_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411SE_PINIO"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411SE_PINIO" ascii nocase
    condition:
        $target
}

rule MATEKF411SE_FD_SFTSRL1_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411SE_FD_SFTSRL1"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411SE_FD_SFTSRL1" ascii nocase
    condition:
        $target
}

rule MATEKF411SE_SS2_CH6_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411SE_SS2_CH6"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411SE_SS2_CH6" ascii nocase
    condition:
        $target
}

rule MATEKF411TE_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF411TE"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "MATEKF411TE" ascii nocase
    condition:
        $target
}

rule MATEKF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MATEKF722" ascii nocase
    condition:
        $target
}

rule MATEKF722PX_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF722PX"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MATEKF722PX" ascii nocase
    condition:
        $target
}

rule MATEKF722PX_PINIO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF722PX_PINIO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MATEKF722PX_PINIO" ascii nocase
    condition:
        $target
}

rule MATEKF722WPX_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF722WPX"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MATEKF722WPX" ascii nocase
    condition:
        $target
}

rule MATEKF722SE_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF722SE"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MATEKF722SE" ascii nocase
    condition:
        $target
}

rule MATEKF722MINI_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF722MINI"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "MATEKF722MINI" ascii nocase
    condition:
        $target
}

rule MATEKF765_STM32F765 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF765"
        build_macro = "target_stm32f765xi"
        chipset = "STM32F765"
    strings:
        $target = "MATEKF765" ascii nocase
    condition:
        $target
}

rule MATEKF765SE_STM32F765 {
    meta:
        detection_source = "inav-target"
        target = "MATEKF765SE"
        build_macro = "target_stm32f765xi"
        chipset = "STM32F765"
    strings:
        $target = "MATEKF765SE" ascii nocase
    condition:
        $target
}

rule MATEKH743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MATEKH743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MATEKH743" ascii nocase
    condition:
        $target
}

rule MATEKH743HD_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MATEKH743HD"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MATEKH743HD" ascii nocase
    condition:
        $target
}

rule MICOAIR405MINI_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MICOAIR405MINI"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MICOAIR405MINI" ascii nocase
    condition:
        $target
}

rule MICOAIR405V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "MICOAIR405V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "MICOAIR405V2" ascii nocase
    condition:
        $target
}

rule MICOAIR743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MICOAIR743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MICOAIR743" ascii nocase
    condition:
        $target
}

rule MICOAIR743_EXTMAG_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MICOAIR743_EXTMAG"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MICOAIR743_EXTMAG" ascii nocase
    condition:
        $target
}

rule MICOAIR743AIO_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MICOAIR743AIO"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MICOAIR743AIO" ascii nocase
    condition:
        $target
}

rule MICOAIR743V2_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MICOAIR743V2"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MICOAIR743V2" ascii nocase
    condition:
        $target
}

rule MICOAIR743V2_EXTMAG_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "MICOAIR743V2_EXTMAG"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "MICOAIR743V2_EXTMAG" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF435MINI_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "NEUTRONRCF435MINI"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "NEUTRONRCF435MINI" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF435SE_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "NEUTRONRCF435SE"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "NEUTRONRCF435SE" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF435WING_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "NEUTRONRCF435WING"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "NEUTRONRCF435WING" ascii nocase
    condition:
        $target
}

rule NEUTRONRCH7BT_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "NEUTRONRCH7BT"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "NEUTRONRCH7BT" ascii nocase
    condition:
        $target
}

rule NEXUSX_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "NEXUSX"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "NEXUSX" ascii nocase
    condition:
        $target
}

rule NOX_STM32F411 {
    meta:
        detection_source = "inav-target"
        target = "NOX"
        build_macro = "target_stm32f411xe"
        chipset = "STM32F411"
    strings:
        $target = "NOX" ascii nocase
    condition:
        $target
}

rule DYSF4PRO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "DYSF4PRO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "DYSF4PRO" ascii nocase
    condition:
        $target
}

rule DYSF4PROV2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "DYSF4PROV2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "DYSF4PROV2" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4PRO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4PRO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4PRO" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4V3_S5_S6_2SS_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4V3_S5_S6_2SS"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4V3_S5_S6_2SS" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4V3_S5S6_SS_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4V3_S5S6_SS"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4V3_S5S6_SS" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4V3_S6_SS_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4V3_S6_SS"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4V3_S6_SS" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4V3_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4V3"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4V3" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4V3_ICM_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF4V3_ICM"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "OMNIBUSF4V3_ICM" ascii nocase
    condition:
        $target
}

rule OMNIBUSF7_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF7"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "OMNIBUSF7" ascii nocase
    condition:
        $target
}

rule OMNIBUSF7V2_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF7V2"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "OMNIBUSF7V2" ascii nocase
    condition:
        $target
}

rule OMNIBUSF7NXT_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "OMNIBUSF7NXT"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "OMNIBUSF7NXT" ascii nocase
    condition:
        $target
}

rule ORBITF435_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "ORBITF435"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "ORBITF435" ascii nocase
    condition:
        $target
}

rule ORBITF435_SD_AT32F435G {
    meta:
        detection_source = "inav-target"
        target = "ORBITF435_SD"
        build_macro = "target_at32f43x_xGT7"
        chipset = "AT32F435G"
    strings:
        $target = "ORBITF435_SD" ascii nocase
    condition:
        $target
}

rule ORBITH743_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "ORBITH743"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "ORBITH743" ascii nocase
    condition:
        $target
}

rule PIXRACER_STM32F427 {
    meta:
        detection_source = "inav-target"
        target = "PIXRACER"
        build_macro = "target_stm32f427xg"
        chipset = "STM32F427"
    strings:
        $target = "PIXRACER" ascii nocase
    condition:
        $target
}

rule PRINCIPIOTF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "PRINCIPIOTF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "PRINCIPIOTF7" ascii nocase
    condition:
        $target
}

rule RADIOLINKF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "RADIOLINKF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "RADIOLINKF405" ascii nocase
    condition:
        $target
}

rule RADIOLINKF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "RADIOLINKF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "RADIOLINKF722" ascii nocase
    condition:
        $target
}

rule REVO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "REVO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "REVO" ascii nocase
    condition:
        $target
}

rule RUSH_BLADE_F7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "RUSH_BLADE_F7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "RUSH_BLADE_F7" ascii nocase
    condition:
        $target
}

rule RUSH_BLADE_F7_HD_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "RUSH_BLADE_F7_HD"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "RUSH_BLADE_F7_HD" ascii nocase
    condition:
        $target
}

rule SAGEATF4_AT32F435M {
    meta:
        detection_source = "inav-target"
        target = "SAGEATF4"
        build_macro = "target_at32f43x_xMT7"
        chipset = "AT32F435M"
    strings:
        $target = "SAGEATF4" ascii nocase
    condition:
        $target
}

rule SDMODELH7V1_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "SDMODELH7V1"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "SDMODELH7V1" ascii nocase
    condition:
        $target
}

rule SDMODELH7V2_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "SDMODELH7V2"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "SDMODELH7V2" ascii nocase
    condition:
        $target
}

rule SEQUREH7_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "SEQUREH7"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "SEQUREH7" ascii nocase
    condition:
        $target
}

rule SEQUREH7V2_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "SEQUREH7V2"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "SEQUREH7V2" ascii nocase
    condition:
        $target
}

rule SIMPLIFLYH7_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "SIMPLIFLYH7"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "SIMPLIFLYH7" ascii nocase
    condition:
        $target
}

rule SITL_SITL {
    meta:
        detection_source = "inav-target"
        target = "SITL"
        build_macro = "target_sitl"
        chipset = "SITL"
    strings:
        $target = "SITL" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405HD_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF405HD"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SKYSTARSF405HD" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405HD2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF405HD2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SKYSTARSF405HD2" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405AIO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF405AIO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SKYSTARSF405AIO" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405V2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF405V2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SKYSTARSF405V2" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405WING_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF405WING"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SKYSTARSF405WING" ascii nocase
    condition:
        $target
}

rule SKYSTARSF722HD_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF722HD"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SKYSTARSF722HD" ascii nocase
    condition:
        $target
}

rule SKYSTARSF722HDPRO_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF722HDPRO"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SKYSTARSF722HDPRO" ascii nocase
    condition:
        $target
}

rule SKYSTARSF722MINIHD_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSF722MINIHD"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SKYSTARSF722MINIHD" ascii nocase
    condition:
        $target
}

rule SKYSTARSH743HD_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "SKYSTARSH743HD"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "SKYSTARSH743HD" ascii nocase
    condition:
        $target
}

rule SPARKY2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPARKY2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPARKY2" ascii nocase
    condition:
        $target
}

rule SPEDIXF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEDIXF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEDIXF405" ascii nocase
    condition:
        $target
}

rule SPEDIXF722_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SPEDIXF722"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SPEDIXF722" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF4" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF4_SFTSRL1_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF4_SFTSRL1"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF4_SFTSRL1" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF4_SFTSRL2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF4_SFTSRL2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF4_SFTSRL2" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405AIO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF405AIO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF405AIO" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405MINI_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF405MINI"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF405MINI" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405V3_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF405V3"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF405V3" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405V4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF405V4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF405V4" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405WING_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF405WING"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF405WING" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405WINGV2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF405WINGV2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPEEDYBEEF405WINGV2" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SPEEDYBEEF7" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF745AIO_STM32F745 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF745AIO"
        build_macro = "target_stm32f745xg"
        chipset = "STM32F745"
    strings:
        $target = "SPEEDYBEEF745AIO" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7MINI_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF7MINI"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SPEEDYBEEF7MINI" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7MINIV2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF7MINIV2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SPEEDYBEEF7MINIV2" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF7V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SPEEDYBEEF7V2" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7V3_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SPEEDYBEEF7V3"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SPEEDYBEEF7V3" ascii nocase
    condition:
        $target
}

rule SPRACINGF4EVO_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "SPRACINGF4EVO"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "SPRACINGF4EVO" ascii nocase
    condition:
        $target
}

rule SPRACINGF7DUAL_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "SPRACINGF7DUAL"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "SPRACINGF7DUAL" ascii nocase
    condition:
        $target
}

rule TAKERF722SE_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "TAKERF722SE"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "TAKERF722SE" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_FC_AT32F435M {
    meta:
        detection_source = "inav-target"
        target = "TBS_LUCID_FC"
        build_macro = "target_at32f43x_xMT7"
        chipset = "AT32F435M"
    strings:
        $target = "TBS_LUCID_FC" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_H7_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "TBS_LUCID_H7"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "TBS_LUCID_H7" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_H7_WING_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "TBS_LUCID_H7_WING"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "TBS_LUCID_H7_WING" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_H7_WING_MINI_STM32H743 {
    meta:
        detection_source = "inav-target"
        target = "TBS_LUCID_H7_WING_MINI"
        build_macro = "target_stm32h743xi"
        chipset = "STM32H743"
    strings:
        $target = "TBS_LUCID_H7_WING_MINI" ascii nocase
    condition:
        $target
}

rule TMOTORF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "TMOTORF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "TMOTORF7" ascii nocase
    condition:
        $target
}

rule TMOTORF7HD_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "TMOTORF7HD"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "TMOTORF7HD" ascii nocase
    condition:
        $target
}

rule TMOTORF7V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "TMOTORF7V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "TMOTORF7V2" ascii nocase
    condition:
        $target
}

rule TMOTORVELOXF7V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "TMOTORVELOXF7V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "TMOTORVELOXF7V2" ascii nocase
    condition:
        $target
}

rule TUNERCF405_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "TUNERCF405"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "TUNERCF405" ascii nocase
    condition:
        $target
}

rule VANTAC_RF007_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "VANTAC_RF007"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "VANTAC_RF007" ascii nocase
    condition:
        $target
}

rule WARPF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "WARPF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "WARPF7" ascii nocase
    condition:
        $target
}

rule YUPIF4_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "YUPIF4"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "YUPIF4" ascii nocase
    condition:
        $target
}

rule YUPIF4MINI_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "YUPIF4MINI"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "YUPIF4MINI" ascii nocase
    condition:
        $target
}

rule YUPIF4R2_STM32F405 {
    meta:
        detection_source = "inav-target"
        target = "YUPIF4R2"
        build_macro = "target_stm32f405xg"
        chipset = "STM32F405"
    strings:
        $target = "YUPIF4R2" ascii nocase
    condition:
        $target
}

rule YUPIF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "YUPIF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "YUPIF7" ascii nocase
    condition:
        $target
}

rule ZEEZF7_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "ZEEZF7"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "ZEEZF7" ascii nocase
    condition:
        $target
}

rule ZEEZF7V2_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "ZEEZF7V2"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "ZEEZF7V2" ascii nocase
    condition:
        $target
}

rule ZEEZF7V3_STM32F722 {
    meta:
        detection_source = "inav-target"
        target = "ZEEZF7V3"
        build_macro = "target_stm32f722xe"
        chipset = "STM32F722"
    strings:
        $target = "ZEEZF7V3" ascii nocase
    condition:
        $target
}
