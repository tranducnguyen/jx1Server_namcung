--两湖区 巴陵县 路人9阿芳对话
--巴陵县新手任务：阿芳的嫁妆
--suyu
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world20 = GetTask(48);
	if ((UTask_world20 == 0) and (GetLevel() >= 2)) then		-- 任务启动
		Say("B� m�  s緋 x誴 h玭 s� cho em,nh璶g nh� em ngh蘯 qu�, n m閠 m鉵 c馻 h錳 m玭 cho ra d竛g c騨g kh玭g c�! G莕 y trong tr蕁 xu蕋 hi謓 m閠 ngi thng nh﹏ t� phng xa n, anh/ch� c� th� h醝 gi髉 em xem c� m鉵 n祇 gi� r� m閠 ch髏 kh玭g?", 2, "Gi髉 /yes", "Kh玭g gi髉 /no")
	elseif(UTask_world20 == 1) then
		if(HaveItem(181) == 1) then
			DelItem(181)
			SetTask(48, 3)			-- 任务暂时改为不可重复完成
			Talk(1,"","A! Йi b玭g tai n祔 p qu�,c� l�  t鑞 c馻 anh/ch� kh玭g 輙 ti襫! Зy l� i gi祔 em t� l祄, t苙g cho anh/ch�!")
			AddNote("Лa i b玭g tai cho A phng, ho祅 th祅h nhi謒 v�. ")
			Msg2Player("Лa i b玭g tai cho A phng, ho祅 th祅h nhi謒 v�. ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
			if(GetSex() == 0) then
				AddItem(0, 7, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh薾 頲 m閠 chi誧 kh╪ ")
			else
				AddItem(0, 7, 8, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh薾 頲 m閠 chi誧 tr﹎ ")
			end
			AddRepute(6)		-- 加声望6点
			Msg2Player("Thanh th� giang h� c馻 b筺 頲 gia t╪g 6 甶觤. ")
		else
			Talk(1,"","Ngi thng nh﹏  � trong th� tr蕁, l祄 phi襫 anh/ch� h醝 gi髉 v韎. ")
		end
	else				-- 非任务对话
		if (random(0,1) == 0) then
			Talk(1,"","Con g竔 c馻 ng� d﹏, cu鑙 c飊g c騨g g� v祇 nh� ng� d﹏, l祄 v� c馻 ng� d﹏. ")
		else
			Talk(1,"","B� m�  s緋 x誴 h玭 s� cho em, nh璶g em kh玭g mu鑞 l祄 v� m閠 ng� d﹏, nh璶g kh玭g c遪 c竎h n祇 kh竎, l阨 c馻 cha m� kh玭g th� c穒 l筰. ")
		end
	end
end;

function yes()
	Talk(1,"","Ngi thng nh﹏  � trong th� tr蕁, l祄 phi襫 anh/ch� h醝 gi髉 v韎. ")
	SetTask(48, 1)
	Msg2Player("Nh薾 nhi謒 v�: A phng nh� b筺 甶 xem th�, xem c� m鉵 trang s鴆 n祇 gi� r� l祄 c馻 h錳 m玭 頲 kh玭g ")
	AddNote("Nh薾 nhi謒 v�: A phng nh� b筺 甶 xem th�, xem c� m鉵 trang s鴆 n祇 gi� r� l祄 c馻 h錳 m玭 頲 kh玭g ")
end;

function no()
end;
