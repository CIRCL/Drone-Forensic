/*
 * Auto-generated from the Betaflight target API and the local Betaflight source tree.
 * Author: CIRCL https://www.circl.lu/
 * License: GNU Affero General Public Licence https://www.gnu.org/licenses/agpl-3.0.en.html
 */

rule _2RAW_THUNDER_H7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "2RAW_THUNDER_H7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "IFRC"
    strings:
        $target = "2RAW_THUNDER_H7" ascii nocase
    condition:
        $target
}

rule ACCIF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "ACCIF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CUST"
    strings:
        $target = "ACCIF405" ascii nocase
    condition:
        $target
}

rule ACCIF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "ACCIF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "CUST"
    strings:
        $target = "ACCIF435" ascii nocase
    condition:
        $target
}

rule ACCIF435ELITE_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "ACCIF435ELITE"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "FOSS"
    strings:
        $target = "ACCIF435ELITE" ascii nocase
    condition:
        $target
}

rule ACROSKYF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "ACROSKYF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "ASKY"
    strings:
        $target = "ACROSKYF405" ascii nocase
    condition:
        $target
}

rule ACROSKYH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "ACROSKYH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "ASKY"
    strings:
        $target = "ACROSKYH743" ascii nocase
    condition:
        $target
}

rule AEDROXH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "AEDROXH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "AEDR"
    strings:
        $target = "AEDROXH7" ascii nocase
    condition:
        $target
}

rule AEROH7DIGITAL_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "AEROH7DIGITAL"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "AERO"
    strings:
        $target = "AEROH7DIGITAL" ascii nocase
    condition:
        $target
}

rule AG3XF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AG3XF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "AG3XF4" ascii nocase
    condition:
        $target
}

rule AG3XF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AG3XF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIRB"
    strings:
        $target = "AG3XF7" ascii nocase
    condition:
        $target
}

rule AIKONF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AIKONF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIKO"
    strings:
        $target = "AIKONF4" ascii nocase
    condition:
        $target
}

rule AIKONF4V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AIKONF4V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIKO"
    strings:
        $target = "AIKONF4V2" ascii nocase
    condition:
        $target
}

rule AIKONF4V3_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AIKONF4V3"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIKO"
    strings:
        $target = "AIKONF4V3" ascii nocase
    condition:
        $target
}

rule AIKONF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AIKONF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIKO"
    strings:
        $target = "AIKONF7" ascii nocase
    condition:
        $target
}

rule AIRBOTF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTF4" ascii nocase
    condition:
        $target
}

rule AIRBOTF4SD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTF4SD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTF4SD" ascii nocase
    condition:
        $target
}

rule AIRBOTF4V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTF4V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTF4V2" ascii nocase
    condition:
        $target
}

rule AIRBOTF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTF7" ascii nocase
    condition:
        $target
}

rule AIRBOTF7HDV_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTF7HDV"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTF7HDV" ascii nocase
    condition:
        $target
}

rule AIRBOTG4AIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTG4AIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTG4AIO" ascii nocase
    condition:
        $target
}

rule AIRBOTSUPERF4_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTSUPERF4"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTSUPERF4" ascii nocase
    condition:
        $target
}

rule AIRBOTSUPERF4V2_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBOTSUPERF4V2"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "AIRB"
    strings:
        $target = "AIRBOTSUPERF4V2" ascii nocase
    condition:
        $target
}

rule AIRBRAINH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "AIRBRAINH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "GEUP"
    strings:
        $target = "AIRBRAINH743" ascii nocase
    condition:
        $target
}

rule AIRF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AIRF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RAST"
    strings:
        $target = "AIRF7" ascii nocase
    condition:
        $target
}

rule ALIENFLIGHTF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "ALIENFLIGHTF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AFNG"
    strings:
        $target = "ALIENFLIGHTF4" ascii nocase
    condition:
        $target
}

rule ALIENFLIGHTNGF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ALIENFLIGHTNGF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AFNG"
    strings:
        $target = "ALIENFLIGHTNGF7" ascii nocase
    condition:
        $target
}

rule ALIENFLIGHTNGF7_DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ALIENFLIGHTNGF7_DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AFNG"
    strings:
        $target = "ALIENFLIGHTNGF7_DUAL" ascii nocase
    condition:
        $target
}

rule ALIENFLIGHTNGF7_ELRS_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ALIENFLIGHTNGF7_ELRS"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AFNG"
    strings:
        $target = "ALIENFLIGHTNGF7_ELRS" ascii nocase
    condition:
        $target
}

rule ALIENFLIGHTNGF7_RX_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ALIENFLIGHTNGF7_RX"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AFNG"
    strings:
        $target = "ALIENFLIGHTNGF7_RX" ascii nocase
    condition:
        $target
}

rule ALIENWHOOPF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "ALIENWHOOPF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "ALWH"
    strings:
        $target = "ALIENWHOOPF4" ascii nocase
    condition:
        $target
}

rule ANYFCF7_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "ANYFCF7"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FOSS"
    strings:
        $target = "ANYFCF7" ascii nocase
    condition:
        $target
}

rule ANYFCM7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ANYFCM7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FOSS"
    strings:
        $target = "ANYFCM7" ascii nocase
    condition:
        $target
}

rule AOCODAF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODAF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SJET"
    strings:
        $target = "AOCODAF405" ascii nocase
    condition:
        $target
}

rule AOCODAF405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODAF405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SJET"
    strings:
        $target = "AOCODAF405V2" ascii nocase
    condition:
        $target
}

rule AOCODAF405V2MPU6000_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODAF405V2MPU6000"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SJET"
    strings:
        $target = "AOCODAF405V2MPU6000" ascii nocase
    condition:
        $target
}

rule AOCODAF405V2MPU6500_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODAF405V2MPU6500"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SJET"
    strings:
        $target = "AOCODAF405V2MPU6500" ascii nocase
    condition:
        $target
}

rule AOCODAF722BLE_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODAF722BLE"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SJET"
    strings:
        $target = "AOCODAF722BLE" ascii nocase
    condition:
        $target
}

rule AOCODAF722MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODAF722MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SJET"
    strings:
        $target = "AOCODAF722MINI" ascii nocase
    condition:
        $target
}

rule AOCODAF722MINIV2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODAF722MINIV2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SJET"
    strings:
        $target = "AOCODAF722MINIV2" ascii nocase
    condition:
        $target
}

rule AOCODARCF405_AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODARCF405_AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SJET"
    strings:
        $target = "AOCODARCF405_AIO" ascii nocase
    condition:
        $target
}

rule AOCODARCF405V3_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODARCF405V3"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SJET"
    strings:
        $target = "AOCODARCF405V3" ascii nocase
    condition:
        $target
}

rule AOCODARCF405V3SD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODARCF405V3SD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SJET"
    strings:
        $target = "AOCODARCF405V3SD" ascii nocase
    condition:
        $target
}

rule AOCODARCF411_AIO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODARCF411_AIO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "SJET"
    strings:
        $target = "AOCODARCF411_AIO" ascii nocase
    condition:
        $target
}

rule AOCODARCF722_AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODARCF722_AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SJET"
    strings:
        $target = "AOCODARCF722_AIO" ascii nocase
    condition:
        $target
}

rule AOCODARCF7DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODARCF7DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SJET"
    strings:
        $target = "AOCODARCF7DUAL" ascii nocase
    condition:
        $target
}

rule AOCODARCH7DUAL_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "AOCODARCH7DUAL"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SJET"
    strings:
        $target = "AOCODARCH7DUAL" ascii nocase
    condition:
        $target
}

rule APEXF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "APEXF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "APEX"
    strings:
        $target = "APEXF7" ascii nocase
    condition:
        $target
}

rule APEXF72023_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "APEXF72023"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIRB"
    strings:
        $target = "APEXF72023" ascii nocase
    condition:
        $target
}

rule ARESF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ARESF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RCTI"
    strings:
        $target = "ARESF7" ascii nocase
    condition:
        $target
}

rule ARK_FPV_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "ARK_FPV"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "ARKE"
    strings:
        $target = "ARK_FPV" ascii nocase
    condition:
        $target
}

rule ATOMRCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "ATOMRCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SKZO"
    strings:
        $target = "ATOMRCF405" ascii nocase
    condition:
        $target
}

rule ATOMRCF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "ATOMRCF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "SKZO"
    strings:
        $target = "ATOMRCF411" ascii nocase
    condition:
        $target
}

rule ATOMRCF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ATOMRCF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SKZO"
    strings:
        $target = "ATOMRCF722" ascii nocase
    condition:
        $target
}

rule ATSTARTF435_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "ATSTARTF435"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "AT"
    strings:
        $target = "ATSTARTF435" ascii nocase
    condition:
        $target
}

rule AXISFLYINGECOF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "AXISFLYINGECOF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AXFL"
    strings:
        $target = "AXISFLYINGECOF4" ascii nocase
    condition:
        $target
}

rule AXISFLYINGF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AXISFLYINGF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AXFL"
    strings:
        $target = "AXISFLYINGF7" ascii nocase
    condition:
        $target
}

rule AXISFLYINGF745AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "AXISFLYINGF745AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "AXFL"
    strings:
        $target = "AXISFLYINGF745AIO" ascii nocase
    condition:
        $target
}

rule AXISFLYINGF7AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AXISFLYINGF7AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AXFL"
    strings:
        $target = "AXISFLYINGF7AIO" ascii nocase
    condition:
        $target
}

rule AXISFLYINGF7PRO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "AXISFLYINGF7PRO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AXFL"
    strings:
        $target = "AXISFLYINGF7PRO" ascii nocase
    condition:
        $target
}

rule AXISFLYINGH743PRO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "AXISFLYINGH743PRO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "AXFL"
    strings:
        $target = "AXISFLYINGH743PRO" ascii nocase
    condition:
        $target
}

rule BABYHAWK_II_HD_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "BABYHAWK_II_HD"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "EMAX"
    strings:
        $target = "BABYHAWK_II_HD" ascii nocase
    condition:
        $target
}

rule BAYCK_DOLPHIN_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "BAYCK_DOLPHIN"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "BKRC"
    strings:
        $target = "BAYCK_DOLPHIN" ascii nocase
    condition:
        $target
}

rule BAYCK_DOLPHIN_MINI_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "BAYCK_DOLPHIN_MINI"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "BKRC"
    strings:
        $target = "BAYCK_DOLPHIN_MINI" ascii nocase
    condition:
        $target
}

rule BEASTF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "BEASTF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "BSTF"
    strings:
        $target = "BEASTF722" ascii nocase
    condition:
        $target
}

rule BEASTFPVF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "BEASTFPVF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "BSTF"
    strings:
        $target = "BEASTFPVF722" ascii nocase
    condition:
        $target
}

rule BEEROTORF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BEEROTORF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "RCTI"
    strings:
        $target = "BEEROTORF4" ascii nocase
    condition:
        $target
}

rule BETAFLIGHTF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFLIGHTF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FPVM"
    strings:
        $target = "BETAFLIGHTF4" ascii nocase
    condition:
        $target
}

rule BETAFPVF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVF405" ascii nocase
    condition:
        $target
}

rule BETAFPVF405_ELRS_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVF405_ELRS"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVF405_ELRS" ascii nocase
    condition:
        $target
}

rule BETAFPVF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVF411" ascii nocase
    condition:
        $target
}

rule BETAFPVF411RX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVF411RX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVF411RX" ascii nocase
    condition:
        $target
}

rule BETAFPVF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVF435" ascii nocase
    condition:
        $target
}

rule BETAFPVF4SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVF4SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVF4SX1280" ascii nocase
    condition:
        $target
}

rule BETAFPVF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVF722" ascii nocase
    condition:
        $target
}

rule BETAFPVG473_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVG473"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVG473" ascii nocase
    condition:
        $target
}

rule BETAFPVG473_V2_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVG473_V2"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVG473_V2" ascii nocase
    condition:
        $target
}

rule BETAFPVG473_V3_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVG473_V3"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVG473_V3" ascii nocase
    condition:
        $target
}

rule BETAFPVH725_STM32H725 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVH725"
        api_mcu = "STM32H725"
        chipset = "STM32H725"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVH725" ascii nocase
    condition:
        $target
}

rule BETAFPVH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "BETAFPVH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "BEFH"
    strings:
        $target = "BETAFPVH743" ascii nocase
    condition:
        $target
}

rule BHF405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BHF405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "BROT"
    strings:
        $target = "BHF405V2" ascii nocase
    condition:
        $target
}

rule BLADE_F4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BLADE_F4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "RUSH"
    strings:
        $target = "BLADE_F4" ascii nocase
    condition:
        $target
}

rule BLADE_F7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "BLADE_F7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RUSH"
    strings:
        $target = "BLADE_F7" ascii nocase
    condition:
        $target
}

rule BLADE_F7_AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "BLADE_F7_AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RUSH"
    strings:
        $target = "BLADE_F7_AIO" ascii nocase
    condition:
        $target
}

rule BLADE_F7_HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "BLADE_F7_HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RUSH"
    strings:
        $target = "BLADE_F7_HD" ascii nocase
    condition:
        $target
}

rule BLUEJAYF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BLUEJAYF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "BKMN"
    strings:
        $target = "BLUEJAYF4" ascii nocase
    condition:
        $target
}

rule BOTWINGF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BOTWINGF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "BLDY"
    strings:
        $target = "BOTWINGF405" ascii nocase
    condition:
        $target
}

rule BOTWINGF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "BOTWINGF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "BLDY"
    strings:
        $target = "BOTWINGF722" ascii nocase
    condition:
        $target
}

rule BRAHMA_F405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BRAHMA_F405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DARK"
    strings:
        $target = "BRAHMA_F405" ascii nocase
    condition:
        $target
}

rule BROTHERHOBBYF405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BROTHERHOBBYF405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "BROT"
    strings:
        $target = "BROTHERHOBBYF405V2" ascii nocase
    condition:
        $target
}

rule BROTHERHOBBYF405V3_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "BROTHERHOBBYF405V3"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "BROT"
    strings:
        $target = "BROTHERHOBBYF405V3" ascii nocase
    condition:
        $target
}

rule BROTHERHOBBYF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "BROTHERHOBBYF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "BROT"
    strings:
        $target = "BROTHERHOBBYF435" ascii nocase
    condition:
        $target
}

rule BROTHERHOBBYH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "BROTHERHOBBYH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "BROT"
    strings:
        $target = "BROTHERHOBBYH743" ascii nocase
    condition:
        $target
}

rule CADDX_PROTOS_F4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CADDX_PROTOS_F4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CADX"
    strings:
        $target = "CADDX_PROTOS_F4" ascii nocase
    condition:
        $target
}

rule CADDXF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CADDXF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CADX"
    strings:
        $target = "CADDXF4" ascii nocase
    condition:
        $target
}

rule CADDXF4_AIO_ELRS_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CADDXF4_AIO_ELRS"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CADX"
    strings:
        $target = "CADDXF4_AIO_ELRS" ascii nocase
    condition:
        $target
}

rule CCRCF435AIO_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "CCRCF435AIO"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "CCRC"
    strings:
        $target = "CCRCF435AIO" ascii nocase
    condition:
        $target
}

rule CCRCF722D_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "CCRCF722D"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "CCRC"
    strings:
        $target = "CCRCF722D" ascii nocase
    condition:
        $target
}

rule CHAMP_H743ICM_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "CHAMP_H743ICM"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "OXBT"
    strings:
        $target = "CHAMP_H743ICM" ascii nocase
    condition:
        $target
}

rule CHAMP_H743MPU_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "CHAMP_H743MPU"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "OXBT"
    strings:
        $target = "CHAMP_H743MPU" ascii nocase
    condition:
        $target
}

rule CHONKERH735_STM32H735 {
    meta:
        detection_source = "betaflight-target"
        target = "CHONKERH735"
        api_mcu = "STM32H735"
        chipset = "STM32H735"
        manufacturer = "FOSS"
    strings:
        $target = "CHONKERH735" ascii nocase
    condition:
        $target
}

rule CKFLIGHTF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CKFLIGHTF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CUST"
    strings:
        $target = "CKFLIGHTF4" ascii nocase
    condition:
        $target
}

rule CLRACINGF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CLRACINGF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CLRA"
    strings:
        $target = "CLRACINGF4" ascii nocase
    condition:
        $target
}

rule CLRACINGF4V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CLRACINGF4V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CLRA"
    strings:
        $target = "CLRACINGF4V2" ascii nocase
    condition:
        $target
}

rule CLRACINGF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "CLRACINGF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "CLRA"
    strings:
        $target = "CLRACINGF7" ascii nocase
    condition:
        $target
}

rule COLIBRI_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "COLIBRI"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "TEBS"
    strings:
        $target = "COLIBRI" ascii nocase
    condition:
        $target
}

rule CRAZYBEE473_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "CRAZYBEE473"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "HAMO"
    strings:
        $target = "CRAZYBEE473" ascii nocase
    condition:
        $target
}

rule CRAZYBEEF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CRAZYBEEF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HAMO"
    strings:
        $target = "CRAZYBEEF405" ascii nocase
    condition:
        $target
}

rule CRAZYBEEF4DX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "CRAZYBEEF4DX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HAMO"
    strings:
        $target = "CRAZYBEEF4DX" ascii nocase
    condition:
        $target
}

rule CRAZYBEEF4DXS_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "CRAZYBEEF4DXS"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HAMO"
    strings:
        $target = "CRAZYBEEF4DXS" ascii nocase
    condition:
        $target
}

rule CRAZYBEEF4FR_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "CRAZYBEEF4FR"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HAMO"
    strings:
        $target = "CRAZYBEEF4FR" ascii nocase
    condition:
        $target
}

rule CRAZYBEEF4FS_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "CRAZYBEEF4FS"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HAMO"
    strings:
        $target = "CRAZYBEEF4FS" ascii nocase
    condition:
        $target
}

rule CRAZYBEEF4SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "CRAZYBEEF4SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HAMO"
    strings:
        $target = "CRAZYBEEF4SX1280" ascii nocase
    condition:
        $target
}

rule CYCLONEF405_PRO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "CYCLONEF405_PRO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CYCL"
    strings:
        $target = "CYCLONEF405_PRO" ascii nocase
    condition:
        $target
}

rule CYCLONEF722_PRO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "CYCLONEF722_PRO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "CYCL"
    strings:
        $target = "CYCLONEF722_PRO" ascii nocase
    condition:
        $target
}

rule DAKEFPVF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVF405" ascii nocase
    condition:
        $target
}

rule DAKEFPVF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVF411" ascii nocase
    condition:
        $target
}

rule DAKEFPVF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVF435" ascii nocase
    condition:
        $target
}

rule DAKEFPVF435HD_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVF435HD"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVF435HD" ascii nocase
    condition:
        $target
}

rule DAKEFPVF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVF722" ascii nocase
    condition:
        $target
}

rule DAKEFPVF722X8_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVF722X8"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVF722X8" ascii nocase
    condition:
        $target
}

rule DAKEFPVH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVH743" ascii nocase
    condition:
        $target
}

rule DAKEFPVH743_SLIM_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVH743_SLIM"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVH743_SLIM" ascii nocase
    condition:
        $target
}

rule DAKEFPVH743PRO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "DAKEFPVH743PRO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DAKE"
    strings:
        $target = "DAKEFPVH743PRO" ascii nocase
    condition:
        $target
}

rule DALRCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "DALRCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DALR"
    strings:
        $target = "DALRCF405" ascii nocase
    condition:
        $target
}

rule DALRCF722DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DALRCF722DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DALR"
    strings:
        $target = "DALRCF722DUAL" ascii nocase
    condition:
        $target
}

rule DARWINF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "DARWINF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "DAFP"
    strings:
        $target = "DARWINF411" ascii nocase
    condition:
        $target
}

rule DARWINF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "DARWINF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "DAFP"
    strings:
        $target = "DARWINF435" ascii nocase
    condition:
        $target
}

rule DARWINF4SX1280HD_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "DARWINF4SX1280HD"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "DAFP"
    strings:
        $target = "DARWINF4SX1280HD" ascii nocase
    condition:
        $target
}

rule DARWINF722HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DARWINF722HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DAFP"
    strings:
        $target = "DARWINF722HD" ascii nocase
    condition:
        $target
}

rule DARWINF722HDV2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DARWINF722HDV2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DAFP"
    strings:
        $target = "DARWINF722HDV2" ascii nocase
    condition:
        $target
}

rule DARWINH7DUAL_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "DARWINH7DUAL"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DAFP"
    strings:
        $target = "DARWINH7DUAL" ascii nocase
    condition:
        $target
}

rule DFR_F722_DUAL_HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DFR_F722_DUAL_HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DFRA"
    strings:
        $target = "DFR_F722_DUAL_HD" ascii nocase
    condition:
        $target
}

rule DREAMFLYF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "DREAMFLYF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DFRC"
    strings:
        $target = "DREAMFLYF405" ascii nocase
    condition:
        $target
}

rule DREAMFLYF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "DREAMFLYF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "DFRC"
    strings:
        $target = "DREAMFLYF411" ascii nocase
    condition:
        $target
}

rule DREAMFLYF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DREAMFLYF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DFRC"
    strings:
        $target = "DREAMFLYF722" ascii nocase
    condition:
        $target
}

rule DREAMWORKSF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DREAMWORKSF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DREA"
    strings:
        $target = "DREAMWORKSF722" ascii nocase
    condition:
        $target
}

rule DREAMWORKSF722AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DREAMWORKSF722AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DREA"
    strings:
        $target = "DREAMWORKSF722AIO" ascii nocase
    condition:
        $target
}

rule DREAMWORKSH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "DREAMWORKSH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DREA"
    strings:
        $target = "DREAMWORKSH743" ascii nocase
    condition:
        $target
}

rule DRONEERH743DUAL_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "DRONEERH743DUAL"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DRNR"
    strings:
        $target = "DRONEERH743DUAL" ascii nocase
    condition:
        $target
}

rule DRONIUSF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "DRONIUSF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FOSS"
    strings:
        $target = "DRONIUSF7" ascii nocase
    condition:
        $target
}

rule DYSF44530D_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "DYSF44530D"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DYST"
    strings:
        $target = "DYSF44530D" ascii nocase
    condition:
        $target
}

rule DYSF4PRO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "DYSF4PRO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DYST"
    strings:
        $target = "DYSF4PRO" ascii nocase
    condition:
        $target
}

rule EACHINEF411_AIO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "EACHINEF411_AIO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "EACH"
    strings:
        $target = "EACHINEF411_AIO" ascii nocase
    condition:
        $target
}

rule EACHINEF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "EACHINEF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "EACH"
    strings:
        $target = "EACHINEF722" ascii nocase
    condition:
        $target
}

rule EACHINEF722_AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "EACHINEF722_AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "EACH"
    strings:
        $target = "EACHINEF722_AIO" ascii nocase
    condition:
        $target
}

rule EAGLEF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "EAGLEF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "YYRC"
    strings:
        $target = "EAGLEF405" ascii nocase
    condition:
        $target
}

rule EAGLEF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "EAGLEF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "YYRC"
    strings:
        $target = "EAGLEF722" ascii nocase
    condition:
        $target
}

rule ELINF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "ELINF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DRCL"
    strings:
        $target = "ELINF405" ascii nocase
    condition:
        $target
}

rule ELINF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ELINF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DRCL"
    strings:
        $target = "ELINF722" ascii nocase
    condition:
        $target
}

rule ELLE0_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "ELLE0"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LEGA"
    strings:
        $target = "ELLE0" ascii nocase
    condition:
        $target
}

rule EMAX_BABYHAWK_II_HD_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "EMAX_BABYHAWK_II_HD"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "EMAX"
    strings:
        $target = "EMAX_BABYHAWK_II_HD" ascii nocase
    condition:
        $target
}

rule EMAX_F405_ELRS_AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "EMAX_F405_ELRS_AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "EMAX"
    strings:
        $target = "EMAX_F405_ELRS_AIO" ascii nocase
    condition:
        $target
}

rule EMAX_TINYHAWK_F411RX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "EMAX_TINYHAWK_F411RX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "EMAX"
    strings:
        $target = "EMAX_TINYHAWK_F411RX" ascii nocase
    condition:
        $target
}

rule EMAX_TINYHAWKF4SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "EMAX_TINYHAWKF4SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "EMAX"
    strings:
        $target = "EMAX_TINYHAWKF4SX1280" ascii nocase
    condition:
        $target
}

rule EXF722DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "EXF722DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "EXUA"
    strings:
        $target = "EXF722DUAL" ascii nocase
    condition:
        $target
}

rule EXUAVF4PRO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "EXUAVF4PRO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "EXUA"
    strings:
        $target = "EXUAVF4PRO" ascii nocase
    condition:
        $target
}

rule F4BY_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "F4BY"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FOSS"
    strings:
        $target = "F4BY" ascii nocase
    condition:
        $target
}

rule FENIX_F405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FENIX_F405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FOSS"
    strings:
        $target = "FENIX_F405" ascii nocase
    condition:
        $target
}

rule FF_FORTINIF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_FORTINIF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FFPV"
    strings:
        $target = "FF_FORTINIF4" ascii nocase
    condition:
        $target
}

rule FF_FORTINIF4_REV03_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_FORTINIF4_REV03"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FFPV"
    strings:
        $target = "FF_FORTINIF4_REV03" ascii nocase
    condition:
        $target
}

rule FF_PIKOF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_PIKOF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FFPV"
    strings:
        $target = "FF_PIKOF4" ascii nocase
    condition:
        $target
}

rule FF_PIKOF4OSD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_PIKOF4OSD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FFPV"
    strings:
        $target = "FF_PIKOF4OSD" ascii nocase
    condition:
        $target
}

rule FF_RACEPIT_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_RACEPIT"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FFPV"
    strings:
        $target = "FF_RACEPIT" ascii nocase
    condition:
        $target
}

rule FF_RACEPIT_MINI_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_RACEPIT_MINI"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FFPV"
    strings:
        $target = "FF_RACEPIT_MINI" ascii nocase
    condition:
        $target
}

rule FF_RACEPITF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_RACEPITF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FFPV"
    strings:
        $target = "FF_RACEPITF7" ascii nocase
    condition:
        $target
}

rule FF_RACEPITF7_MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FF_RACEPITF7_MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FFPV"
    strings:
        $target = "FF_RACEPITF7_MINI" ascii nocase
    condition:
        $target
}

rule FISHDRONEF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FISHDRONEF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LEGA"
    strings:
        $target = "FISHDRONEF4" ascii nocase
    condition:
        $target
}

rule FISHERMANF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FISHERMANF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FISM"
    strings:
        $target = "FISHERMANF405" ascii nocase
    condition:
        $target
}

rule FLAOF405X8_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLAOF405X8"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLAO"
    strings:
        $target = "FLAOF405X8" ascii nocase
    condition:
        $target
}

rule FLASHHOBBYF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLASHHOBBYF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLHB"
    strings:
        $target = "FLASHHOBBYF405" ascii nocase
    condition:
        $target
}

rule FLASHHOBBYF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLASHHOBBYF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLHB"
    strings:
        $target = "FLASHHOBBYF722" ascii nocase
    condition:
        $target
}

rule FLOWBOX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FLOWBOX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "NERC"
    strings:
        $target = "FLOWBOX" ascii nocase
    condition:
        $target
}

rule FLOWBOXV2_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FLOWBOXV2"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "NERC"
    strings:
        $target = "FLOWBOXV2" ascii nocase
    condition:
        $target
}

rule FLYCOLORF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF4" ascii nocase
    condition:
        $target
}

rule FLYCOLORF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF435" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF7" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7_AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF7_AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF7_AIO" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7_AIO_HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF7_AIO_HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF7_AIO_HD" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7MICRO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF7MICRO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF7MICRO" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF7MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF7MINI" ascii nocase
    condition:
        $target
}

rule FLYCOLORF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORF7V2" ascii nocase
    condition:
        $target
}

rule FLYCOLORH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYCOLORH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "FLCO"
    strings:
        $target = "FLYCOLORH743" ascii nocase
    condition:
        $target
}

rule FLYFISHRCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYFISHRCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FFRC"
    strings:
        $target = "FLYFISHRCF405" ascii nocase
    condition:
        $target
}

rule FLYSPARKF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYSPARKF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLYS"
    strings:
        $target = "FLYSPARKF4" ascii nocase
    condition:
        $target
}

rule FLYTEX405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYTEX405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLTE"
    strings:
        $target = "FLYTEX405V2" ascii nocase
    condition:
        $target
}

rule FLYWOOF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF405" ascii nocase
    condition:
        $target
}

rule FLYWOOF405NANO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF405NANO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF405NANO" ascii nocase
    condition:
        $target
}

rule FLYWOOF405PRO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF405PRO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF405PRO" ascii nocase
    condition:
        $target
}

rule FLYWOOF405S_AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF405S_AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF405S_AIO" ascii nocase
    condition:
        $target
}

rule FLYWOOF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF411" ascii nocase
    condition:
        $target
}

rule FLYWOOF411_5IN1_AIO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF411_5IN1_AIO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF411_5IN1_AIO" ascii nocase
    condition:
        $target
}

rule FLYWOOF411EVO_HD_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF411EVO_HD"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF411EVO_HD" ascii nocase
    condition:
        $target
}

rule FLYWOOF411HEX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF411HEX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF411HEX" ascii nocase
    condition:
        $target
}

rule FLYWOOF411V2_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF411V2"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF411V2" ascii nocase
    condition:
        $target
}

rule FLYWOOF722PRO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF722PRO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF722PRO" ascii nocase
    condition:
        $target
}

rule FLYWOOF722PROV2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF722PROV2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF722PROV2" ascii nocase
    condition:
        $target
}

rule FLYWOOF745_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF745"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF745" ascii nocase
    condition:
        $target
}

rule FLYWOOF745AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF745AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF745AIO" ascii nocase
    condition:
        $target
}

rule FLYWOOF745AIOV2_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF745AIOV2"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF745AIOV2" ascii nocase
    condition:
        $target
}

rule FLYWOOF745HEX_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF745HEX"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF745HEX" ascii nocase
    condition:
        $target
}

rule FLYWOOF745NANO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF745NANO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF745NANO" ascii nocase
    condition:
        $target
}

rule FLYWOOF7DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOF7DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOF7DUAL" ascii nocase
    condition:
        $target
}

rule FLYWOOH743PRO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "FLYWOOH743PRO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "FLWO"
    strings:
        $target = "FLYWOOH743PRO" ascii nocase
    condition:
        $target
}

rule FOSSF4ELRS_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FOSSF4ELRS"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "BEFH"
    strings:
        $target = "FOSSF4ELRS" ascii nocase
    condition:
        $target
}

rule FOXEERF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF405" ascii nocase
    condition:
        $target
}

rule FOXEERF405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF405V2" ascii nocase
    condition:
        $target
}

rule FOXEERF722DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF722DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF722DUAL" ascii nocase
    condition:
        $target
}

rule FOXEERF722V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF722V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF722V2" ascii nocase
    condition:
        $target
}

rule FOXEERF722V3_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF722V3"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF722V3" ascii nocase
    condition:
        $target
}

rule FOXEERF722V4_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF722V4"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF722V4" ascii nocase
    condition:
        $target
}

rule FOXEERF745_AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF745_AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF745_AIO" ascii nocase
    condition:
        $target
}

rule FOXEERF745V2_AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF745V2_AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF745V2_AIO" ascii nocase
    condition:
        $target
}

rule FOXEERF745V3_AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF745V3_AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF745V3_AIO" ascii nocase
    condition:
        $target
}

rule FOXEERF745V4_AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERF745V4_AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERF745V4_AIO" ascii nocase
    condition:
        $target
}

rule FOXEERH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERH743" ascii nocase
    condition:
        $target
}

rule FOXEERH743V2_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "FOXEERH743V2"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "FOXE"
    strings:
        $target = "FOXEERH743V2" ascii nocase
    condition:
        $target
}

rule FPVCYCLEF401_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FPVCYCLEF401"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TURC"
    strings:
        $target = "FPVCYCLEF401" ascii nocase
    condition:
        $target
}

rule FPVM_BETAFLIGHTF7_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "FPVM_BETAFLIGHTF7"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "FPVM"
    strings:
        $target = "FPVM_BETAFLIGHTF7" ascii nocase
    condition:
        $target
}

rule FREEAXISF4_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "FREEAXISF4"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "CLNE"
    strings:
        $target = "FREEAXISF4" ascii nocase
    condition:
        $target
}

rule FRSKYF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FRSKYF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FRSK"
    strings:
        $target = "FRSKYF4" ascii nocase
    condition:
        $target
}

rule FURYF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FURYF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DIAT"
    strings:
        $target = "FURYF4" ascii nocase
    condition:
        $target
}

rule FURYF4OSD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "FURYF4OSD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DIAT"
    strings:
        $target = "FURYF4OSD" ascii nocase
    condition:
        $target
}

rule GEELANGF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "GEELANGF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "GEEL"
    strings:
        $target = "GEELANGF411" ascii nocase
    condition:
        $target
}

rule GEMEF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "GEMEF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "GFPV"
    strings:
        $target = "GEMEF411" ascii nocase
    condition:
        $target
}

rule GEMEF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "GEMEF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "GFPV"
    strings:
        $target = "GEMEF722" ascii nocase
    condition:
        $target
}

rule GEP_F405_VTX_V3_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "GEP_F405_VTX_V3"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "GEPR"
    strings:
        $target = "GEP_F405_VTX_V3" ascii nocase
    condition:
        $target
}

rule GEPRC_F722_AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRC_F722_AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRC_F722_AIO" ascii nocase
    condition:
        $target
}

rule GEPRC_TAKER_F405AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRC_TAKER_F405AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRC_TAKER_F405AIO" ascii nocase
    condition:
        $target
}

rule GEPRC_TAKER_G473AIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRC_TAKER_G473AIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRC_TAKER_G473AIO" ascii nocase
    condition:
        $target
}

rule GEPRC_TAKER_H743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRC_TAKER_H743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRC_TAKER_H743" ascii nocase
    condition:
        $target
}

rule GEPRC_TAKER_H743MINI_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRC_TAKER_H743MINI"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRC_TAKER_H743MINI" ascii nocase
    condition:
        $target
}

rule GEPRCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF405" ascii nocase
    condition:
        $target
}

rule GEPRCF405_BT_HD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF405_BT_HD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF405_BT_HD" ascii nocase
    condition:
        $target
}

rule GEPRCF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF411" ascii nocase
    condition:
        $target
}

rule GEPRCF411_AIO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF411_AIO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF411_AIO" ascii nocase
    condition:
        $target
}

rule GEPRCF411_PRO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF411_PRO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF411_PRO" ascii nocase
    condition:
        $target
}

rule GEPRCF411SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF411SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF411SX1280" ascii nocase
    condition:
        $target
}

rule GEPRCF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF722" ascii nocase
    condition:
        $target
}

rule GEPRCF722_BT_HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF722_BT_HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF722_BT_HD" ascii nocase
    condition:
        $target
}

rule GEPRCF722_BT_HD_V3_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF722_BT_HD_V3"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF722_BT_HD_V3" ascii nocase
    condition:
        $target
}

rule GEPRCF722BT_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF722BT"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF722BT" ascii nocase
    condition:
        $target
}

rule GEPRCF745_BT_HD_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCF745_BT_HD"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCF745_BT_HD" ascii nocase
    condition:
        $target
}

rule GEPRCG4AIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "GEPRCG4AIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "GEPR"
    strings:
        $target = "GEPRCG4AIO" ascii nocase
    condition:
        $target
}

rule GRAVITYF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "GRAVITYF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "FLMO"
    strings:
        $target = "GRAVITYF7" ascii nocase
    condition:
        $target
}

rule GREATMOUNTAINF435_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "GREATMOUNTAINF435"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "GMRC"
    strings:
        $target = "GREATMOUNTAINF435" ascii nocase
    condition:
        $target
}

rule HAKRCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF405" ascii nocase
    condition:
        $target
}

rule HAKRCF405D_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF405D"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF405D" ascii nocase
    condition:
        $target
}

rule HAKRCF405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF405V2" ascii nocase
    condition:
        $target
}

rule HAKRCF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF411" ascii nocase
    condition:
        $target
}

rule HAKRCF411D_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF411D"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF411D" ascii nocase
    condition:
        $target
}

rule HAKRCF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF722" ascii nocase
    condition:
        $target
}

rule HAKRCF722D_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF722D"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF722D" ascii nocase
    condition:
        $target
}

rule HAKRCF722MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF722MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF722MINI" ascii nocase
    condition:
        $target
}

rule HAKRCF722V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF722V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF722V2" ascii nocase
    condition:
        $target
}

rule HAKRCF7230D_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCF7230D"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCF7230D" ascii nocase
    condition:
        $target
}

rule HAKRCH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "HAKRCH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HARC"
    strings:
        $target = "HAKRCH743" ascii nocase
    condition:
        $target
}

rule HDZERO_AIO15_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "HDZERO_AIO15"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "HDZO"
    strings:
        $target = "HDZERO_AIO15" ascii nocase
    condition:
        $target
}

rule HDZERO_GAMMA_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "HDZERO_GAMMA"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "HDZO"
    strings:
        $target = "HDZERO_GAMMA" ascii nocase
    condition:
        $target
}

rule HDZERO_HALO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "HDZERO_HALO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HDZO"
    strings:
        $target = "HDZERO_HALO" ascii nocase
    condition:
        $target
}

rule HELLBENDER_0001_RP2350B {
    meta:
        detection_source = "betaflight-target"
        target = "HELLBENDER_0001"
        api_mcu = "RP2350B"
        chipset = "RP2350B"
        manufacturer = "RASP"
    strings:
        $target = "HELLBENDER_0001" ascii nocase
    condition:
        $target
}

rule HELSEL_STRIKERF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HELSEL_STRIKERF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIRB"
    strings:
        $target = "HELSEL_STRIKERF7" ascii nocase
    condition:
        $target
}

rule HGLRC_F405_S_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRC_F405_S"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRC_F405_S" ascii nocase
    condition:
        $target
}

rule HGLRC_H743_LITE_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRC_H743_LITE"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRC_H743_LITE" ascii nocase
    condition:
        $target
}

rule HGLRCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF405" ascii nocase
    condition:
        $target
}

rule HGLRCF405AS_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF405AS"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF405AS" ascii nocase
    condition:
        $target
}

rule HGLRCF405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF405V2" ascii nocase
    condition:
        $target
}

rule HGLRCF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF411" ascii nocase
    condition:
        $target
}

rule HGLRCF411ELRS_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF411ELRS"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF411ELRS" ascii nocase
    condition:
        $target
}

rule HGLRCF411SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF411SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF411SX1280" ascii nocase
    condition:
        $target
}

rule HGLRCF411SX1280_15A_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF411SX1280_15A"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF411SX1280_15A" ascii nocase
    condition:
        $target
}

rule HGLRCF411SX1280V2_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF411SX1280V2"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF411SX1280V2" ascii nocase
    condition:
        $target
}

rule HGLRCF435_AIO_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF435_AIO"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF435_AIO" ascii nocase
    condition:
        $target
}

rule HGLRCF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF722" ascii nocase
    condition:
        $target
}

rule HGLRCF722AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF722AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF722AIO" ascii nocase
    condition:
        $target
}

rule HGLRCF722AIO_X6_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF722AIO_X6"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF722AIO_X6" ascii nocase
    condition:
        $target
}

rule HGLRCF722AIOV2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF722AIOV2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF722AIOV2" ascii nocase
    condition:
        $target
}

rule HGLRCF722E_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF722E"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF722E" ascii nocase
    condition:
        $target
}

rule HGLRCF722MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF722MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF722MINI" ascii nocase
    condition:
        $target
}

rule HGLRCF722MINIV2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF722MINIV2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF722MINIV2" ascii nocase
    condition:
        $target
}

rule HGLRCF745_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "HGLRCF745"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "HGLR"
    strings:
        $target = "HGLRCF745" ascii nocase
    condition:
        $target
}

rule HIFIONRCF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HIFIONRCF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HFOR"
    strings:
        $target = "HIFIONRCF7" ascii nocase
    condition:
        $target
}

rule HOBBYWING_XROTORF4G3_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "HOBBYWING_XROTORF4G3"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HOWI"
    strings:
        $target = "HOBBYWING_XROTORF4G3" ascii nocase
    condition:
        $target
}

rule HOBBYWING_XROTORF7CONV_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HOBBYWING_XROTORF7CONV"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HOWI"
    strings:
        $target = "HOBBYWING_XROTORF7CONV" ascii nocase
    condition:
        $target
}

rule HOBBYWING_XROTORF7CONV2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HOBBYWING_XROTORF7CONV2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HOWI"
    strings:
        $target = "HOBBYWING_XROTORF7CONV2" ascii nocase
    condition:
        $target
}

rule HUMMINGBIRD_200RS_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "HUMMINGBIRD_200RS"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "HBRD"
    strings:
        $target = "HUMMINGBIRD_200RS" ascii nocase
    condition:
        $target
}

rule HUMMINGBIRD_AIO255_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "HUMMINGBIRD_AIO255"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "HBRD"
    strings:
        $target = "HUMMINGBIRD_AIO255" ascii nocase
    condition:
        $target
}

rule HUMMINGBIRD_FC305_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "HUMMINGBIRD_FC305"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HBRD"
    strings:
        $target = "HUMMINGBIRD_FC305" ascii nocase
    condition:
        $target
}

rule HWH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "HWH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HOWI"
    strings:
        $target = "HWH7" ascii nocase
    condition:
        $target
}

rule HYBRIDG4_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "HYBRIDG4"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "NERC"
    strings:
        $target = "HYBRIDG4" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_F405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_F405" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F411RX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_F411RX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_F411RX" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_F435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_F435" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F7_AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_F7_AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_F7_AIO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F7_PRO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_F7_PRO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_F7_PRO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_F722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_F722" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_F722_X1_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_F722_X1"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_F722_X1" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BLITZ_H7_PRO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BLITZ_H7_PRO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BLITZ_H7_PRO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_BORG_F435S_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_BORG_F435S"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_BORG_F435S" ascii nocase
    condition:
        $target
}

rule IFLIGHT_DEFENDER_F411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_DEFENDER_F411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_DEFENDER_F411" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F405_AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F405_AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F405_AIO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F405_TWING_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F405_TWING"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F405_TWING" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F411_AIO32_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F411_AIO32"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F411_AIO32" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F411_PRO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F411_PRO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F411_PRO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F4SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F4SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F4SX1280" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F722_TWING_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F722_TWING"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F722_TWING" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F745_AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F745_AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F745_AIO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_F745_AIO_V2_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_F745_AIO_V2"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_F745_AIO_V2" ascii nocase
    condition:
        $target
}

rule IFLIGHT_H7_TWING_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_H7_TWING"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_H7_TWING" ascii nocase
    condition:
        $target
}

rule IFLIGHT_H743_AIO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_H743_AIO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_H743_AIO" ascii nocase
    condition:
        $target
}

rule IFLIGHT_H743_AIO_V2_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_H743_AIO_V2"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_H743_AIO_V2" ascii nocase
    condition:
        $target
}

rule IFLIGHT_SUCCEX_E_F4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_SUCCEX_E_F4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_SUCCEX_E_F4" ascii nocase
    condition:
        $target
}

rule IFLIGHT_SUCCEX_E_F7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "IFLIGHT_SUCCEX_E_F7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "IFLIGHT_SUCCEX_E_F7" ascii nocase
    condition:
        $target
}

rule JBF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "JBF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "JBF7" ascii nocase
    condition:
        $target
}

rule JBF7_DJI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "JBF7_DJI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "JBF7_DJI" ascii nocase
    condition:
        $target
}

rule JBF7_V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "JBF7_V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "IFRC"
    strings:
        $target = "JBF7_V2" ascii nocase
    condition:
        $target
}

rule JHEF405PRO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF405PRO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF405PRO" ascii nocase
    condition:
        $target
}

rule JHEF405WING_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF405WING"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF405WING" ascii nocase
    condition:
        $target
}

rule JHEF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF411" ascii nocase
    condition:
        $target
}

rule JHEF411HD_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF411HD"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF411HD" ascii nocase
    condition:
        $target
}

rule JHEF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF435" ascii nocase
    condition:
        $target
}

rule JHEF435PRO_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF435PRO"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF435PRO" ascii nocase
    condition:
        $target
}

rule JHEF722HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF722HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF722HD" ascii nocase
    condition:
        $target
}

rule JHEF722PRO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF722PRO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF722PRO" ascii nocase
    condition:
        $target
}

rule JHEF745_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF745"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF745" ascii nocase
    condition:
        $target
}

rule JHEF745V2_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF745V2"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF745V2" ascii nocase
    condition:
        $target
}

rule JHEF7DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEF7DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "JHEF"
    strings:
        $target = "JHEF7DUAL" ascii nocase
    condition:
        $target
}

rule JHEG474_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "JHEG474"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "JHEF"
    strings:
        $target = "JHEG474" ascii nocase
    condition:
        $target
}

rule JHEH743_AIO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEH743_AIO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "JHEF"
    strings:
        $target = "JHEH743_AIO" ascii nocase
    condition:
        $target
}

rule JHEH743_AIO_HD_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEH743_AIO_HD"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "JHEF"
    strings:
        $target = "JHEH743_AIO_HD" ascii nocase
    condition:
        $target
}

rule JHEH743_HD_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEH743_HD"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "JHEF"
    strings:
        $target = "JHEH743_HD" ascii nocase
    condition:
        $target
}

rule JHEH743PRO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "JHEH743PRO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "JHEF"
    strings:
        $target = "JHEH743PRO" ascii nocase
    condition:
        $target
}

rule JMIF722A_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "JMIF722A"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "JMI"
    strings:
        $target = "JMIF722A" ascii nocase
    condition:
        $target
}

rule KAKUTEF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF4" ascii nocase
    condition:
        $target
}

rule KAKUTEF4V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF4V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF4V2" ascii nocase
    condition:
        $target
}

rule KAKUTEF4WING_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF4WING"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF4WING" ascii nocase
    condition:
        $target
}

rule KAKUTEF7_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF7"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF7" ascii nocase
    condition:
        $target
}

rule KAKUTEF7HDV_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF7HDV"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF7HDV" ascii nocase
    condition:
        $target
}

rule KAKUTEF7MINI_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF7MINI"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF7MINI" ascii nocase
    condition:
        $target
}

rule KAKUTEF7MINIV3_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF7MINIV3"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF7MINIV3" ascii nocase
    condition:
        $target
}

rule KAKUTEF7V2_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEF7V2"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEF7V2" ascii nocase
    condition:
        $target
}

rule KAKUTEG4AIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEG4AIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEG4AIO" ascii nocase
    condition:
        $target
}

rule KAKUTEH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEH7" ascii nocase
    condition:
        $target
}

rule KAKUTEH7MINI_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEH7MINI"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEH7MINI" ascii nocase
    condition:
        $target
}

rule KAKUTEH7V2_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEH7V2"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEH7V2" ascii nocase
    condition:
        $target
}

rule KAKUTEH7WING_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "KAKUTEH7WING"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "HBRO"
    strings:
        $target = "KAKUTEH7WING" ascii nocase
    condition:
        $target
}

rule KD722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "KD722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HARC"
    strings:
        $target = "KD722" ascii nocase
    condition:
        $target
}

rule KIWIF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "KIWIF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLLF"
    strings:
        $target = "KIWIF4" ascii nocase
    condition:
        $target
}

rule KIWIF4V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "KIWIF4V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLLF"
    strings:
        $target = "KIWIF4V2" ascii nocase
    condition:
        $target
}

rule KONEXH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "KONEXH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "KONX"
    strings:
        $target = "KONEXH743" ascii nocase
    condition:
        $target
}

rule KROOZX_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "KROOZX"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LEGA"
    strings:
        $target = "KROOZX" ascii nocase
    condition:
        $target
}

rule LDARC_F411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "LDARC_F411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "LDAR"
    strings:
        $target = "LDARC_F411" ascii nocase
    condition:
        $target
}

rule LUXAIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "LUXAIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "LMNR"
    strings:
        $target = "LUXAIO" ascii nocase
    condition:
        $target
}

rule LUXF4OSD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "LUXF4OSD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LMNR"
    strings:
        $target = "LUXF4OSD" ascii nocase
    condition:
        $target
}

rule LUXF7HDV_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "LUXF7HDV"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "LMNR"
    strings:
        $target = "LUXF7HDV" ascii nocase
    condition:
        $target
}

rule LUXH743NDAA_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "LUXH743NDAA"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "LMNR"
    strings:
        $target = "LUXH743NDAA" ascii nocase
    condition:
        $target
}

rule LUXHDAIO_G4_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "LUXHDAIO-G4"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "LMNR"
    strings:
        $target = "LUXHDAIO-G4" ascii nocase
    condition:
        $target
}

rule LUXMICROAIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "LUXMICROAIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "LMNR"
    strings:
        $target = "LUXMICROAIO" ascii nocase
    condition:
        $target
}

rule LUXMINIF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "LUXMINIF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "LMNR"
    strings:
        $target = "LUXMINIF7" ascii nocase
    condition:
        $target
}

rule MADFLIGHT_FC3_RP2350B {
    meta:
        detection_source = "betaflight-target"
        target = "MADFLIGHT_FC3"
        api_mcu = "RP2350B"
        chipset = "RP2350B"
        manufacturer = "MADF"
    strings:
        $target = "MADFLIGHT_FC3" ascii nocase
    condition:
        $target
}

rule MAMBAF405_2022A_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF405_2022A"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF405_2022A" ascii nocase
    condition:
        $target
}

rule MAMBAF405_2022B_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF405_2022B"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF405_2022B" ascii nocase
    condition:
        $target
}

rule MAMBAF405US_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF405US"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF405US" ascii nocase
    condition:
        $target
}

rule MAMBAF405US_I2C_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF405US_I2C"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF405US_I2C" ascii nocase
    condition:
        $target
}

rule MAMBAF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF411" ascii nocase
    condition:
        $target
}

rule MAMBAF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF722" ascii nocase
    condition:
        $target
}

rule MAMBAF722_2022A_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF722_2022A"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF722_2022A" ascii nocase
    condition:
        $target
}

rule MAMBAF722_2022B_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF722_2022B"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF722_2022B" ascii nocase
    condition:
        $target
}

rule MAMBAF722_I2C_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF722_I2C"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF722_I2C" ascii nocase
    condition:
        $target
}

rule MAMBAF722_X8_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAF722_X8"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAF722_X8" ascii nocase
    condition:
        $target
}

rule MAMBAG4_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAG4"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAG4" ascii nocase
    condition:
        $target
}

rule MAMBAH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAH743" ascii nocase
    condition:
        $target
}

rule MAMBAH743_2022B_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "MAMBAH743_2022B"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "DIAT"
    strings:
        $target = "MAMBAH743_2022B" ascii nocase
    condition:
        $target
}

rule MATEKF405AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405AIO" ascii nocase
    condition:
        $target
}

rule MATEKF405CTR_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405CTR"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405CTR" ascii nocase
    condition:
        $target
}

rule MATEKF405MINI_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405MINI"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405MINI" ascii nocase
    condition:
        $target
}

rule MATEKF405SE_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405SE"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405SE" ascii nocase
    condition:
        $target
}

rule MATEKF405STD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405STD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405STD" ascii nocase
    condition:
        $target
}

rule MATEKF405STD_CLONE_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405STD_CLONE"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CLNE"
    strings:
        $target = "MATEKF405STD_CLONE" ascii nocase
    condition:
        $target
}

rule MATEKF405TE_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405TE"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405TE" ascii nocase
    condition:
        $target
}

rule MATEKF405TE_SD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405TE_SD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405TE_SD" ascii nocase
    condition:
        $target
}

rule MATEKF405WINGV2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF405WINGV2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF405WINGV2" ascii nocase
    condition:
        $target
}

rule MATEKF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF411" ascii nocase
    condition:
        $target
}

rule MATEKF411RX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF411RX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF411RX" ascii nocase
    condition:
        $target
}

rule MATEKF411SE_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF411SE"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF411SE" ascii nocase
    condition:
        $target
}

rule MATEKF411WTE_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF411WTE"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF411WTE" ascii nocase
    condition:
        $target
}

rule MATEKF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF722" ascii nocase
    condition:
        $target
}

rule MATEKF722HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF722HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF722HD" ascii nocase
    condition:
        $target
}

rule MATEKF722MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF722MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF722MINI" ascii nocase
    condition:
        $target
}

rule MATEKF722SE_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKF722SE"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKF722SE" ascii nocase
    condition:
        $target
}

rule MATEKH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "MATEKH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "MTKS"
    strings:
        $target = "MATEKH743" ascii nocase
    condition:
        $target
}

rule MEPS411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MEPS411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "MEPS"
    strings:
        $target = "MEPS411" ascii nocase
    condition:
        $target
}

rule MEPSF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MEPSF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "MEPS"
    strings:
        $target = "MEPSF411" ascii nocase
    condition:
        $target
}

rule MEPSF4SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "MEPSF4SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "MEPS"
    strings:
        $target = "MEPSF4SX1280" ascii nocase
    condition:
        $target
}

rule MERAKRCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MERAKRCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MERA"
    strings:
        $target = "MERAKRCF405" ascii nocase
    condition:
        $target
}

rule MERAKRCF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "MERAKRCF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "MERA"
    strings:
        $target = "MERAKRCF722" ascii nocase
    condition:
        $target
}

rule MERCURYG4_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "MERCURYG4"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "ANYL"
    strings:
        $target = "MERCURYG4" ascii nocase
    condition:
        $target
}

rule MICOAIR405MINI_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MICOAIR405MINI"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MICO"
    strings:
        $target = "MICOAIR405MINI" ascii nocase
    condition:
        $target
}

rule MICOAIR743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "MICOAIR743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "MICO"
    strings:
        $target = "MICOAIR743" ascii nocase
    condition:
        $target
}

rule MINI_H743_HD_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "MINI_H743_HD"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "RAST"
    strings:
        $target = "MINI_H743_HD" ascii nocase
    condition:
        $target
}

rule MLTEMPF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MLTEMPF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MOLA"
    strings:
        $target = "MLTEMPF4" ascii nocase
    condition:
        $target
}

rule MLTYPHF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MLTYPHF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "MOLA"
    strings:
        $target = "MLTYPHF4" ascii nocase
    condition:
        $target
}

rule MODULARF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "MODULARF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "TACO"
    strings:
        $target = "MODULARF4" ascii nocase
    condition:
        $target
}

rule NAMIMNOF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "NAMIMNOF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "NAMO"
    strings:
        $target = "NAMIMNOF722" ascii nocase
    condition:
        $target
}

rule NBD_CRICKETF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_CRICKETF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_CRICKETF7" ascii nocase
    condition:
        $target
}

rule NBD_CRICKETF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_CRICKETF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_CRICKETF7V2" ascii nocase
    condition:
        $target
}

rule NBD_GALAXYAIO255_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_GALAXYAIO255"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_GALAXYAIO255" ascii nocase
    condition:
        $target
}

rule NBD_INFINITY200RS_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_INFINITY200RS"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_INFINITY200RS" ascii nocase
    condition:
        $target
}

rule NBD_INFINITYAIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_INFINITYAIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_INFINITYAIO" ascii nocase
    condition:
        $target
}

rule NBD_INFINITYAIO255_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_INFINITYAIO255"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_INFINITYAIO255" ascii nocase
    condition:
        $target
}

rule NBD_INFINITYAIOV2_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_INFINITYAIOV2"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_INFINITYAIOV2" ascii nocase
    condition:
        $target
}

rule NBD_INFINITYAIOV2PRO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_INFINITYAIOV2PRO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_INFINITYAIOV2PRO" ascii nocase
    condition:
        $target
}

rule NBD_INFINITYF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "NBD_INFINITYF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "NEBD"
    strings:
        $target = "NBD_INFINITYF4" ascii nocase
    condition:
        $target
}

rule NERO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "NERO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "BKMN"
    strings:
        $target = "NERO" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF407_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF407"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF407" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF411AIO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF411AIO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF411AIO" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF411SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF411SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF411SX1280" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF435" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF435MINI_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF435MINI"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF435MINI" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF435SE_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF435SE"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF435SE" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF722AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF722AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF722AIO" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF745_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF745"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF745" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF745VTX_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF745VTX"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF745VTX" ascii nocase
    condition:
        $target
}

rule NEUTRONRCF7AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCF7AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCF7AIO" ascii nocase
    condition:
        $target
}

rule NEUTRONRCG4AIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCG4AIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCG4AIO" ascii nocase
    condition:
        $target
}

rule NEUTRONRCH743AIO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCH743AIO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCH743AIO" ascii nocase
    condition:
        $target
}

rule NEUTRONRCH7BT_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "NEUTRONRCH7BT"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "NERC"
    strings:
        $target = "NEUTRONRCH7BT" ascii nocase
    condition:
        $target
}

rule NIDICI_F4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "NIDICI_F4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HNEC"
    strings:
        $target = "NIDICI_F4" ascii nocase
    condition:
        $target
}

rule NOX_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "NOX"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "AIRB"
    strings:
        $target = "NOX" ascii nocase
    condition:
        $target
}

rule NUCLEOF446_STM32F446 {
    meta:
        detection_source = "betaflight-target"
        target = "NUCLEOF446"
        api_mcu = "STM32F446"
        chipset = "STM32F446"
        manufacturer = "STMI"
    strings:
        $target = "NUCLEOF446" ascii nocase
    condition:
        $target
}

rule NUCLEOF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "NUCLEOF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "STMI"
    strings:
        $target = "NUCLEOF722" ascii nocase
    condition:
        $target
}

rule NUCLEOG474_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "NUCLEOG474"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "STMI"
    strings:
        $target = "NUCLEOG474" ascii nocase
    condition:
        $target
}

rule ODDITYRCF7AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ODDITYRCF7AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "ODTY"
    strings:
        $target = "ODDITYRCF7AIO" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF4" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4FW_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF4FW"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF4FW" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4NANO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF4NANO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF4NANO" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4NANOV7_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF4NANOV7"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF4NANOV7" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4SD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF4SD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF4SD" ascii nocase
    condition:
        $target
}

rule OMNIBUSF4V6_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF4V6"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF4V6" ascii nocase
    condition:
        $target
}

rule OMNIBUSF7_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF7"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF7" ascii nocase
    condition:
        $target
}

rule OMNIBUSF7NANOV7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF7NANOV7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF7NANOV7" ascii nocase
    condition:
        $target
}

rule OMNIBUSF7V2_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNIBUSF7V2"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "AIRB"
    strings:
        $target = "OMNIBUSF7V2" ascii nocase
    condition:
        $target
}

rule OMNINXT4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNINXT4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "AIRB"
    strings:
        $target = "OMNINXT4" ascii nocase
    condition:
        $target
}

rule OMNINXT7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "OMNINXT7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "AIRB"
    strings:
        $target = "OMNINXT7" ascii nocase
    condition:
        $target
}

rule ORBITF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "ORBITF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "ORBT"
    strings:
        $target = "ORBITF435" ascii nocase
    condition:
        $target
}

rule ORQAF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ORQAF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "ORQA"
    strings:
        $target = "ORQAF7" ascii nocase
    condition:
        $target
}

rule OXBOTF43512AAIO_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "OXBOTF43512AAIO"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "OXBT"
    strings:
        $target = "OXBOTF43512AAIO" ascii nocase
    condition:
        $target
}

rule PICO2_2350A_RP2350A {
    meta:
        detection_source = "betaflight-target"
        target = "PICO2_2350A"
        api_mcu = "RP2350A"
        chipset = "RP2350A"
        manufacturer = "RASP"
    strings:
        $target = "PICO2_2350A" ascii nocase
    condition:
        $target
}

rule PIRXF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "PIRXF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LEGA"
    strings:
        $target = "PIRXF4" ascii nocase
    condition:
        $target
}

rule PLUMF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "PLUMF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLLF"
    strings:
        $target = "PLUMF4" ascii nocase
    condition:
        $target
}

rule PODIUMF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "PODIUMF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LEGA"
    strings:
        $target = "PODIUMF4" ascii nocase
    condition:
        $target
}

rule PODRACERAIO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "PODRACERAIO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TEBS"
    strings:
        $target = "PODRACERAIO" ascii nocase
    condition:
        $target
}

rule PRINCIPIOTF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "PRINCIPIOTF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "PRIN"
    strings:
        $target = "PRINCIPIOTF7" ascii nocase
    condition:
        $target
}

rule PRINCIPIOTH7PI_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "PRINCIPIOTH7PI"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "PRIN"
    strings:
        $target = "PRINCIPIOTH7PI" ascii nocase
    condition:
        $target
}

rule PYRODRONEF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "PYRODRONEF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "PYDR"
    strings:
        $target = "PYRODRONEF4" ascii nocase
    condition:
        $target
}

rule PYRODRONEF4PDB_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "PYRODRONEF4PDB"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "PYDR"
    strings:
        $target = "PYRODRONEF4PDB" ascii nocase
    condition:
        $target
}

rule PYRODRONEF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "PYRODRONEF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "PYDR"
    strings:
        $target = "PYRODRONEF7" ascii nocase
    condition:
        $target
}

rule RADIOLINKF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "RADIOLINKF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "RALI"
    strings:
        $target = "RADIOLINKF405" ascii nocase
    condition:
        $target
}

rule RADIOLINKF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "RADIOLINKF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RALI"
    strings:
        $target = "RADIOLINKF722" ascii nocase
    condition:
        $target
}

rule REVO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "REVO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "OPEN"
    strings:
        $target = "REVO" ascii nocase
    condition:
        $target
}

rule REVO_AT_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "REVO_AT"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "OPEN"
    strings:
        $target = "REVO_AT" ascii nocase
    condition:
        $target
}

rule REVOLT_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "REVOLT"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLON"
    strings:
        $target = "REVOLT" ascii nocase
    condition:
        $target
}

rule REVOLTOSD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "REVOLTOSD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FLON"
    strings:
        $target = "REVOLTOSD" ascii nocase
    condition:
        $target
}

rule REVONANO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "REVONANO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "OPEN"
    strings:
        $target = "REVONANO" ascii nocase
    condition:
        $target
}

rule RMNOVAH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "RMNOVAH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "RDMS"
    strings:
        $target = "RMNOVAH7" ascii nocase
    condition:
        $target
}

rule RPMENERGYF722HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "RPMENERGYF722HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "CUST"
    strings:
        $target = "RPMENERGYF722HD" ascii nocase
    condition:
        $target
}

rule RRIOT_F722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "RRIOT_F722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "EASP"
    strings:
        $target = "RRIOT_F722" ascii nocase
    condition:
        $target
}

rule RUSHCORE7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "RUSHCORE7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RUSH"
    strings:
        $target = "RUSHCORE7" ascii nocase
    condition:
        $target
}

rule RUSHF7AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "RUSHF7AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "RUSH"
    strings:
        $target = "RUSHF7AIO" ascii nocase
    condition:
        $target
}

rule RUSRACE_F4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "RUSRACE_F4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "CUST"
    strings:
        $target = "RUSRACE_F4" ascii nocase
    condition:
        $target
}

rule RUSRACE_F7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "RUSRACE_F7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "CUST"
    strings:
        $target = "RUSRACE_F7" ascii nocase
    condition:
        $target
}

rule SAKURAH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SAKURAH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SSAK"
    strings:
        $target = "SAKURAH743" ascii nocase
    condition:
        $target
}

rule SDMODELH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SDMODELH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SDRC"
    strings:
        $target = "SDMODELH7" ascii nocase
    condition:
        $target
}

rule SDMODELH7V1_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SDMODELH7V1"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SDRC"
    strings:
        $target = "SDMODELH7V1" ascii nocase
    condition:
        $target
}

rule SDMODELH7V2_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SDMODELH7V2"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SDRC"
    strings:
        $target = "SDMODELH7V2" ascii nocase
    condition:
        $target
}

rule SEQUREH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SEQUREH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SQRE"
    strings:
        $target = "SEQUREH7" ascii nocase
    condition:
        $target
}

rule SEQUREH7V2_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SEQUREH7V2"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SQRE"
    strings:
        $target = "SEQUREH7V2" ascii nocase
    condition:
        $target
}

rule SIMPLIFLYF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SIMPLIFLYF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SFLY"
    strings:
        $target = "SIMPLIFLYF405" ascii nocase
    condition:
        $target
}

rule SIMPLIFLYH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SIMPLIFLYH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SFLY"
    strings:
        $target = "SIMPLIFLYH7" ascii nocase
    condition:
        $target
}

rule SIRMIXALOT_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SIRMIXALOT"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "CUST"
    strings:
        $target = "SIRMIXALOT" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF405" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF405AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF405AIO" ascii nocase
    condition:
        $target
}

rule SKYSTARSF405V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF405V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF405V2" ascii nocase
    condition:
        $target
}

rule SKYSTARSF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF411" ascii nocase
    condition:
        $target
}

rule SKYSTARSF435_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF435"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF435" ascii nocase
    condition:
        $target
}

rule SKYSTARSF435PRO_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF435PRO"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF435PRO" ascii nocase
    condition:
        $target
}

rule SKYSTARSF7HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF7HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF7HD" ascii nocase
    condition:
        $target
}

rule SKYSTARSF7HDPRO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF7HDPRO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF7HDPRO" ascii nocase
    condition:
        $target
}

rule SKYSTARSF7RS_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSF7RS"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSF7RS" ascii nocase
    condition:
        $target
}

rule SKYSTARSH7HD_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYSTARSH7HD"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SKST"
    strings:
        $target = "SKYSTARSH7HD" ascii nocase
    condition:
        $target
}

rule SKYZONEF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SKYZONEF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SKZO"
    strings:
        $target = "SKYZONEF405" ascii nocase
    condition:
        $target
}

rule SOLOGOODF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SOLOGOODF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SLGD"
    strings:
        $target = "SOLOGOODF405" ascii nocase
    condition:
        $target
}

rule SOLOGOODF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SOLOGOODF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SLGD"
    strings:
        $target = "SOLOGOODF722" ascii nocase
    condition:
        $target
}

rule SOULF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SOULF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "DERC"
    strings:
        $target = "SOULF4" ascii nocase
    condition:
        $target
}

rule SPARKY2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPARKY2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FOSS"
    strings:
        $target = "SPARKY2" ascii nocase
    condition:
        $target
}

rule SPCMAKERF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "SPCMAKERF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "SPCM"
    strings:
        $target = "SPCMAKERF411" ascii nocase
    condition:
        $target
}

rule SPEDIXF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEDIXF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPDX"
    strings:
        $target = "SPEDIXF4" ascii nocase
    condition:
        $target
}

rule SPEDIXF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEDIXF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPDX"
    strings:
        $target = "SPEDIXF405" ascii nocase
    condition:
        $target
}

rule SPEDIXF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEDIXF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SPDX"
    strings:
        $target = "SPEDIXF722" ascii nocase
    condition:
        $target
}

rule SPEDIXFF722_STM32F722 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEDIXFF722"
        api_mcu = "STM32F722"
        chipset = "STM32F722"
        manufacturer = "SPDX"
    strings:
        $target = "SPEDIXFF722" ascii nocase
    condition:
        $target
}

rule SPEDIXG473_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "SPEDIXG473"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "SPDX"
    strings:
        $target = "SPEDIXG473" ascii nocase
    condition:
        $target
}

rule SPEDIXH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEDIXH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "SPDX"
    strings:
        $target = "SPEDIXH743" ascii nocase
    condition:
        $target
}

rule SPEEDYBEE_F745_AIO_STM32F745 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEE_F745_AIO"
        api_mcu = "STM32F745"
        chipset = "STM32F745"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEE_F745_AIO" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF4" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF405AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF405AIO" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405AIOV2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF405AIOV2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF405AIOV2" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405MINI_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF405MINI"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF405MINI" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405V3_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF405V3"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF405V3" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405V4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF405V4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF405V4" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405V5_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF405V5"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF405V5" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF405WING_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF405WING"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF405WING" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF435AIOELRS_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF435AIOELRS"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF435AIOELRS" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF7" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF7MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF7MINI" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7MINIV2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF7MINIV2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF7MINIV2" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF7V2" ascii nocase
    condition:
        $target
}

rule SPEEDYBEEF7V3_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SPEEDYBEEF7V3"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SPBE"
    strings:
        $target = "SPEEDYBEEF7V3" ascii nocase
    condition:
        $target
}

rule SPRACINGF4EVO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGF4EVO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGF4EVO" ascii nocase
    condition:
        $target
}

rule SPRACINGF4NEO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGF4NEO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGF4NEO" ascii nocase
    condition:
        $target
}

rule SPRACINGF7DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGF7DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGF7DUAL" ascii nocase
    condition:
        $target
}

rule SPRACINGH7EF_STM32H730 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGH7EF"
        api_mcu = "STM32H730"
        chipset = "STM32H730"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGH7EF" ascii nocase
    condition:
        $target
}

rule SPRACINGH7EVO_STM32H730 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGH7EVO"
        api_mcu = "STM32H730"
        chipset = "STM32H730"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGH7EVO" ascii nocase
    condition:
        $target
}

rule SPRACINGH7EXTREME_STM32H750 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGH7EXTREME"
        api_mcu = "STM32H750"
        chipset = "STM32H750"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGH7EXTREME" ascii nocase
    condition:
        $target
}

rule SPRACINGH7NANO_STM32H750 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGH7NANO"
        api_mcu = "STM32H750"
        chipset = "STM32H750"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGH7NANO" ascii nocase
    condition:
        $target
}

rule SPRACINGH7RF_STM32H730 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGH7RF"
        api_mcu = "STM32H730"
        chipset = "STM32H730"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGH7RF" ascii nocase
    condition:
        $target
}

rule SPRACINGH7ZERO_STM32H750 {
    meta:
        detection_source = "betaflight-target"
        target = "SPRACINGH7ZERO"
        api_mcu = "STM32H750"
        chipset = "STM32H750"
        manufacturer = "SPRO"
    strings:
        $target = "SPRACINGH7ZERO" ascii nocase
    condition:
        $target
}

rule STACKX_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "STACKX"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LEGA"
    strings:
        $target = "STACKX" ascii nocase
    condition:
        $target
}

rule STELLARF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "STELLARF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "STBE"
    strings:
        $target = "STELLARF4" ascii nocase
    condition:
        $target
}

rule STELLARF4V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "STELLARF4V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "STBE"
    strings:
        $target = "STELLARF4V2" ascii nocase
    condition:
        $target
}

rule STELLARF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "STELLARF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "STBE"
    strings:
        $target = "STELLARF7" ascii nocase
    condition:
        $target
}

rule STELLARF7_DUAL_HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "STELLARF7_DUAL_HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "STBE"
    strings:
        $target = "STELLARF7_DUAL_HD" ascii nocase
    condition:
        $target
}

rule STELLARF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "STELLARF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "STBE"
    strings:
        $target = "STELLARF7V2" ascii nocase
    condition:
        $target
}

rule STELLARH7DEV_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "STELLARH7DEV"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "STBE"
    strings:
        $target = "STELLARH7DEV" ascii nocase
    condition:
        $target
}

rule STELLARH7V2_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "STELLARH7V2"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "STBE"
    strings:
        $target = "STELLARH7V2" ascii nocase
    condition:
        $target
}

rule STM32F411DISCOVERY_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "STM32F411DISCOVERY"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "STMI"
    strings:
        $target = "STM32F411DISCOVERY" ascii nocase
    condition:
        $target
}

rule STM32F4DISCOVERY_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "STM32F4DISCOVERY"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "STMI"
    strings:
        $target = "STM32F4DISCOVERY" ascii nocase
    condition:
        $target
}

rule SUB250_REDFOX_G473AIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "SUB250_REDFOX_G473AIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "SU25"
    strings:
        $target = "SUB250_REDFOX_G473AIO" ascii nocase
    condition:
        $target
}

rule SUB250F411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "SUB250F411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "SU25"
    strings:
        $target = "SUB250F411" ascii nocase
    condition:
        $target
}

rule SUB250REDFOXF722AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "SUB250REDFOXF722AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "SU25"
    strings:
        $target = "SUB250REDFOXF722AIO" ascii nocase
    condition:
        $target
}

rule SYNERGYF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "SYNERGYF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "KLEE"
    strings:
        $target = "SYNERGYF4" ascii nocase
    condition:
        $target
}

rule TAKERF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TAKERF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "GEPR"
    strings:
        $target = "TAKERF411" ascii nocase
    condition:
        $target
}

rule TAKERF722SE_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TAKERF722SE"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "GEPR"
    strings:
        $target = "TAKERF722SE" ascii nocase
    condition:
        $target
}

rule TAKERG4AIO_STM32G47X {
    meta:
        detection_source = "betaflight-target"
        target = "TAKERG4AIO"
        api_mcu = "STM32G47X"
        chipset = "STM32G474"
        manufacturer = "GEPR"
    strings:
        $target = "TAKERG4AIO" ascii nocase
    condition:
        $target
}

rule TALONF4V2_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "TALONF4V2"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "HENA"
    strings:
        $target = "TALONF4V2" ascii nocase
    condition:
        $target
}

rule TALONF7DJIHD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TALONF7DJIHD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HENA"
    strings:
        $target = "TALONF7DJIHD" ascii nocase
    condition:
        $target
}

rule TALONF7FUSION_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TALONF7FUSION"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HENA"
    strings:
        $target = "TALONF7FUSION" ascii nocase
    condition:
        $target
}

rule TALONF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TALONF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HENA"
    strings:
        $target = "TALONF7V2" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_AIO_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "TBS_LUCID_AIO"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "TEBS"
    strings:
        $target = "TBS_LUCID_AIO" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_FC_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "TBS_LUCID_FC"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "TEBS"
    strings:
        $target = "TBS_LUCID_FC" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_H7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "TBS_LUCID_H7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "TEBS"
    strings:
        $target = "TBS_LUCID_H7" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_MOD_FC_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "TBS_LUCID_MOD_FC"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "TEBS"
    strings:
        $target = "TBS_LUCID_MOD_FC" ascii nocase
    condition:
        $target
}

rule TBS_LUCID_PRO_FC_AT32F435M {
    meta:
        detection_source = "betaflight-target"
        target = "TBS_LUCID_PRO_FC"
        api_mcu = "AT32F435M"
        chipset = "AT32F435M"
        manufacturer = "TEBS"
    strings:
        $target = "TBS_LUCID_PRO_FC" ascii nocase
    condition:
        $target
}

rule TCMM405V3_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "TCMM405V3"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "TCMM"
    strings:
        $target = "TCMM405V3" ascii nocase
    condition:
        $target
}

rule TCMMF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TCMMF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TCMM"
    strings:
        $target = "TCMMF411" ascii nocase
    condition:
        $target
}

rule TCMMF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TCMMF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TCMM"
    strings:
        $target = "TCMMF7" ascii nocase
    condition:
        $target
}

rule TINYHAWKF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TINYHAWKF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "EMAX"
    strings:
        $target = "TINYHAWKF411" ascii nocase
    condition:
        $target
}

rule TJRCH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "TJRCH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "TJRC"
    strings:
        $target = "TJRCH743" ascii nocase
    condition:
        $target
}

rule TMH7_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "TMH7"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "TMTR"
    strings:
        $target = "TMH7" ascii nocase
    condition:
        $target
}

rule TMOTORF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORF4" ascii nocase
    condition:
        $target
}

rule TMOTORF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORF411" ascii nocase
    condition:
        $target
}

rule TMOTORF4SX1280_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORF4SX1280"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORF4SX1280" ascii nocase
    condition:
        $target
}

rule TMOTORF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORF7" ascii nocase
    condition:
        $target
}

rule TMOTORF7_AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORF7_AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORF7_AIO" ascii nocase
    condition:
        $target
}

rule TMOTORF722SE_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORF722SE"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORF722SE" ascii nocase
    condition:
        $target
}

rule TMOTORF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORF7V2" ascii nocase
    condition:
        $target
}

rule TMOTORH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORH743" ascii nocase
    condition:
        $target
}

rule TMOTORVELOXF7SE_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORVELOXF7SE"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORVELOXF7SE" ascii nocase
    condition:
        $target
}

rule TMOTORVELOXF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMOTORVELOXF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMOTORVELOXF7V2" ascii nocase
    condition:
        $target
}

rule TMPACERF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMPACERF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMPACERF7" ascii nocase
    condition:
        $target
}

rule TMPACERF7MINI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMPACERF7MINI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMPACERF7MINI" ascii nocase
    condition:
        $target
}

rule TMVELOXF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TMVELOXF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TMTR"
    strings:
        $target = "TMVELOXF411" ascii nocase
    condition:
        $target
}

rule TMVELOXF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TMVELOXF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TMTR"
    strings:
        $target = "TMVELOXF7" ascii nocase
    condition:
        $target
}

rule TRANSTECF405HD_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "TRANSTECF405HD"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "TTRH"
    strings:
        $target = "TRANSTECF405HD" ascii nocase
    condition:
        $target
}

rule TRANSTECF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TRANSTECF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TTRH"
    strings:
        $target = "TRANSTECF411" ascii nocase
    condition:
        $target
}

rule TRANSTECF411AIO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TRANSTECF411AIO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TTRH"
    strings:
        $target = "TRANSTECF411AIO" ascii nocase
    condition:
        $target
}

rule TRANSTECF411HD_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TRANSTECF411HD"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TTRH"
    strings:
        $target = "TRANSTECF411HD" ascii nocase
    condition:
        $target
}

rule TRANSTECF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TRANSTECF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TTRH"
    strings:
        $target = "TRANSTECF7" ascii nocase
    condition:
        $target
}

rule TRANSTECF7HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "TRANSTECF7HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "TTRH"
    strings:
        $target = "TRANSTECF7HD" ascii nocase
    condition:
        $target
}

rule TUNERCF405_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "TUNERCF405"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "TURC"
    strings:
        $target = "TUNERCF405" ascii nocase
    condition:
        $target
}

rule TUNERCF411_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "TUNERCF411"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "TURC"
    strings:
        $target = "TUNERCF411" ascii nocase
    condition:
        $target
}

rule TUNERCF435_AT32F435G {
    meta:
        detection_source = "betaflight-target"
        target = "TUNERCF435"
        api_mcu = "AT32F435G"
        chipset = "AT32F435G"
        manufacturer = "TURC"
    strings:
        $target = "TUNERCF435" ascii nocase
    condition:
        $target
}

rule UAVPNG030MINI_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "UAVPNG030MINI"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "NGUA"
    strings:
        $target = "UAVPNG030MINI" ascii nocase
    condition:
        $target
}

rule VEKTORF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "VEKTORF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "PYID"
    strings:
        $target = "VEKTORF722" ascii nocase
    condition:
        $target
}

rule VGOODF722DUAL_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "VGOODF722DUAL"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "VGRC"
    strings:
        $target = "VGOODF722DUAL" ascii nocase
    condition:
        $target
}

rule VGOODRCF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "VGOODRCF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "VGRC"
    strings:
        $target = "VGOODRCF4" ascii nocase
    condition:
        $target
}

rule VGOODRCF405_DJI_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "VGOODRCF405_DJI"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "VGRC"
    strings:
        $target = "VGOODRCF405_DJI" ascii nocase
    condition:
        $target
}

rule VGOODRCF411_DJI_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "VGOODRCF411_DJI"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "VGRC"
    strings:
        $target = "VGOODRCF411_DJI" ascii nocase
    condition:
        $target
}

rule VGOODRCF722_DJI_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "VGOODRCF722_DJI"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "VGRC"
    strings:
        $target = "VGOODRCF722_DJI" ascii nocase
    condition:
        $target
}

rule VIVAF4AIO_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "VIVAF4AIO"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "VIVA"
    strings:
        $target = "VIVAF4AIO" ascii nocase
    condition:
        $target
}

rule VRRACE_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "VRRACE"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "LEGA"
    strings:
        $target = "VRRACE" ascii nocase
    condition:
        $target
}

rule VWING_F722AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "VWING_F722AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "VWIN"
    strings:
        $target = "VWING_F722AIO" ascii nocase
    condition:
        $target
}

rule WARPF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "WARPF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "ZERO"
    strings:
        $target = "WARPF7" ascii nocase
    condition:
        $target
}

rule WDIYF722_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "WDIYF722"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "WDIY"
    strings:
        $target = "WDIYF722" ascii nocase
    condition:
        $target
}

rule WDIYH743_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "WDIYH743"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "WDIY"
    strings:
        $target = "WDIYH743" ascii nocase
    condition:
        $target
}

rule WIZZF7HD_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "WIZZF7HD"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "WIZZ"
    strings:
        $target = "WIZZF7HD" ascii nocase
    condition:
        $target
}

rule WORMFC_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "WORMFC"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FOSS"
    strings:
        $target = "WORMFC" ascii nocase
    condition:
        $target
}

rule XILOF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "XILOF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "GEFP"
    strings:
        $target = "XILOF4" ascii nocase
    condition:
        $target
}

rule XRACERF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "XRACERF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "FPVM"
    strings:
        $target = "XRACERF4" ascii nocase
    condition:
        $target
}

rule YUPIF4_STM32F405 {
    meta:
        detection_source = "betaflight-target"
        target = "YUPIF4"
        api_mcu = "STM32F405"
        chipset = "STM32F405"
        manufacturer = "YUPF"
    strings:
        $target = "YUPIF4" ascii nocase
    condition:
        $target
}

rule YUPIF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "YUPIF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "YUPF"
    strings:
        $target = "YUPIF7" ascii nocase
    condition:
        $target
}

rule ZEEZF7_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEEZF7"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "ZEEZ"
    strings:
        $target = "ZEEZF7" ascii nocase
    condition:
        $target
}

rule ZEEZF7V2_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEEZF7V2"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "ZEEZ"
    strings:
        $target = "ZEEZF7V2" ascii nocase
    condition:
        $target
}

rule ZEEZF7V3_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEEZF7V3"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "ZEEZ"
    strings:
        $target = "ZEEZF7V3" ascii nocase
    condition:
        $target
}

rule ZEEZWHOOP_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEEZWHOOP"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "ZEEZ"
    strings:
        $target = "ZEEZWHOOP" ascii nocase
    condition:
        $target
}

rule ZEUSF4EVO_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEUSF4EVO"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HGLR"
    strings:
        $target = "ZEUSF4EVO" ascii nocase
    condition:
        $target
}

rule ZEUSF4FR_STM32F411 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEUSF4FR"
        api_mcu = "STM32F411"
        chipset = "STM32F411"
        manufacturer = "HGLR"
    strings:
        $target = "ZEUSF4FR" ascii nocase
    condition:
        $target
}

rule ZEUSF722_AIO_STM32F7X2 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEUSF722_AIO"
        api_mcu = "STM32F7X2"
        chipset = "STM32F722"
        manufacturer = "HGLR"
    strings:
        $target = "ZEUSF722_AIO" ascii nocase
    condition:
        $target
}

rule ZEX_ATHENA_MINI_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEX_ATHENA_MINI"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "ZEXM"
    strings:
        $target = "ZEX_ATHENA_MINI" ascii nocase
    condition:
        $target
}

rule ZEX_ATHENA_STD_PRO_STM32H743 {
    meta:
        detection_source = "betaflight-target"
        target = "ZEX_ATHENA_STD_PRO"
        api_mcu = "STM32H743"
        chipset = "STM32H743"
        manufacturer = "ZEXM"
    strings:
        $target = "ZEX_ATHENA_STD_PRO" ascii nocase
    condition:
        $target
}
