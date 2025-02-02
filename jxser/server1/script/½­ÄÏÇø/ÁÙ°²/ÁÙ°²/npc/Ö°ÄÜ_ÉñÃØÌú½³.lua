-- 功能：重铸装备
-- 小浪多多 2008.1.14

Include( "\\script\\task\\system\\task_string.lua" );

-- 重铸
Include("\\script\\global\\recoin_goldenequip.lua")
-- 完美安邦首饰
Include("\\script\\task\\equipex\\head.lua");
-- 白金装备
Include("\\script\\global\\platina_upgrade.lua")
--重铸白金装备
Include("\\script\\global\\recoin_goldenequip.lua")
--Include("\\script\\event\\reclaim_equip\\reclaim_equip.lua") --回收绑定物品
--重铸金乌装备
Include("\\script\\event\\equip_publish\\jinwu\\refine_equip.lua")
Include("\\script\\misc\\itemexchangevalue\\itemexchangevalue.lua") -- 兑换精炼宝箱
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_lingpai.lua")	-- 兑换新装备令牌（紫蟒等）
Include("\\script\\activitysys\\npcdailog.lua")

--Tr飊g luy謓 T� M穘g
Include("\\script\\vng_feature\\trungluyen\\refine_equip.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<dec><npc>Th藅 kh玭g ng� ta y  mai danh 萵 t輈h  l﹗ nh� v藋, th� m� v蒼 b� nh� ngi t譵 th蕐 頲, ch綾 l� ngi v� mu鑞 ch� t筼 <color=yellow> trang b� Ho祅g Kim <color> m� n y ch� g�."
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg , "<dec>", "")
	local aryDescribe =
	{
		"Ta mu鑞 t譵 hi觰 v� b� An bang Ho祅 m�./main_talk",		
		--"Ta mu鑞 m阨 ngi tr飊g luy謓 trang b� b筩h kim/platina_main",
		--"Ta mu鑞 nh� l穙 tr飊g luy謓 trang b� Kim �/refine_jinwu",		
		--"Ta mu鑞 ng trang b� B筩h Kim/recoin_platina_main",
		--Change request 04/06/2011, ng ch� t筼 trang b� b筩h kim
		--"Nh� ngi gi髉 ta ph﹏ m秐h m閠 s� trang b� ho祅g kim./split_entry",
		--"Ta mu鑞 s� d鬾g m秐h trang b�  h頿 th祅h trang b� Ho祅g Kim./compose_entry",
		--"Ta mu鑞 i thi誸 huy誸 n/exchange_tiexuedan",
		--"T筼 trang b� H錸g 秐h/perfect_hongying_main",
		--"Ta mu鑞 t譵 hi觰/equipex_recycle_main",
		--"Ta mu鑞 i m筺h v鬾/exchange_entry",
		--"Ta mu鑞 l蕐 trang b� i th祅h h錸 th筩h/exchange_olditem",
		--"Ta mu鑞 d飊g h錸 th筩h i l謓h b礽/exchange_lingpai",
		--"Ta mu鑞 d飊g l謓h b礽 i trang b�/exchange_lingpai2goldequip",
	}	
	
	--Tr飊g luy謓 T� M穘g **blackcupid**
	tbDailog:AddOptEntry("Ta mu鑞 m阨 ngi tr飊g luy謓 trang b� T� M穘g", tbVNG_RefineEquip.ShowDialog, {tbVNG_RefineEquip})	
	
	for i = 1, getn(aryDescribe) do
		local _,_, szOpt, szFun = strfind(aryDescribe[i], "([^/]+)/([^/]+)")
		local fn = getglobal(szFun)
		if fn then
			tbDailog:AddOptEntry(szOpt, fn);	
		end
	end
	
	--弹出对话框
	tbDailog:Show()
	
-- 如果接了完美安邦任务，插入选项
	--local nNextStatus = check_nexttask_status();
	--if (check_nexttask_condition() == 1) then
		tinsert(aryDescribe, 2, "Ta mu鑞 ch� t筼 trang b� Ho祅g M�, An Bang, Trang s鴆/nexttask_talk");
	--end
	tinsert(aryDescribe, 2, "T竔 ch� trang b� r祅g bu閏 v躰h vi詎/reclaimBindEquip_main");
	
end

function exchange_tiexuedan()
	if (CalcFreeItemCellCount() < 2) then
		Say("в m b秓 an to祅 cho v藅 ph萴, h穣  ch鮝 ra 2 � tr鑞g tr� l猲", 0);
		return
	end
	GiveItemUI("фi thi誸 huy誸 n", "Xin h穣 b� 1 trang b� ho祅g kim m玭 ph竔 b蕋 k� v祇 � b猲 di", "do_exchange_tiexuedan", "onCancel")
end

function do_exchange_tiexuedan(nCount)
	if nCount ~= 1 then
		CreateTaskSay({"S� lng v藅 ph萴 b� v祇 kh玭g ng y猽 c莡", "Th祅h th藅 xin l鏸, ta s� s緋 x誴 l筰/exchange_tiexuedan", "Th藅 ng筰 qu�, ta s� quay l筰 sau./onCancel"});
		return
	end

	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);	--品质
	
	if (nQuality ~= 1 or GetGlodEqIndex(nItemIndex) > 140) then
		CreateTaskSay({"H穣 a cho ta 1 trang b� ho祅g kim m玭 ph竔", "Th祅h th藅 xin l鏸, ta s� s緋 x誴 l筰/exchange_tiexuedan", "Th藅 ng筰 qu�, ta s� quay l筰 sau./onCancel"});
		return
	end
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"фi thi誸 huy誸 n Error",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"X鉧 trang b� ho祅g kim m玭 ph竔 th蕋 b筰:\t"..GetItemName(nCurItemIdx)));
	end
	
	
	for i = 1, 20 do
		AddItem(6, 1, 2163, 1, 1, 0);
	end
	Msg2Player("Ch骳 m鮪g i hi謕  nh薾 頲 20 Thi誸 Huy誸 Кn!");
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"фi thi誸 huy誸 n Success",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			format("фi %s thu 頲 thi誸 huy誸 n", GetItemName(nItemIndex))));
end
