# test_usb_stick_for_tv

This script stores test videos, music, and pictures on a USB stick.
The stick can then be used to test TVs or other media player devices.

## UHD / 4K Video + Wireless Headphones

To play UHD/4K video streams compressed with [H.265](https://en.wikipedia.org/wiki/High_Efficiency_Video_Coding), you will need:

* [1GB Network Interface](https://en.wikipedia.org/wiki/Gigabit_Ethernet)
* [802.11ax](https://en.wikipedia.org/wiki/IEEE_802.11ax) (Wi-Fi 6)
* Bluetooth for wireless headphones - [LDAC](https://en.wikipedia.org/wiki/LDAC_(codec))
* Bluetooth 5.0
* Install and test Kodi/Plex on an Android TV
* Raspberry Pi -> Kodi -> Audio Passthrough (AC3, E-AC3, DTS) - TV should be
  able to decode encoded audio sent through HDMI which saves CPU in RPi
* [20 TVs tested: Which sets can pass surround sound to a sound bar?](https://www.cnet.com/news/20-tvs-tested-which-sets-can-pass-surround-sound-to-a-sound-bar/)
* [HbbTV](https://en.wikipedia.org/wiki/Hybrid_Broadcast_Broadband_TV)
  * May apply only to some programs or be disabled
* Ultra HD Premium certification
* HDMI 2.1
* USB-C (USB 3.1 Gen1); note: [USB-C length](https://notebook.cz/clanky/technologie/2017/usb-3-1/usb-type-c-lenght.jpg)
* [HDR10+](https://en.wikipedia.org/wiki/High-dynamic-range_video)

## Tests

* Sintel: In the second chapter [01:43], change subtitles.
  The CZ and SK subtitles should load from an external file.

## Notes

* <http://kodi.wiki/view/Samples>
* <https://andytather.co.uk/Panda/VideoGalleryPage.aspx>

## TVs

* Sony, Sharp, Philips - Android TV (Sony KD-65ZD9)
* LG - WebOS (LG OLED55C6V)
* Samsung - Smart Hub and Tizen OS (Samsung UE49KU6452U)
* Panasonic - Firefox OS
