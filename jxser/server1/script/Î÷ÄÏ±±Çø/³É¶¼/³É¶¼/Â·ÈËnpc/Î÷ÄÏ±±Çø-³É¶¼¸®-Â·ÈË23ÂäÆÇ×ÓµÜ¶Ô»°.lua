--西南北区 成都府 路人23落魄子弟的对话 世界任务
--author: yuanlan	
--date: 2003/3/19


function main(sel)

i = random(0,4)									--触发买卖的机率是20%

if (i == 0) then  -- 暂时关闭
-- Say("落魄子弟：嗨，来瞅瞅我的宝贝，我一看就知道你是个识货的人，瞧瞧，这可是我的传家之宝啊，要不是手头实在紧得很，我还舍不得卖呢！", 2, "买/accept", "不买/refuse")
Say("V鮝 nh譶 th� bi誸 ngay l� ngi tinh m総! N祇! N祇! Ch鋘 m閠 th� 甶!", 0)
return
end;

if (i == 1) or (i == 2) then  
Say("Xem c竔 g� m� xem! ng tng ta kh玭g bi誸, ngi c� � nh l蕐 b秓 b鑙 c馻 ta �?", 0)
return
end;

if (i == 3) or (i == 4) then  
Say("ng th蕐 ta ╪ m芻 r竎h ri nh� th� n祔...n鉯 cho ngi bi誸 ta l� danh m玭 chi h藆, nh� n╩ � ", 0)
return
end;

end;


function accept()

if (GetCash() >= 5000) then					--参考值
	j = random(0, 9)					--具体类别
	k = random(2, 8)					--等级，控制随机生成道具物品的价格范围为500至50000
	m = random(0, 4)					--系别
	if (j == 0) then 					--closeweapon
		n = random(0, 5)				--详细类别
		AddItem(0, 0, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 1) then 					--rangeweapon
		n = random(0, 2)				--详细类别
		AddItem(0, 1, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 2) then 					--armor
		n = random(0, 9)				--详细类别
		AddItem(0, 2, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 3) then 					--ring
		AddItem(0, 3, 0, k, m, 1)						
		Pay(5000)
	end
	if (j == 4) then 					--amulet
		n = random(0, 1)				--详细类别
		AddItem(0, 4, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 5) then 					--boots
		n = random(0, 3)				--详细类别
		AddItem(0, 5, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 6) then 					--belt
		n = random(0, 1)				--详细类别
		AddItem(0, 6, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 7) then 					--helm
		n = random(0, 8)				--详细类别
		AddItem(0, 7, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 8) then 					--cuff
		n = random(0, 1)				--详细类别
		AddItem(0, 8, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 9) then 					--pendant
		n = random(0, 1)				--详细类别
		AddItem(0, 9, n, k, m, 1)						
		Pay(5000)
	end
else
	Say("Th� ra ch� l� m閠 k� ngh蘯 m筩", 0)
end;

end;


function refuse()
Say("H鉧 ra c騨g ch� l� m閠 k� lng g箃.", 0);
end;
