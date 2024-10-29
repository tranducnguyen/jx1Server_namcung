-- 大理　路人　花农
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-24) 拳倾天下任务

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub2 = GetTask(53)
	if (Uworld75 == 10) and (U75_sub2 < 10) then		-- 任务中，接取子任务
		if (HaveItem(384) == 1) then
			SetTask(53,10)
			AddNote("Nhi謒 v� quy襫 khuynh thi猲 h�:  Dc Vng C鑓 h竔 ba a hoa C萴 M鬰 T骳 d飉 Hoa N玭g. ")
			Msg2Player("Nhi謒 v� quy襫 khuynh thi猲 h�:  Dc Vng C鑓 h竔 ba a hoa C萴 M鬰 T骳 d飉 Hoa N玭g. ")
			Talk(1,"","L筩 s� huynh mu鑞 tr綾 nghi謒 l筰 ngi? T鑤 qu�! Чi L� b鑞 m颽 hoa th琺, c遪 thi誹 T� M鬰 T骳 k� ph萴 c馻 Dc vng C鑓. Ngi h穣 gi髉 ta h竔 3 畂� v�!")
		else
		 	Talk(1,"","M閠 b鴆 th� c騨g kh玭g c�, kh玭g ch鴑g kh玭g c� k猽 ta l祄 sao tin ngi?")
		end
	elseif (Uworld75 == 10) and (U75_sub2 == 10) then		-- 子任务完成判断
		if (GetItemCount(112) >= 3) then
			DelItem(112)
			DelItem(112)
			DelItem(112)
			SetTask(53,20)
			AddNote("Nhi謒 v� quy襫 khuynh thi猲 h�: Ho祅 th祅h nhi謒 v� h竔 C萴 M鬰 T骳. ")
			Msg2Player("Nhi謒 v� quy襫 khuynh thi猲 h�: Ho祅 th祅h nhi謒 v� h竔 C萴 M鬰 T骳. ")
			Talk(1,"","Th藅 l� tuy謙 v阨, ng l� nh蕋 ph萴! Ta s� ph竔 ngi 甶 th玭g b竜 L筩 s� huynh r籲g ta ng � r錳.")
		else
			Talk(1,"","V蒼 ch璦 t譵 頲 �?")
		end
	else
		i = random(0,99)
		if (i < 25) then
			Talk(1,"","V﹏ Nam tr� hoa nh蕋 thi猲 h�, Чi l� tr� hoa nh蕋 V﹏ Nam, hoa tr� trong m総 ngi Чi L� ch髇g ta l� hoa p nh蕋 thi猲 h�, ngay c� M蓇 Кn c騨g kh玭g s竛h b籲g.")
		elseif (i < 50) then
			Talk(1,"","Nh� nh� � Чi L� u tr錸g hoa tr�, m鏸 n╩ u t� ch鴆 tri觧 l穖 h閕 hoa.")
		elseif (i < 75) then
			Talk(1,"","Hoa tr� p nh蕋 to祅 Чi L� l� do 玭g l穙 h� 祅 tr錸g, 玭g 蕐 s鑞g � m閠 ng玦 nh� nh� b猲 b� Nh� H秈. Hoa tr� c馻 l穙 h竛 h� 祅 m鏸 n╩ n m颽 h閕 hoa lu玭 oc ch鋘 l� hoa p nh蕋.")
		else
			Talk(1,""," g l穙 h� 祅 n祔 c� i y猽 hoa nh� th祅h c竔 b謓h, hoa tr� m� 玭g 蕐 tr錸g ch� b竛 cho ngi c� duy猲 v韎 玭g 蕐, c遪 ngi kh竎 th� d� cho c� 甧m n骾 v祅g n骾 b筩 玭g 蕐 c騨g kh玭g b竛.")
		end
	end
end;
