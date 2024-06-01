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
#include ./test/backgrounds/star.lua
#include ./test/backgrounds/cloud.lua
#include ./test/backgrounds/static.lua
#include ./test/explosion.lua
#include ./test/enemies/meteor.lua
#include ./test/enemies/enemy.lua
#include ./test/enemies/diver.lua
#include ./test/enemies/follower.lua
#include ./test/player.lua
#include ./test/menus/health.lua
#include ./test/menus/weapon.lua
#include ./test/menus/time.lua
#include ./test/menus/text.lua
#include ./test/levels/action.lua
#include ./test/levels/level.lua
#include ./test/levels/one.lua
#include ./test/levels/two.lua
#include ./test/main.lua

__gfx__
00000000000330000003000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000003dd300003d30000003d300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700003663000036300000036300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000037777300377730000377730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700003bbbb3003bbb300003bbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007003bbbbbb303bbbb0000bbbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003bb33bb303b3bb0000bb3b30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000393003930090390000930900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000900990090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001c0110c10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000001cccc100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000c01cc10c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000001c77c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001661000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000090000009000000009cccccc900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000c00010011001000c000cccc55cccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c10c001100c01c000ccc111111ccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000001cc1c1cc1c1cc100ccc1cccccc1ccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000cc11cc000000cc17c7777c71cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000001c1cc1c10000cc1cc766667cc1cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000cc11cc00000cc1c76766767c1cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000001c1cc1c10000951c7661c667c1590000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c000cc11cc000c0951c76611667c1590000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c01c1cc1c10c00cc1c76766767c1cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cccc11cccc000cc1cc766667cc1cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000001cc77cc100000cc1cc7777cc1cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000001c77c1000000ccc17cccc71ccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000c66c00000000ccc111111ccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000660000000000cccc55cccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000011000000000009cccccc900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006d0000000d005000000000000999999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d660000005d666000d00000099a9a9a9990000000000000000000000000000000000000000000666600000000000000000000000000000006666000000000
00065d6000d66666566666000099a9a9a9a9a9000000000066660000000000000000000000000066777766000000000000000000006066660066776000000000
0d56666d00066666666656d0099a9a9a9a9a9a900000006667766000000000000000000000660067777777660000000000000000006677760067776600000000
56666665000566666656d66009a9a9a9a9a9a9900006666777766600000066666660000006776667777776660000000000000000000666600066777600000000
d65d65600000665d666d66669a9a9a9a9a9a9a990066776677777660000667766766660006777767777667760000000666600000000006000006666600000000
00656600000006665656665699a9a9a9a9a9a9a90066776777777760066667777776760066677777777777660000066777666000000000000000000000000000
00066d00056066666d6665d59a9a9a9a9a9a9a990666677777777660067776777777766067777777777776000006667777776600000000000000000000000000
000000000d6666666665666699a9a9a9a9a9a9a90677677777776666067777777777776667777777777776660667777777776660000000000000000000000000
000000000006666d665660669a9a9a9a9a9a9a996777777777777776066677777777777667776667777777760666766777766760000000000000000000000000
00000000000066d565d6600099a9a9a9a9a9a9a96677777777777766677777777777777667767777767777760006667777767766000000066666660000000000
00000000006d6d6d56666660099a9a9a9a9a9a900666666666666660677777777777777666677777766777660666777777777766000006667777766000000000
00000000000656666666d6d009a9a9a9a9a9a9900000000000000000667776777777767600667777606776600677777766666660000666777777766000000000
0000000000066d6650666500009a9a9a9a9a99000000000000000000066767766667766600006666006660000666666600000000000066666666760000000000
00000000000056d66006d0000009a9a9a9a990000000000000000000006666660066660000000000000000000000000000000000000000006006660000000000
0000000000000d5d6000000000000999999000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000006000000000000000000000000000
00000000000000000000000000000000000000000006666000000000000000000000006600000000000000000000000000006000000000000000000000000000
00000000000000000000000000000000000000000067777600000000000600000000666000000006000000000000000000006000000000000000000000000000
00000000000000000000000000000000000000000006676000000000000000000000000000000006000000000060000000006000060006000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000006000060000060000000006000006060000000000000000000
00000000000000000000000000000000000000000666666600000000000000666600000000000000000060000060000000006000000600000000000000000000
00000000000000000000000000000000000000006677777660066660000006677666660000000000000060000060000000006000000000000000000000000000
00000000000000000000000000000000000000006677777760676776000667777777760000000000000060000000000000006000000000000000606000000000
00000000000000000000000000000000000000000666666660677760006677777667660000000000000060000000000000000000000000000000060000000000
00000000000000000000000000000000000000000000000000066600000666776666000000060000000060000000000000000000000000000000000000000000
00000000000000000000000000000000000000000006660000000000000006666000000000060000000060000000000600000000000000000000000000000000
00000000000000000000000000000000000000000067776000000000000000000000000000060000000000000000000600000000000000000000000000000000
00000000000000000000000000000000000000000006660000000000000666660000000000060000000000000000000600000000000000600060000000000000
00000000000000000000000000000000000000000000000000006600006677666600000000060000000000000000000000000000000006060606000000000000
00000000000000000000000000000000000000000000000000006760006666600660006000000000000000000000000000000060000000006000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000000
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088000000880000008800000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00828800008228000082280000882800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00822800008288000088280000822800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088000000880000008800000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000bb000000bb000000bb000000bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00b3bb0000b33b0000b33b0000bb3b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00b33b0000b3bb0000bb3b0000b33b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000bb000000bb000000bb000000bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001000000000000000000000000000000820000000000000000000000000000008484000000000000000000000000000084840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
950e00001765000650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
171000000061000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8f0f00000c62000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000018050260402f0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011400001515017150111500e1500c150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bf3c00000e45300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
