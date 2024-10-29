-- 扬州 路人NPC 丐帮赵舵主（丐帮30级任务）
-- by：Dan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(193) == 1 then
		allbrother_0801_FindNpcTaskDialog(193)
		return 0;
	end
	UTask_gb = GetTask(8)
	if (UTask_gb == 30*256+10) then		--30级任务开始
		Talk(3,"","Tri謚 У ch�! La trng l穙 b秓  t� n h醝 nguy猲 nh﹏ t筰 sao tr� h裯!","L� v� g莕 y n琲 y x秠 ra nhi襲 chuy謓 l� k�. е t� b鎛 tr筰 n Th鬰 Cng s琻 s╪ b緉 u kh玭g th蕐 tr� v�! H譶h nh� tr猲  c� ma qu� ","C� chuy謓 n祔 sao? е t� s� l猲 Th鬰 Cng s琻 m閠 chuy課!")
		SetTask(8,30*256+20)
		AddNote("Tri謚  ch� n鉯 cho b筺 bi誸 t筰 Th鬰 Cng s琻 c�  t� m蕋 t輈h, b筺 quy誸 nh 甶 甶襲 tra ")
		Msg2Player("Tri謚  ch� n鉯 cho b筺 bi誸 t筰 Th鬰 Cng s琻 c�  t� m蕋 t輈h, b筺 quy誸 nh 甶 甶襲 tra ")
	elseif (UTask_gb == 30*256+30) then		--30级任务结束
		Talk(3,"","Tri謚 У ch�! K� th鵦 kh玭g c� ma qu�! M� l� b鋘 s竧 th� Kim qu鑓  phuc � y b総 t蕋 c�  t� C竔 bang. T筰 h�  c鴘 頲 h� v�!","Nguy猲 do l� v藋! Ngi c遪 tr� m� b秐 l躰h cao cng! B閕 ph鬰!","Phi襫 ngi mang van th� n祔 v� cho la tng l穙, trong  ta  tr譶h t蕌 r蕋 chi ti誸!")
		SetTask(8,30*256+40)
		AddEventItem(81)
		AddNote("C鴘 頲 c竎  t� b� b総, n鉯 s� t譶h cho Tri謚 У ch�, nh薾 頲 v╪ th� ")
		Msg2Player("C鴘 頲 c竎  t� b� b総, n鉯 s� t譶h cho Tri謚 У ch�, nh薾 頲 v╪ th� ")
	elseif ((UTask_gb == 30*256+40) and (HaveItem(81) == 0)) then		-- 任务中，道具丢了
		Talk(1,"","M蕋 r錳 �! Kh� th﹏ ta l筰 ph秈 vi誸 m閠 quy觧 kh竎!")
		AddEventItem(81)
	else
		Talk(1,"","Kim binh ng祔 m閠 l閚g h祅h. Xem ra Dng Ch﹗  kh玭g th� b譶h y猲 n鱝 r錳!")
	end
end;
