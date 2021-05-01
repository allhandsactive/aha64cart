## Simple64Cart: AHA Edition ##

This is a modified version of [Simple64Cart](https://github.com/go4retro/Simple64Cart) with the following changes.
* Moved ROM socket slightly to the left so it no longer is pushing up against the board edge
* Allow the use of 16k cart images.
* Allow select one of four 16k banks in the 64k ROM by changing A14 and A15 values via jumpers.


### Jumper Settings ###


##### A14/A15 #####

Jumpers A14 and A15  allow selecting one of four banks in the 64k ROM. This will allow you to program up to four ROM images in an select which one you wish to boot when the computer starts up.


|   Memory    | A14    | A15    |
| ------------|--------|--------|
|0x0000-0x3fff| closed | closed |
|0x4000-0x7fff| open   | closed |
|0x8000-0xbfff| closed | open   |
|0xC000-0xffff| open   | open   |



##### EXROM/GAME #####

These two jumpers /EXROM and /GAME control which memory mapping the C64 uses when mapping your ROM into memory.

There are 3 types of cartridges, 8k, 16k and Ultimax (16k). The two different 16k mappings place the upper 8k at different locations in memory. The main 16k mode will place it at 0xA000 overwriting the basic ROM and Ultimax mode will place it at 0xE000 overwriting the kernel ROM. The lower 8k is always mapped into 0x8000.

The Ultimax mapping is for compatibility with the Japanese Commodore "MAX" computers.


| Mapping                                       | /GAME  | /EXROM |
|-----------------------------------------------|--------|--------|
|  None                                         | open   | open   |
| 8k  (0x8000-0x9 fff)                          | open   | closed |
| 16k (Ultimax) (0x8000-0x9fff),(0xe000-0xffff) | closed | open   |
| 16k (0x8000-0x9fff),(0xa000-0xbfff)           | closed | closed |

