-- 天忍接引弟子 模板 天忍死士
-- By: Dan_Deng(2003-10-28) 由人物对话修改而来
-- Update: Dan_Deng(2004-05-25) 体服技能全开修改（调用外部文件方式）
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Thi猲 Nh蒼 T� S� "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 7 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianren","Ngi  l�  t� c馻 b鎛 ph竔, kh玭g c莕 甶 n鱝, c� th� tr鵦 ti誴 g苝 Long Ng� n鉯 chuy謓.")
	elseif (player_Faction == "emei") then
		Talk(1,"","N誹 Nga My ph竔 ch辵 gia nh藀 b鎛 gi竜, v藋 th� b鋘 ta su鑤 ng祔 u 頲 ng緈 nh譶 ngi p! ! Sung sng ch誸 甶 th玦!")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","S韒  nghe con g竔 phng Nam s綾 p nghi猲g th祅h, h玬 nay 頲 g苝 y, qu� l� ti課g n kh玭g ngoa")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Gi竜 ch� c馻 b鎛 gi竜 lu玭 c� l遪g mong m醝 qu� gi竜 c飊g gia nh藀, vinh hoa ph� qu�, cao quan b鎛g l閏, hng c� i kh玭g h誸!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Thi猲 Nh蒼 v� Ng� Йc gi竜 m� h頿 th祅h Nam c玭g B綾 k輈h, Trung Nguy猲 s韒 mu閚 c騨g r琲 v祇 tay ch髇g ta")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Kh玭g ai c� th� ng╪ c秐 頲 s� nghi謕 h飊g b� Trung nguy猲 c馻 Thi猲 Nh蒼 gi竜")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Cao th� Thi誹 L﹎ ph竔 c馻 c竎 ngi  s緋 quy ti猲 h誸 r錳!Nh﹏ t礽 tr� tu鎖 l筰 ch糿g c� m蕐 ngi! Xem ra Thi誹 L﹎ c騨g  s緋 n ng祔 t薾 nghi謕! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Ta  nghe N閕 c玭g, ki誱 thu藅 c馻 V� ng l鮪g danh Trung nguy猲! C� c� h閕 nh蕋 nh ph秈 th豱h gi竜!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C玭 L玭 ph竔 c竎 ngi h飊g c� T﹜ V鵦,c� d� t﹎ d適 ng� Trung nguy猲  l﹗. S� c�  m閠 ng祔 b鎛 gi竜 v� c竎 ngi ph﹏ chia cao th蕄 t筰 Trung Nguy猲")
	elseif (player_Faction == "tianren") then
		Say("Nhi謒 v�  ho祅 th祅h ch璦?",4,"Nhi謒 v�  ho祅 th祅h! H穣 a ta v� T鎛g n!/return_yes","T譵 hi觰 khu v鵦 luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Kh玭g h醝 n鱝!/no")
--		Say("天忍死士：不好意思，因为有些人的任务状态不正确，我们正在重新为门下弟子进行检查。你要检查你的任务状态吗？如果你认为你的状态是正确的就不必检查了。",2,"检查/tr_check_yes","不用了/tr_check_no")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","T猲 ╪ m祔 n祔 mu鑞 tr� tr閚 v祇 y l祄 gian t� �?")
	elseif (nt_getTask(75) == 255) then		-- 学了野球拳的，不允许再入门派
		Talk(1,"","T� h鋍 kh� luy謓! Ti襫  r蕋 s竛g l筺! T筰 h� v� c飊g b閕 ph鬰!")
	else
		UTask_tr = nt_getTask(4)
		if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- 入门任务中
			Talk(1,"","Ngi  ti誴 nh薾 nhi謒 v� nh藀 m玭 nh璶g n gi� v蒼 ch璦 ho祅 th祅h. H穣 mau l猲 Hoa S琻 mang V� Vng ki誱 v� y!")
		elseif (UTask_tr >= 70*256) and (player_Faction ~= "tianren") then					--已经出师
			Say("Nghe n鉯 ngi sau khi xu蕋 s�  l藀 n猲 nhi襲 c玭g danh! Qu� kh玭g h� danh l�  t� c馻 b鎛 ph竔",3,"T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","K誸 th骳 i tho筰/no")
		else
			Talk(1,"select","Gi竜 ch� c馻 b鎛 gi竜 l� Ho祅 Nhan H飊g Li謙. Danh ch蕁 thi猲 h�! Ho祅g  Kim qu鑓 c騨g ph秈 nhng 3 ph莕. Cao th� c馻 b鎛 gi竜 nhi襲 v� s�! Nh﹏ t礽 ng鋋 h� t祅g long")
		end
	end
end;

function select()
	UTask_tr = nt_getTask(4)
	UTask_gb = nt_getTask(8)
	if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- 已接了丐帮入门任务
		Talk(1,"","Nam tri襲 u m�! T閕 g� c竎 ngi c� ph秈 b竛 m譶h cho c竔 g� h� Tri謚 ngu ng鑓  v藋?")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_gb < 5*256) and (UTask_tr < 5*256) then		--火系、未入丐帮天忍
		if (GetLevel() >= 10) then						--等级达到十级
			Say("C� mu鑞 gia nh藀 b鎛 gi竜 kh玭g?", 3, "Gia nh藀 Thi猲 Nh蒼 gi竜/yes", "Kh玭g gia nh藀/no","T譵 hi觰 tinh hoa v� ngh� c竎 m玭 ph竔/Uworld1000_knowmagic")
		else
			Talk(1,"","C╪ b秐 c馻 ngi c遪 k衜 l緈! H穣 甶 luy謓 t藀 th猰, bao gi� n <color=Red>c蕄 10<color> l筰 n t譵 ta!")
		end
	end
end;

function yes()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	Talk(1,"","Gia nh藀 b鎛 gi竜 c莕 ph秈 ch蕄 h祅h hi謚 l謓h! M筺h 頲 y誹 thua ch輓h l� t玭 ch� c馻 b鎛 gi竜! Ngi h穣 t� d飊g th鵦 l鵦  ch鴑g minh m譶h!")
	SetRevPos(49,28)	 						--设置重生点
	nt_setTask(4, 10*256)
	SetFaction("tianren")      					--玩家加入天忍教
	SetCamp(2)
	SetCurCamp(2)
	SetRank(55)							--设置称号
	nt_setTask(137,64)
	SetLastFactionNumber(7)
	Msg2Player("Gia nh藀 Thi猲 Nh蒼 gi竜, tr� th祅h S竧 th�. H鋍 頲 v� c玭g: T祅 Dng Nh� Huy誸; Кn Ch� Li謙 Di謒")
	AddNote("Gia nh藀 Thi猲 Nh蒼 gi竜, tr� th祅h S竧 th� ")
	Msg2Faction("tianren",GetName().."t� h玬 nay gia nh藀 Thi猲 Nh蒼 gi竜! Xin b竔 ki課 c竎 v� o huynh s� t�! Mong c竎 v� quan t﹎ ch� gi竜!",GetName())
-- 直接处理流程
--	nt_setTask(4,80*256)
--	SetRank(81)
--	Msg2Player("欢迎你加入天忍教，测试中直接学会本门所有技能。")
	add_tr(10)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
-- 结束
	NewWorld(49, 1644, 3215)					--把玩家传送到门派入口

end;

function return_yes()
	NewWorld(49, 1644, 3215)			--把玩家传送到门派入口
end;

function tr_check_yes()
	if (GetSeries() ~= 3) then
		Talk(1,"","Ngi kh玭g thu閏 nh鉳 Ng� h祅h h� H醓 c馻 ta, n y l祄 g�? H穣 l猲 di詎 n h鋍 h醝 甶!")
	elseif (HaveMagic(148) >= 0) then		-- 做完了50级任务,七杀神拳
		nt_setTask(4,60*256)
		Talk(1,"","Ta  ph鬰 h錳 l筰 tr筺g th竔 nhi謒 v� c馻 ngi! B﹜ gi� ngi c� th� 甶 nh薾 nhi謒 v� xu蕋 s� ")
	elseif (HaveMagic(146) >= 0) then		-- 做完了40级任务,五行阵
		nt_setTask(4,50*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 40.")
	elseif (HaveMagic(141) >= 0) then		-- 做完了30级任务,烈火情天
		nt_setTask(4,40*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 30.")
	elseif (HaveMagic(138) >= 0) then		-- 做完了20级任务,推山填海
		nt_setTask(4,30*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 20.")
	elseif (HaveMagic(131) >= 0) then		-- 做完了10级任务,天忍矛法
		nt_setTask(4,20*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  ho祅 th祅h nhi謒 v� c蕄 10.")
	else
		nt_setTask(4,10*256)
		Talk(1,"","Ta  ch豱h l� l筰 tr筺g th竔 nhi謒 v� c馻 ngi. Ngi  c� th� nh薾 nhi謒 v� c蕄 10.")
	end
end

function tr_check_no()
	Say("Nhi謒 v�  ho祅 th祅h ch璦?",2,"Nhi謒 v�  ho祅 th祅h! H穣 a ta v� T鎛g n!/return_yes","Kh玭g h醝 n鱝!/return_no")
end

function Uworld1000_jiaoyutianren()
	nt_setTask(1000,260)
	Msg2Player("е t� ti誴 d蒼 Thi猲 Nh蒼 b秓 b筺  l�  t� c馻 m玭 ph竔, c� th� tr鵦 ti誴 甶 g苝 Long Ng� n鉯 chuy謓.")
end

function no()
end;
