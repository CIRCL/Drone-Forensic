This folder contains tooling for analysing Flight Controller Firmware.

Work on ;
Betaflight
iNav

# Configuration extraction
Step 1 detect Operating system and Hardware from the chip dump.
```
$ yara yara/drones_firmwares.yara samples/sample 
DAKEFPVF722_STM32F7X2 samples/sample
INAV_FC samples/sample
```

Here we have a FC with a STM32F7 chipset running on INAV Flight controller.

Step 2, from the FC dump, we will extract the configuration.
$ ./src/inav_extract_flash.py -o flash ./samples/sample f722
Wrote 16384 bytes from 0x08004000 to flash (offset 0x4000 within the dump)

```
$ ./src/inav_extract_flash.py -o flash ./samples/sample f722
Wrote 16384 bytes from 0x08004000 to flash (offset 0x4000 within the dump)
```

Now we will extract the conf from the flash.

```
./src/inav_dump_config.py flash
....
Summary:
  Craft name : MK2
  Pilot name : VIKTOR
  Mission waypoints:
    WP01 WAYPOINT  lat +49.5359170, lon +5.8349934, alt 25.00 m
    WP02 WAYPOINT  lat +49.5371299, lon +5.8333518, alt 50.00 m
    WP03 WAYPOINT  lat +49.5386518, lon +5.8322395, alt 50.00 m
    WP04 WAYPOINT  lat +49.5402224, lon +5.8324374, alt 50.00 m
    WP05 WAYPOINT  lat +49.5415996, lon +5.8336908, alt 50.00 m
    WP06 WAYPOINT  lat +49.5424524, lon +5.8368470, alt 50.00 m
    WP07 WAYPOINT  lat +49.5373161, lon +5.8390343, alt 50.00 m
    WP08 JUMP      lat +0.0000000, lon +0.0000000, alt 0.00 m
    WP09 WAYPOINT  lat +49.5329472, lon +5.8433666, alt 50.00 m
    WP10 WAYPOINT  lat +49.5324095, lon +5.8421558, alt 50.00 m
    WP11 WAYPOINT  lat +49.5320519, lon +5.8412199, alt 50.00 m
    WP12 WAYPOINT  lat +49.5310903, lon +5.8399956, alt 50.00 m
    WP13 WAYPOINT  lat +49.5317409, lon +5.8376345, alt 50.00 m
    WP14 WAYPOINT  lat +49.5335528, lon +5.8351775, alt 50.00 m
    WP15 WAYPOINT  lat +49.5356726, lon +5.8358011, alt 50.00 m
GPX export : waypoints.gpx
``
