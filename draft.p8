pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()

	create_p1()
	gas = 200
 to_print = ""
end

function _update()
 
 mouv_p1()
 
 flag_collision()
 
	empty()
 
	retry()
end

function _draw()
	cls()
	map(0, 0, 0, 0, 128, 64)
	print (gas)
	draw_p1()
	
	draw_empty()
	
	draw_fillgas()
	
	game_over()
	
end 
-->8
-- mouvement joueur


function create_p1()
	p1 = {
		x=0, 
		y=12, 
		sprite=2} 
end


function draw_p1()
	
spr (p1.sprite, p1.x*8, p1.y*8)
end


function mouv_p1()

newx=p1.x
newy=p1.y

	if (btn(⬆️)) then 
	newy-=1
	p1.sprite = 1
	end
	
	if (btn(⬇️)) then
	newy+=1
	p1.sprite = 3
	end
	
	if (btn(➡️)) then
	newx+=1
	p1.sprite = 2
	end
	
	if (btn(⬅️)) then
	newx-=1
	p1.sprite = 4
	end
end
	--to_print = check_flag(0, newx, newy)
	
	
function flag_collision()	


	if not check_flag(0, newx, newy) then
		p1.x=mid(0,newx,127)
		p1.y=mid(0,newy,63)
	
	end
end

-->8
--jauge essence


function empty()
	if (btn(⬆️)) gas-=5
	if (btn(⬇️)) gas-=5
	if (btn(➡️)) gas-=5
	if (btn(⬅️)) gas-=5
end

function draw_empty()
	spr (16, 1, 1, 2, 2)
		if (gas<180) then 
			spr (18, 1, 1, 2, 2)		
				if (gas<150) then 
					spr (20, 1, 1, 2, 2)
						if (gas<120) then 
							spr (22, 1, 1, 2, 2)
						 	if (gas<90) then 
							  spr (24, 1, 1, 2, 2)
							 	 if (gas<60) then 
							  		spr (26, 1, 1, 2, 2)
							  			if (gas<35) then 
							  				spr (28, 1, 1, 2, 2)
										  	if (gas<0) then           
             	spr (30, 1, 1, 2, 2)
													end           
           	end        
	        	end     
		     	end
		   	end
		 	end
		end
end

function next_tile(x,y)
	local sprite=mget(x,y)
	mset(x,y,sprite+1)
end

function draw_fillgas()

-- if check flag (3)
-- => remplacer le spr essence par spr route
-- => remplacer la jauge par une jauge full 

	if check_flag(3,newx,newy) then
	--	print(check_flag(3,newx,newy))
	--  spr(16, 1, 1, 2, 2)
		gas=200
		next_tile(newx,newy)
		
	end
end

-->8
--map--

function check_flag(flag,x,y)
	local sprite = mget(x,y)
	return fget(sprite, flag)
end
-->8
--game over

function game_over()
	if gas <= 0 then
		cls(4)
		print("t'as plus de gas !", 50, 50, 14)
	 print("press ❎ to retry", 55, 55, 14) 
		end	
end

function retry()
	if (btn(❎)) _init()
end
	
	
	
-->8
--poste d'essence




	 
__gfx__
00000000009339000000000000833800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000053333500550055005333350055005500000000000000000000000000000000000000000000000000000000000000000000000000088880000999900
0070070005cccc50833ccc39053cc35093ccc3380000000000000000000000000000000000000000000000000000000000000000000000000dd778000dd77900
0007700000c33c0033c33c3300c33c0033c33c33000000000000000000000000000000000000000000000000000000000000000000000000d0877800d0977900
0007700000c33c0033c33c3300c33c0033c33c33000000000000000000000000000000000000000000000000000000000000000000000000d0888800d0999900
00700700053cc350833ccc3905cccc5093ccc338000000000000000000000000000000000000000000000000000000000000000000000000d0888800d0999900
00000000053333500550055005333350055005500000000000000000000000000000000000000000000000000000000000000000000000000dd888000dd99900
00000000008338000000000000933900000000000000000000000000000000000000000000000000000000000000000000000000000000000555555005555550
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0
c8c9c9cbcbcbcbc0c8c9c9cbcbcbc7c0c8c9c9cbcbc7c7c0c8c9c9cbc7c7c7c0c8c9c9c7c7c7c7c0c8c9c7c7c7c7c7c0c8c7c7c7c7c7c7c0c7c7c7c7c7c7c7c0
c8c9c9cbcbcbcbc0c8c9c9cbcbcbc7c0c8c9c9cbcbc7c7c0c8c9c9cbc7c7c7c0c8c9c9c7c7c7c7c0c8c9c7c7c7c7c7c0c8c7c7c7c7c7c7c0c7c7c7c7c7c7c7c0
c8c9c9cbcbcbcbc0c8c9c9cbcbcbc7c0c8c9c9cbcbc7c7c0c8c9c9cbc7c7c7c0c8c9c9c7c7c7c7c0c8c9c7c7c7c7c7c0c8c7c7c7c7c7c7c0c7c7c7c7c7c7c7c0
ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0ccccccccccccccc0
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccc9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccc8888ccc9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccc8888ccc9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccc8888ccc9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccc8888ccc9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccc9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0eeeeee0777667775555555556666667766666655666666776666665555555557776677777766777555555557666666556666667566666666666666556666667
eeeeeeee666666666666666656666667766666656666666766666665566666667666666666666667666666657666666656666666666666666666666666666667
eeeeeeee666666666666666656666667766666656666666766666665566666667666666666666667666666657666666656666666666666666666666666666667
eeeeeeee666666666666666656666666666666656666666666666665566666666666666666666666666666656666666656666666666666666666666666666666
eeeeeeee666666666666666656666666666666656666666666666665566666666666666666666666666666656666666656666666666666666666666666666666
eeeeeeee666666666666666656666667766666656666666766666665566666667666666666666667666666657666666656666666666666666666666666666667
eeeeeeee666666666666666656666667766666656666666766666665566666667666666666666667666666657666666656666666666666666666666666666667
0eeeeee0555555557776677756666667766666657776677755555555566666677666666556666667766666657776677755555555777667777776677766666667
6666666777766777777667777666666676666665766666655666666700000000000000000000000000000000000000000000000000000000abbbbbba77766777
6666666766666666666666667666666676666666666666655666666600000000000000000000000000000000000000000000000000000000bbbbbbbb66666666
6666666766666666666666667666666676666666666666655666666600000000000000000000000000000000000000000000000000000000bbbbbbbb66666336
6666666666666666666666666666666666666666666666655666666600000000000000000000000000000000000000000000000000000000abbbbbba66633333
6666666666666666666666666666666666666666666666655666666600000000000000000000000000000000000000000000000000000000abbbbbba44333333
6666666766666666666666667666666676666666666666655666666600000000000000000000000000000000000000000000000000000000aabbbbaa44333333
6666666766666666666666667666666676666666666666655666666600000000000000000000000000000000000000000000000000000000aaa44aaa66633333
5666666756666666666666657666666576666666666666655666666600000000000000000000000000000000000000000000000000000000aaa44aaa55553333
ffffffbbb3ffffffffffffbffffffffffffff333b3ffffff3333333333333333cccccccccccccc77aaaaaaaaaaaaaaaa44444444444444440000000055555335
fffffbb3bbbfffffffffff3fffffffffffff33333333ffff3333333333333333cc77ccccccccccccaaaaaaaaaaaaaaaa44444444444444440000000066633333
fffbbbbbbb3bbfffffffff3ffffffffffff33b333333ffff3333333333333333c77cccccc77cccccaaaaaaaaaaaaaaaa99999999999999990000000044333333
ffbbb3bb3bbbbffffffffb3bfffffffffff33333b3333fff3333333333333333cccccccc77ccccccaaaaaaaaaaaaaaaa99999999999999990000000044333333
ffb3bbbbbb3b3bfffffff333ffffffffff333333333b33ff3333333333333333ccccccccccccccccaaaaaaaaaaaaaaaa44444444444444440000000066333333
ffbbbb3bbbbbbbfffffff333ffffffffff33333b333333ff3333333333333333cccc77ccccccccccaaaaaaaaaaaaaaaa44444444444444440000000066633336
ffb3bbbb3b3b3bffffffb333bfffffffff3b333333b333ff3333333333333333ccc77ccccccccc77aaaaaaaaaaaaaaaa99999999999999990000000066666666
ffbbb3bbbbbbbbffffff33333ffffffffff3333333333fff3333333333333333ccccccccccccc77caaaaaaaaaaaaaaaa99999999999999990000000077766777
fffbbbb3bb3bbffffffb33333bffffffffff333b3333ffff3333333333333333ccccccccccccccccaaaaaaaaaaaaaaaa44444444444444440000000000000000
ffffb3bbbbbbfffffff3333333ffffffffffff3333ffffff3333333333333333cccccccc77ccccccaaaaaaaaaaaaaaaa44444444444444440000000000000000
fffffff44fffffffffb3333333bffffffffffff44fffffff3333333333333333ccccccc77cccccc7aaaaaaaaaaaaaaaa99999999999999990000000000000000
fffffff44fffffffffffff4ffffffffffffffff44fffffff3333333333333333cc77cccccccccc77aaaaaaaaaaaaaaaa99999999999999990000000000000000
fffffff44fffffffffffff4ffffffffffffffff44fffffff3333333333333333c77cccccccccccccaaaaaaaaaaaaaaaa44444444444444440000000000000000
ffffff4444ffffffffffff4ffffffffffffffff44fffffff3333333333333333cccccccc77ccccccaaaaaaaaaaaaaaaa44444444444444440000000000000000
ffffff4444ffffffffffff4fffffffffffffff4444ffffff3333333333333333ccccccc77ccccc77aaaaaaaaaaaaaaaa99999999999999990000000000000000
fffff444444ffffffffff444fffffffffffff444444fffff33333333333333337cccccccccccc77caaaaaaaaaaaaaaaa99999999999999990000000000000000
__gff__
0000000001000000000000000000080000000000000000000000000000000808000000000000000000000000000008080000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000001010101010101010101010101010101000101010101010101010101010101010000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
430e6c777777774742426f424242424242427777666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43446c777777774348414141415f414141417777666666666666667676666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43446c6061777743446a6b7b7a7a777777777777666666666666667676666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43446c7071777743447a7b7b7a7a0e4242424242424242424a66667676666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
434b42424242424d4e42424a7a7a414151524141414141494466667676666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4c414141515241414141494462637d7d434468686a6a5e434466666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777766434468686868434472737d7d434468686a5e6a434466666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
777777774344684742424d4e42424a7d434469695e6a6a434466666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7777777743446843484141414149447d435442424242424f4466666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7777777743446843446b6b6b6b43447d43534141414141504b42666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6c47424245446843446b6b6b6b43447d434466666666664c4141666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6c434841414668434464656b6b434b4245446666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
424f4468686869434474756b6b4c414141467777666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
41504b4242424245446767676766666666667777666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6c4c414141414141466767676766666666667777666666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6c77676767676767676767676766666666667777666666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6767676767676767676767676766666666666666666666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6767676767676767676767676766666666666666666666666666666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6767676767676767676767676766666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6666666666666666666666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344

