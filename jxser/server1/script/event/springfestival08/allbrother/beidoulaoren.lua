Include("\\script\\event\\springfestival08\\allbrother\\event.lua");	-- 
Include("\\script\\event\\BeiDouChuanGong\\zhizuochuangongwan.lua");	-- 
Include("\\script\\event\\other\\xunmashu\\dialog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua");			-- 多重转生对话
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\translife_4_ex.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName);
	end
	
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "Xin ch祇, t筰 h� l� truy襫 nh﹏ c馻 B綾 u M玭, ch糿g hay c竎 h� c莕 g�?";
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog:AddOptEntry("Nhi謒 v� t� h秈 giai huynh ", allbrother_0801_main);
	tbDailog:AddOptEntry("Luy謓 ti猲 產n truy襫 c玭g", BeiDouChuanGong_main, {1});
	tbDailog:AddOptEntry("T譵 ki誱 B綾 u Trng Sinh Thu藅", beidou_translife_main);
	--T筸 ng k� n╪g TS 4 - Modified By DinhHQ - 20111102
	tbDailog:AddOptEntry("Ta mu鑞 h鋍 k� n╪g Chi課 � Thi猲 Thu", beidou_learn_specialskill);
	
	if tbXunMaShu0903:IsActDate() then
		tbDailog:AddOptEntry("Ho箃 ng [B秓 rng th莕 b輂", tbXunMaShu0903.DialogMain_Box, {tbXunMaShu0903});
		tbDailog:AddOptEntry("B綾 u Thu莕 M� Thu藅", tbXunMaShu0903.DialogMain_Horse, {tbXunMaShu0903});
	end
	
	tbDailog:Show();
end