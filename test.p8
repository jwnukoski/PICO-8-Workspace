pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

-- Run INFO test.p8 to get accurate tokens.
#include ./utilities/log.lua
#include ./utilities/input.lua
#include ./utilities/color.lua
#include ./utilities/ascii.lua
#include ./utilities/cam.lua
#include ./utilities/screen.lua
#include ./test/collidable.lua
#include ./test/bullet.lua
#include ./test/upgrade.lua
#include ./test/star.lua
#include ./test/explosion.lua
#include ./test/enemies/meteor.lua
#include ./test/enemies/enemy.lua
#include ./test/enemies/small-ship.lua
#include ./test/player.lua
#include ./test/menus/health.lua
#include ./test/menus/weapon.lua
#include ./test/menus/time.lua
#include ./test/main.lua

__gfx__
00000000000330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000003dd3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700003663000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000037777300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700003bbbb300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007003bbbbbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003bb33bb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000393003930000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000900990090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001c0110c10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000001cccc100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000c01cc10c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000001c77c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000090000009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000c00010011001000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c10c001100c01c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000001cc1c1cc1c1cc1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000cc11cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000001c1cc1c1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000cc11cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000001c1cc1c1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c000cc11cc000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c01c1cc1c10c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cccc11cccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000001cc77cc1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000001c77c10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000c66c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006d0000000d005000000000000999999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d660000005d666000d00000099a9a9a9990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00065d6000d66666566666000099a9a9a9a9a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d56666d00066666666656d0099a9a9a9a9a9a900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56666665000566666656d66009a9a9a9a9a9a9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d65d65600000665d666d66669a9a9a9a9a9a9a990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00656600000006665656665699a9a9a9a9a9a9a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00066d00056066666d6665d59a9a9a9a9a9a9a990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000d6666666665666699a9a9a9a9a9a9a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000006666d665660669a9a9a9a9a9a9a990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000066d565d6600099a9a9a9a9a9a9a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000006d6d6d56666660099a9a9a9a9a9a900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000656666666d6d009a9a9a9a9a9a9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000066d6650666500009a9a9a9a9a99000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000056d66006d0000009a9a9a9a990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000d5d6000000000000999999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09aaaa90009999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaaaaa909aaaa900099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaaaaa909aaaa90009aa90000099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaaaaa909aaaa90009aa90000099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aaaaaa909aaaa900099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09aaaa90009999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cccc0000eeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ceeeec00ecccce00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ceeeeeececccccce0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ceecceececceecce0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ceecceececceecce0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ceeeeeececccccce0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ceeeec00ecccce00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00cccc0000eeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00888800002222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08222280022222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82222228222222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82288228222882220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82288228222882220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
82222228222222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08222280022222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00888800002222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000000000000000000000000000000820000000000000000000000000000008484000000000000000000000000000084840000000000000000000000000080828284840000000000000000000000008282848400000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
950e00001765000650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
171000000061000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
171000000062200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000018050260402f0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011400001515017150111500e1500c150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
942000001885000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
