--description: 中原北区 天忍教圣洞1to天忍教圣洞2 天忍教出师任务
--author: yuanlan	
--date: 2003/5/20
--Trap ID：中原北区 7
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	UTask_tr60tmp = GetTask(28)
	if (UTask_tr60tmp == 15) then		-- bin: 1000 + 0100 + 0010 + 0001
		SetFightState(1)
		NewWorld(52, 1729, 3225)
		SetTask(4, 60*256+70)
		SetTask(28,0)	-- 将子变量复位释放
--		AddNote("得到四句口诀，进入圣洞第二层。")
	elseif (UTask_tr >= 60*256+70) and (GetFaction() == "tianren") then
		SetFightState(1)
		NewWorld(52, 1729, 3225)
	else
		Talk(1,"","Ch璦 l蕐 頲 <color=Red>b鑞 c﹗ kh萿 quy誸<color>, kh玭g th� v祇 t莕g hai c馻 Th竛h чng.")
		SetPos(1767, 3186)						--设置走出Trap点
		AddNote("Mu鑞 v祇 t莕g hai, ph秈 l蕐 頲 b鑞 c﹗ kh萿 quy誸. ")
	end	
end;
