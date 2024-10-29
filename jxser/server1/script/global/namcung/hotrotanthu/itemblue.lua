

function nhantrangbi()
dofile("script/global/namcung/hotrotanthu/itemblue.lua");		
trangbixanh()	
end

function trangbixanh()
	Say("C„ t t c∂ <color=Wood>5<color> NgÚ Hµnh, mÁi loπi trang bﬁ mang mÈt ngÚ hµnh vÌi mÈt s¯c mπnh kh∏c nhau !",6,
			"Trang bﬁ Kim/hetrangbi",
			"Trang bﬁ MÈc/hetrangbi1",
			"Trang bﬁ ThÒy/hetrangbi2",
			"Trang bﬁ H·a/hetrangbi3",
			"Trang bﬁ ThÊ/hetrangbi4",
			"Ta kh´ng c«n/no")
end

function hetrangbi()
Say("Ng≠¨i muËn nhÀn trang bﬁ nµo ?",11,
"VÚ kh›/trangbikim",
"∏o gi∏p/trangbikim",
"N„n/trangbikim",
"Giµy/trangbikim",
"Thæt l≠ng/trangbikim",
"Bao Tay/trangbikim",
"∏m kh›/trangbikim",
"Ng‰c bÈi/trangbikim",
"D©y chuy“n/trangbikim",
"Nh…n/trangbikim",
"K’t thÛc ÆËi thoπi./no")
end


function trangbikim(nsel)
i = nsel+1
for m=1,5 do
	if i == 1 then --vu khi
			q = random(0,5)
			AddItem(0,0,q,random(8,10),0,200,10)
		elseif i == 2 then --ao giap
			w = random(0,28)
			AddItem(0,2,w,random(6,10),0,200,10)
		elseif i == 3 then --non
			a = random(0,13)
			AddItem(0,7,a,random(6,10),0,200,10)
		elseif i == 4 then --giay
			e = random(0,3)
			AddItem(0,5,e,random(6,10),0,200,10)
		elseif i == 5 then	--that lung
			r = random(0,1)
			AddItem(0,6,r,random(6,10),0,200,10)
		elseif i == 6 then --bao tay
			t = random(0,1)
			AddItem(0,8,t,random(6,10),0,200,10)
		elseif i == 7 then --am khi
			y = random(0,2)
			AddItem(0,1,y,random(6,10),0,200,10)
		elseif i == 8 then --ngoc boi
			u = random(0,1)
			AddItem(0,9,u,random(6,10),0,200,10)
		elseif i == 9 then --day chuyen
			o = random(0,1)
			AddItem(0,4,o,random(6,10),0,200,10)
		elseif i == 10 then --nhan
			AddItem(0,3,0,random(6,10),0,200,10)		
		end
end
end

function hetrangbi1()
Say("Ng≠¨i muËn nhÀn trang bﬁ nµo ?",11,
"VÚ kh›/trangbimoc",
"∏o gi∏p/trangbimoc",
"N„n/trangbimoc",
"Giµy/trangbimoc",
"Thæt l≠ng/trangbimoc",
"Bao Tay/trangbimoc",
"∏m kh›/trangbimoc",
"Ng‰c bÈi/trangbimoc",
"D©y chuy“n/trangbimoc",
"Nh…n/trangbimoc",
"K’t thÛc ÆËi thoπi./no")
end


function trangbimoc(nsel)
i = nsel+1
for m=1,5 do
	if i == 1 then --vu khi
			q = random(0,5)
			AddItem(0,0,q,random(8,10),1,200,10)
		elseif i == 2 then --ao giap
			w = random(0,28)
			AddItem(0,2,w,random(6,10),1,200,10)
		elseif i == 3 then --non
			a = random(0,13)
			AddItem(0,7,a,random(6,10),1,200,10)
		elseif i == 4 then --giay
			e = random(0,3)
			AddItem(0,5,e,random(6,10),1,200,10)
		elseif i == 5 then	--that lung
			r = random(0,1)
			AddItem(0,6,r,random(6,10),1,200,10)
		elseif i == 6 then --bao tay
			t = random(0,1)
			AddItem(0,8,t,random(6,10),1,200,10)
		elseif i == 7 then --am khi
			y = random(0,2)
			AddItem(0,1,y,random(6,10),1,200,10)
		elseif i == 8 then --ngoc boi
			u = random(0,1)
			AddItem(0,9,u,random(6,10),1,200,10)
		elseif i == 9 then --day chuyen
			o = random(0,1)
			AddItem(0,4,o,random(6,10),1,200,10)
		elseif i == 10 then --nhan
			AddItem(0,3,0,random(6,10),1,200,10)		
		end
end
end



function hetrangbi2()
Say("Ng≠¨i muËn nhÀn trang bﬁ nµo ?",11,
"VÚ kh›/trangbithuy",
"∏o gi∏p/trangbithuy",
"N„n/trangbithuy",
"Giµy/trangbithuy",
"Thæt l≠ng/trangbithuy",
"Bao Tay/trangbithuy",
"∏m kh›/trangbithuy",
"Ng‰c bÈi/trangbithuy",
"D©y chuy“n/trangbithuy",
"Nh…n/trangbithuy",
"K’t thÛc ÆËi thoπi./no")
end


function trangbithuy(nsel)
i = nsel+1
for m=1,5 do
	if i == 1 then --vu khi
			q = random(0,5)
			AddItem(0,0,q,random(8,10),2,200,10)
		elseif i == 2 then --ao giap
			w = random(0,28)
			AddItem(0,2,w,random(6,10),2,200,10)
		elseif i == 3 then --non
			a = random(0,13)
			AddItem(0,7,a,random(6,10),2,200,10)
		elseif i == 4 then --giay
			e = random(0,3)
			AddItem(0,5,e,random(6,10),2,200,10)
		elseif i == 5 then	--that lung
			r = random(0,1)
			AddItem(0,6,r,random(6,10),2,200,10)
		elseif i == 6 then --bao tay
			t = random(0,1)
			AddItem(0,8,t,random(6,10),2,200,10)
		elseif i == 7 then --am khi
			y = random(0,2)
			AddItem(0,1,y,random(8,8),2,200,10)
		elseif i == 8 then --ngoc boi
			u = random(0,1)
			AddItem(0,9,u,random(6,10),2,200,10)
		elseif i == 9 then --day chuyen
			o = random(0,1)
			AddItem(0,4,o,random(6,10),2,200,10)
		elseif i == 10 then --nhan
			AddItem(0,3,0,random(6,10),2,200,10)		
		end
end
end



function hetrangbi3()
Say("Ng≠¨i muËn nhÀn trang bﬁ nµo ?",11,
"VÚ kh›/trangbihoa",
"∏o gi∏p/trangbihoa",
"N„n/trangbihoa",
"Giµy/trangbihoa",
"Thæt l≠ng/trangbihoa",
"Bao Tay/trangbihoa",
"∏m kh›/trangbihoa",
"Ng‰c bÈi/trangbihoa",
"D©y chuy“n/trangbihoa",
"Nh…n/trangbihoa",
"K’t thÛc ÆËi thoπi./no")
end


function trangbihoa(nsel)
i = nsel+1
for m=1,5 do
	if i == 1 then --vu khi
			q = random(0,5)
			AddItem(0,0,q,random(8,10),3,200,10)
		elseif i == 2 then --ao giap
			w = random(0,28)
			AddItem(0,2,w,random(6,10),3,200,10)
		elseif i == 3 then --non
			a = random(0,13)
			AddItem(0,7,a,random(6,10),3,200,10)
		elseif i == 4 then --giay
			e = random(0,3)
			AddItem(0,5,e,random(6,10),3,200,10)
		elseif i == 5 then	--that lung
			r = random(0,1)
			AddItem(0,6,r,random(6,10),3,200,10)
		elseif i == 6 then --bao tay
			t = random(0,1)
			AddItem(0,8,t,random(6,10),3,200,10)
		elseif i == 7 then --am khi
			y = random(0,2)
			AddItem(0,1,y,random(6,10),3,200,10)
		elseif i == 8 then --ngoc boi
			u = random(0,1)
			AddItem(0,9,u,random(6,10),3,200,10)
		elseif i == 9 then --day chuyen
			o = random(0,1)
			AddItem(0,4,o,random(6,10),3,200,10)
		elseif i == 10 then --nhan
			AddItem(0,3,0,random(6,10),3,200,10)		
		end
end
end


function hetrangbi4()
Say("Ng≠¨i muËn nhÀn trang bﬁ nµo ?",11,
"VÚ kh›/trangbitho",
"∏o gi∏p/trangbitho",
"N„n/trangbitho",
"Giµy/trangbitho",
"Thæt l≠ng/trangbitho",
"Bao Tay/trangbitho",
"∏m kh›/trangbitho",
"Ng‰c bÈi/trangbitho",
"D©y chuy“n/trangbitho",
"Nh…n/trangbitho",
"K’t thÛc ÆËi thoπi./no")
end


function trangbitho(nsel)
i = nsel+1
for m=1,5 do
	if i == 1 then --vu khi
			q = random(0,5)
			AddItem(0,0,q,random(8,10),4,200,10)
		elseif i == 2 then --ao giap
			w = random(0,28)
			AddItem(0,2,w,random(6,10),4,200,10)
		elseif i == 3 then --non
			a = random(0,13)
			AddItem(0,7,a,random(6,10),4,200,10)
		elseif i == 4 then --giay
			e = random(0,3)
			AddItem(0,5,e,random(6,10),4,200,10)
		elseif i == 5 then	--that lung
			r = random(0,1)
			AddItem(0,6,r,random(6,10),4,200,10)
		elseif i == 6 then --bao tay
			t = random(0,1)
			AddItem(0,8,t,random(6,10),4,200,10)
		elseif i == 7 then --am khi
			y = random(0,2)
			AddItem(0,1,y,random(6,10),4,200,10)
		elseif i == 8 then --ngoc boi
			u = random(0,1)
			AddItem(0,9,u,random(6,10),4,200,10)
		elseif i == 9 then --day chuyen
			o = random(0,1)
			AddItem(0,4,o,random(6,10),4,200,10)
		elseif i == 10 then --nhan
			AddItem(0,3,0,random(6,10),4,200,10)		
		end
end
end



