--description: 天王帮老渔翁
--author: yuanlan
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40级任务
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 0) then		-- 子任务启动
			Talk(4,"","L穙 i gia, y l� L鬰 Th� Quy ngi c﹗ 頲 �?","ng! H玬 nay th藅 may m緉! Зy kh玭g ph秈 l� chuy謓 c� th� d� d祅g g苝u!","T筰 h� 產ng c莕 d飊g n�  l祄 thu鑓 gi秈 c鴘 ngi, l穙 c� th�  l筰 n� cho ta kh玭g?","Ta h玬 nay mang m錳 c﹗ t韎 h譶h nh� l� kh玭g , ngic� th� t譵 cho ta v礽 con giun th� ta s� t苙g n� cho ngi!")
			AddNote("Ti誴 nh薾 nhi謒 v� t譵 giun t v� i r颽 L鬰 M穙 ")
			Msg2Player("T譵 m蕐 con giun t v� cho L穙 Ng� 玭g m韎 c� th� i 頲 r颽 L鬰 M穙 ")
			SetTask(14,1)
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 1) then
			Talk(3, "", "Th� n祇? Х c� giun ch璦?", "L穙 i gia! Ngi xem y   ch璦?", "T鑤! L鬰 Th� Quy n祔 t苙g cho ngi!")
			DelItem(150)
			AddEventItem(94)
			Msg2Player("T譵 頲 r颽 L鬰 M穙 ")
			SetTask(14,10)
			AddNote("m con giun t t苙g cho 誹 Ng� 玭g  頲 r颽 L鬰 M穙 ")
		elseif (UTask_tw40sub >= 10) then
			if (HaveItem(94) == 0) then
				AddEventItem(94)
				Talk(2,"","L穙 i gia! L鬰 Th� Quy 玭g t苙g cho ta,ta l祄 m蕋 r錳!","竔! Ngi sao m� t鑤s鑝 th�! Ta m韎 v鮝 c﹗ 頲 m閠 con, ngic莔 甶 c鴘 ngi!")
			else
				Talk(1,"","L穙 H竛 ta m鏸 ng祔 u c﹗ � y, c� � y u bi誸 ta")
			end
		else
			if (UTask_tw40sub ~= 0) and (UTask_tw40sub ~= 1) and (UTask_tw40sub ~= 3) and (UTask_tw40sub ~= 5) and (UTask_tw40sub ~= 7) and (UTask_tw40sub ~= 9) and (UTask_tw40sub ~= 10) then
				SetTask(14,0)
				Talk(1,"","Ti觰 t�! Xem kh� s綾 c馻 ngi kh玭g t鑤 l緈. Trc h誸 h穣 ng錳 xu鑞g ngh� ng琲 m閠 ch髏,c� g� t� t� m� n鉯. ")
			else
				Talk(1,"","T譵 cho ta m蕐 con giun t, th� ta s� cho ngi L鬰 Th� Quy. ")
			end
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","Nh� nh�! ng l祄 ng c� c馻 ta! ")
		else
			Talk(1,"","L穙 H竛 ta m鏸 ng祔 u c﹗ � y, c� � y u bi誸 ta")
		end
	end
end;
