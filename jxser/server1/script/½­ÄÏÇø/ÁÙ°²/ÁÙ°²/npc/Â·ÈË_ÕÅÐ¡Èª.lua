--江南区\临安\临安\npc\路人_张小泉.lua 
--by xiaoyang (2004\4\20)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld121 = GetTask(121)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld121 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld38 == 127) and (GetFaction() ~= "tianwang") then
		Talk(3,"Uworld121_get","Xin ch祇 v� b籲g h鱱!","T筰 h� ngng m� t礽 ngh� l祄 k衞 c馻 Trng gia  l﹗, h玬 nay tng ki課, qu� l� ti課g n kh玭g sai","Kh玭g bi誸 c竎 h� c� th� gi髉 cho m閠 vi謈 kh玭g?","S絥 s祅g!")
	elseif (Uworld121 == 10) and (HaveItem(373) == 0) then
		Talk(1,"","Ta c騨g r蕋 ph鬰 c竎 h�! K衞 ch璦 l蕐  v閕 甶! G苝 th莕 ti猲 c騨g ch璦 ch綾  v閕 nh� v藋!")
		AddEventItem(373)
		Msg2Player("Ti誴 nh薾 l蕐 k衞 c馻 Trng Ti觰 Tuy襫 ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Nh� ta 3 i u r蘮 k衞, v鑞 c騨g c� ch髏 ti課g t╩ � v飊g n祔. Cha ta mu鑞 ta k� th鮝 t� nghi謕, sau n祔 s� m� th猰 m閠 xng r蘮 k衞, nh璶g ta kh玭g ng � ")
		else
			Talk(1,"","Nh鱪g ngi trong h� t閏 u kh玭g hi觰 ch髏 g� v� ch� hng c馻 ta. Ta mu鑞 甶 kh秓 th� t譵 ch髏 c玭g danh,Sau n祔 c� th� l祄 頲 quan to. Ta kh玭g mu鑞 su鑤 i n祔 u b� ngi ta coi khinh ch� l� m閠 anh th� r蘮 k衞")
		end
	end
end

function Uworld121_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","Kh玭g 頲! Xem c竔 b� d筺g kh玭g c秐 頲 gi� c馻 ngi th� ch綾 kh玭g l祄 頲 chuy謓 n祔")
	else
		Say("� y c� m閠 c﹜ k衞  頲 tinh luy謓. Mong nh� c竎 h� chuy觧 gi髉 n cho S� gi� H� M� Tuy誸 i nh﹏ � Th髖 Y猲 m玭",2,"S韒  nghe Danh ti課g c馻 H� Ti猲T�. L莕 n祔 th藅 l祄 c� h閕 ng祅 v祅g  頲 tng ki課 /Uworld121_getjd","Nh璶g ta v� c竔 g� m� ph秈 甶 xa nh� v藋? Hu鑞g h� ta v� c竎 h� l筰 ch璦 t鮪g quen bi誸! Xin l鏸! Ta th藅 kh玭g th� gi髉 頲! /Uworld121_no") --任务启动
	end
end

function Uworld121_getjd()
	AddEventItem(373)
	Msg2Player("Nh薾 l蕐 k衞 c馻 Trng Ti觰 Tuy襫 ")
	AddNote("Nh薾 l蕐 k衞 sau  甶 th糿g v� hng Th髖 Y猲 m玭 ")
	SetTask(121,10) --设置任务变量为10
end

function Uworld121_no()
end
