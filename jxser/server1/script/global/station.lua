Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_city\\head.lua");
Include("\\script\\missions\\clearskill\\clearhole.lua");
Include("\\script\\task\\tollgate\\messenger\\wagoner.lua");  --特殊信使地图

Include("\\script\\task\\newtask\\map_index.lua"); -- 用于获取任务链地图的信息
Include("\\script\\task\\tollgate\\messenger\\wagoner.lua") --用于连接特殊信使任务的脚本
Include("\\script\\global\\judgeoffline_special.lua")	--用于无名谷——托管服务器地图

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\head.lua")

Include("\\script\\event\\great_night\\great_night_head.lua")	--双龙洞黄金之核
--襲 ch豱h reset 5h ch琲 - Modified by DinhHQ - 20110630
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")
szStationOp = 
	{
		"Nh鱪g n琲  甶 qua/WayPointFun", 		-- 1
		"Nh鱪g th祅h th�  甶 qua/StationFun",		-- 2
		"Tr� l筰 a 甶觤 c� /TownPortalFun", 	-- 3
		" Hoa s琻 c秐h k� trng/go_HSBattle", 	-- 4
		" Chi課 trng c玭g th祅h/GoCityWar",			-- 5
		" chi課 trng hu蕁 luy謓/GoDemoWar",		-- 6
		" o T葃 T駓/GotoClearSkillMap",	-- 7
		" n n琲 l祄 nhi謒 v� D� T萿/tl_moveToTaskMap",			-- 8
		" n琲 c bi謙 l祄 Nhi謒 v� T輓 S� /messenger_wagoner",      -- 9
		--" V� Danh C鑓/GotoAnonymVale",			--10
	};

function return_1()
	return 1
end

function return_0()
	return 0
end

-- 对应上个数组的条件判断
aryCondition = {

	[1] = {checkState = return_1},     -- 路经的地方
	[2] = {checkState = return_1},     -- 路经的城市
	[3] = {checkState = return_1},     -- 返回的地点
	[4] = {checkState = return_1},     -- 去华山竞技场
	[5] = {checkState = function()                      -- 去攻城战场
				return (WhichWarBegin()~= 0 and 1) or 0;
		   end;
		  },
	[6] = {checkState = function()                      -- 去攻城训练战场
				return (GetGlbValue(2)==1 and 1) or 0;
		   end;
		  },
	[7] = {checkState = return_1},     -- 去洗髓岛
	[8] = {checkState = function()                      -- 去野叟任务所在地
				return (GetTask(1021)==4 and 1) or 0;
		   end;
		  },
	[9] = {checkState = function()                      -- 去特殊信使任务所在地点
				return (GetTask(1204)~= 0 and 1) or 0;
		   end;
		  },
	--[10] = {checkState = return_1},    -- 进入无名谷
	[10] = {checkState = return_1},     -- 路经的地方
	[11] = {checkState = return_1},
	[12] = {checkState = return_1},
}

szStationOp_Cancel = "Kh玭g c莕 u/StationOnCancel";

function go_HSBattle()
	Msg2Player("Ng錳 ch綾 nh�! Ch髇g ta 甶 n <color=green>Hoa S琻<color> c秐h k� trng !")
	NewWorld(2,2605,3592)
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 	
end

function WayPointFun()			-- 加返回要800两银子（洞口）　　　（BY： Dan_Deng 2004-04-30）
	p1 = GetWayPoint(1);
	p2 = GetWayPoint(2);
	p3 = GetWayPoint(3);
	HaveBin={};
	i = 1;
	if (p1 ~= 0)  then
		name = GetWayPointName(p1);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	if (p2 ~= 0)  then
		name = GetWayPointName(p2);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	if (p3 ~= 0)  then
		name = GetWayPointName(p3);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	HaveBin[i] = "Kh玭g 甶 u c� /OnCancel";
	if (i == 1) then 
		Say("Xin l鏸!  Ta ch� c� th� a ngi n nh鱪g n琲  甶 qua nh璶g ngi ch璦 甶 u c�! ",0);
	else
		Say("Xin l鵤 ch鋘: ", i, HaveBin);
	end;
end;

function WharfFun()
Count = GetWharfCount(CurWharf);
Num = Count;

WharfB = {};
nValidCount = 1;

for i = 1, Num do
WharfId = GetWharf(CurWharf, i);
if (WharfId ~= 0) then
	nPrice = GetWharfPrice(CurWharf, WharfId);
	WharfB[nValidCount] = GetWharfName(WharfId) .. "[" .. nPrice .. " lng]" .. "/SelWharf";
	nValidCount = nValidCount + 1;
end;
end;

WharfB[nValidCount] = "Kh玭g ng錳/OnCancel";

if (nValidCount == 1) then 
Say("Xin l鏸!  Ngi ch璦 甶 u c�! ", 0);
else
Say("Kh竎h quan mu鑞 甶 u?", nValidCount, WharfB);
end;

end;

function SelWharf(nSel)

nWharfId = GetWharf( CurWharf, nSel + 1);
nPrice = 0;
if (nWharfId ~= 0) then 
	nPrice = GetWharfPrice(CurWharf, nWharfId);
else
	return
end;

if (PrePay(nPrice) == 1 or GetCamp() == 6 ) then
Msg2Player("Ng錳 y猲 ch璦? Ch髇g ta 甶<color=green> "..GetWharfName(nWharfId).."!")
nW , nX, nY = GetWharfPos(nWharfId);
nResult = NewWorld(nW, nX , nY );
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 	
if (nResult == 2) then
Msg2Player("ng chuy觧 i Server...")
end
if (nResult == 0) then
Msg2Player("Nh藀 甶觤 c� sai s鉻!")
end
else
Say("Kh玭g ti襫 kh玭g th� ng錳 thuy襫", 0);
end;
end;


function StationFun()
	for j = 1, 16 do
		AddStation(j)
	end
	Count = GetStationCount();
	Num = Count;
	if (Count > 10) then
		Num = 10
	end
	StationB = {}
	nValidCount = 1

	for i = 1, Num do
		StationId = GetStation(i, CurStation)
		if (StationId ~= 0) then
			nPrice = GetPrice2Station(CurStation, StationId)
			StationB[nValidCount] = GetStationName(StationId) .. "[" .. nPrice .. " lng]" .. "/SelStation"
			nValidCount = nValidCount + 1
		end
	end
	StationB[nValidCount] = "Kh玭g 甶 u c� /OnCancel";

	if (nValidCount == 1) then 
		Say("Xin l鏸!  Ta ch� c� th� a ngi n nh鱪g n琲  甶 qua nh璶g ngi ch璦 甶 u c�! ", 0);
	else
		Say("Xin l鵤 ch鋘: ", nValidCount, StationB);
	end
end

function SelStation(nSel)
	Count = GetStationCount()
	nStation = GetStation(nSel + 1, CurStation)
	nPrice = GetPrice2Station(CurStation, nStation)
	if (PrePay(nPrice) == 1 or GetCamp() == 6) then
		nW, nX, nY = GetStationPos(nStation);
		nResult = NewWorld(nW, nX , nY );
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
		Msg2Player("Ng錳 y猲 ch璦? Ch髇g ta 甶<color=green> "..GetStationName(nStation).."!")
		if (nResult == 2) then
			--Msg2Player("服务器转换中...")
		end
		if (nResult == 0) then
			Msg2Player("Nh藀 甶觤 c� sai s鉻!")
		end
	--襲 ch豱h reset 5h ch琲 - Modified by DinhHQ - 20110630
	local nSongJinCount = PlayerFunLib:GetTaskDailyCount(1926)
	if nSongJinCount >= 1 or tbCOT_Party:GetDailyTaskCount() >= 1 then
		SetTireTime(0)
	end

	else
		Say("Kh玭g ti襫 kh玭g th� ng錳 xe! ", 0)
	end
end

function TownPortalFun()			-- 返回要2000两银子（原地点）　　（BY: Dan_Deng 2004-04-30）
--	if (PrePay(2000) == 1 or GetCamp() == 6) then
		ReturnFromPortal()
--	else
--		Say("Th藅 ng筰 kh玭g c� ti襫 th� kh玭g th� 甶 u 頲", 0)
--	end
end;

function SelWayPoint(nSel)			-- 返回要1000两银子（洞口）　　　（BY：Dan_Deng 2004-04-30）
--	if (PrePay(1000) == 1 or GetCamp() == 6) then
		nWayPoint = GetWayPoint(nSel + 1);
		if (nWayPoint ~= 0) then
			nW, nX, nY = GetWayPointPos(nWayPoint)
			nFightState = GetTerminiFState(nWayPoint)
			nResult = NewWorld(nW, nX, nY)
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
			SetFightState(nFightState)
--			Msg2Player("Goto"..GetWayPointName(nWayPoint)..nW..nX..nY);
			if (nResult == 2) then
--				Msg2Player("Ph鬰 v� kh� chuy觧 i trung...")
			end
			if (nResult == 0) then
--				Msg2Player("Truy襫 v祇 甶觤 c� sai l莔.")
			end
		end;
--	else									-- 不够钱就拒绝
--		Say("Th藅 ng筰 kh玭g c� ti襫 th� kh玭g th� 甶 u 頲", 0);
--	end;
end

--城战是否开始了
function WhichWarBegin()
	for i = 1,7 do
		if (HaveBeginWar(i) ~= 0) then
			return i;
		end;
	end;
	return 0;
end;

function CancelGoCityWar()
	Say("Chi課 trng o Ki誱 v� t譶h!  Xin ngh躠 s� h穣 quay v�  b秓 to祅 t輓h m筺g", 0);
end;

function GoCityWar()
	CityID = WhichWarBegin();
	if (CityID >= 1 and CityID <= 7) then
		Tong1, Tong2 = GetCityWarBothSides(CityID);
		str = format("Hi謓 t筰 %s 產ng ti課 h祅h c玭g th祅h chi課, b猲 c玭g<%s>, b猲 th�<%s>, xin h醝 ngi mu鑞 tham chi課 b猲 n祇?", GetCityAreaName(CityID), Tong1, Tong2);
		Say(str , 3, "B猲 c玭g/GoCityWarAttack", "B猲 th� /GoCityWarDefend", "Kh玭g b猲 n祇 h誸/CancelGoCityWar");
	end;
end;

--去攻城战守方入口
function GoCityWarDefend()
	CityID = WhichWarBegin();
	if (CityID == 0 ) then 
		return
	end;

	TongName, result = GetTong()
	Tong1, Tong2 = GetCityWarBothSides(CityID);
	if (Tong2 ~= TongName and GetItemCountEx(CardTab[CityID * 2]) < 1) then 
		if (GetTask(TV_CITYID) ~= CityID or GetTask(TV_VALUE) ~= 1 or GetTask(TV_TASKID) ~= MISSIONID) then
			Say("Th﹏ ph薾 ngh躠 s� ch璦 ph� h頿!  T筰 h� kh玭g d竚 m筼 mu閕 a v祇!  Xin ngh躠 s� quay v�! ", 0);
			return
		end;
	end;
	
	if (random(0,1) == 1) then
		NewWorld(222, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
	else
		NewWorld(222, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
	end;
end;

--去攻城战攻方入口
function GoCityWarAttack()
	CityID = WhichWarBegin();
	if (CityID == 0) then 
		return
	end;

	TongName, result = GetTong()
	Tong1, Tong2 = GetCityWarBothSides(CityID);
	if (Tong1 ~= TongName and GetItemCountEx(CardTab[CityID * 2 - 1]) < 1) then
		if (GetTask(TV_CITYID) ~= CityID or GetTask(TV_VALUE) ~= 2 or GetTask(TV_TASKID) ~= MISSIONID) then
			Say("Th﹏ ph薾 ngh躠 s� ch璦 ph� h頿!  T筰 h� kh玭g d竚 m筼 mu閕 a v祇!  Xin ngh躠 s� quay v�! ", 0);
			return
		end
	end
	
	if (random(0,1) == 1) then
		NewWorld(223, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
	else
		NewWorld(223, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
	end;

end;

function GoDemoWar()
	Say("C玭g th祅h 產ng s緋 b総 u!  Ngi c� mu鑞 tham gia kh玭g?", 3,"Ta tham gia b猲 th�!/GotoDefend", "Ta tham gia b猲 c玭g/GotoAttack", "Ch璦 chu萵 b� t鑤, l莕 sau 甶!/OnCancel") 
end;

function GotoDefend()
if (random(0,1) == 1) then
	NewWorld(222, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
else
	NewWorld(222, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
end;
end;

function GotoAttack()
	if (random(0,1) == 1) then
		NewWorld(223, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
	else
		NewWorld(223, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
	end;
end;

-- 去洗点地图
function GotoClearSkillMap()
	-- 暂时屏蔽去洗点地图的功能
	-- Say("车夫：免费去洗髓岛的机会只有一次。你最好还是先熟悉一下这次的技能调整，迟一点再去吧。", 1, "知道了/gotocsm_no")

	nSubWorldID = SubWorldIdx2ID();
	nCityIndex = CSP_GetCityIndexByCityMap(nSubWorldID);
	if (nCityIndex == -1) then
		return -1;
	end
	
	CSP_EnterClearMap(nCityIndex);	
end;

function gotocsm_no()
end;

function OnCancel()
end;

function goto_shijiangu()
	NewWorld(949, floor(51264 / 32), floor(102368 / 32))
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
end

function _GoELangGu()
	Msg2Player("Х n 竎 Lang C鑓!")
	local tbTargetMapList = {[11] = 950, [1] = 951, [37] = 952, 
										[176] = 953, [162] = 954, [78] = 955, [80] = 956,}
	local nMapId = GetWorldPos()
	if tbTargetMapList[nMapId] then
 		NewWorld(tbTargetMapList[nMapId], 1592, 3195)
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 
 	end
end

CITY_OPTIONS =
{
	{"Nh鱪g n琲  甶 qua", 				WayPointFun}, 			-- 1
	{"Nh鱪g th祅h th�  甶 qua",				StationFun},			-- 2
	{"Tr� l筰 a 甶觤 c� ",				TownPortalFun}, 		-- 3
	{" Hoa s琻 c秐h k� trng",			go_HSBattle}, 			-- 4
	{" Chi課 trng c玭g th祅h",				GoCityWar},				-- 5
	{" c玭g th祅h hu蕁 luy謓 chi課 trng ",			GoDemoWar},				-- 6
	{" o T葃 T駓",				GotoClearSkillMap},		-- 7
	{" n n琲 l祄 nhi謒 v� D� T萿",		tl_moveToTaskMap},		-- 8
	{" n琲 c bi謙 l祄 Nhi謒 v� T輓 S� ",	messenger_wagoner},     -- 9
	--{" V� Danh C玞",				GotoAnonymVale},			--10
	--{"Xin h穣 a ta n Chi課 Long чng",		OnGoToNewLiangShuiDong},-- 10
	--{" Ki誱 Gia M� Cung",				goto_shijiangu},		-- 11
	--{" 竎 Lang C鑓",				_GoELangGu},
}

-- 城市车夫通用脚本
-- 注意：攻城战未使用此函数的脚本 [script\missions\citywar_city\zhongzhuan_map\chefu.lua]
function CityStationCommon(szMsg)	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = szMsg

	--弹出对话框
	for i = 1, getn(CITY_OPTIONS) do
		local tb = CITY_OPTIONS[i]
		-- 调用 aryCondition 内的 checkState 过程，检查此对话选项是否符合条件
		if aryCondition[i].checkState() == 1 then
			tbDailog:AddOptEntry(tb[1], tb[2])
		end
	end
	tbDailog:Show()
end;

-- 新手村车夫通用脚本 (注意：南岳镇不是新手村，不调此函数)
function NewcomerStationCommon(szMsg)
--	check_update()					-- 技能更新、门派加标识（2004-05-31）
	if (GetLevel() >= 5) then
		if (WhichWarBegin() ~= 0) then
			Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[5], szStationOp_Cancel)
		elseif (GetGlbValue(2) == 1) then -- 攻城训练战场
			Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[6], szStationOp_Cancel)
		else
			if (GetTask(1021) == 4) then -- 如果接受了野叟任务中寻找地图志的任务
				Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[8], szStationOp_Cancel)
			else
				Say(szMsg, 4, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp_Cancel)
			end
		end;
	else		
		Talk(1,"","B猲 ngo礽 r蕋 lo筺 l筩, xem b� d筺g kh玭g c秐 頲 gi� c馻 ngi th� kh� m� b秓 to祅 t輓h m筺g! ")
	end
end;

function  StationOnCancel()
   Talk(1,"","C� ti襫 th� h穣 quay l筰 nh�! ")
end;

----------------------------------------------

CP_MAPPOS_IN = {1508,3026}
CP_MAPTAB = {
				{396, 397, "Thi誹 L﹎"},
				{398, 399, "Thi猲 Vng"},
				{400, 401, "Л阯g M玭"},
			 	{402, 403, "Ng� чc"},
			 	{404, 405, "Nga Mi"},
			 	{406, 407, "Th髖 Y猲"},
			 	{408, 409, "C竔 Bang"},
			 	{410, 411, "Thi猲 Nh蒼"},
			 	{412, 413, "V� ng"},
			 	{414, 415, "C玭 L玭"}
			 }

function transtoplace()
	Say("H閕 trng thi u v� l﹎ 'Ki謙 xu蕋' s� ti課 h祅h tr薾 u c竎 m玭 ph竔, ngi mu鑞 v祇 kh玭g?", 2, "Ta mu鑞 v祇 khu v鵦 thi u thi u 'Ki謙 xu蕋'/transtoplace_sure", "ьi m閠 l竧 甶!/OnCancel")
end

function transtoplace_sure()

	if (GetLastFactionNumber() == -1) then
		Say("V� l﹎ minh ch� c� l謓h: Gi秈 thi u 'Ki謙 xu蕋' c馻 v� l﹎ m玭 ph竔 ch� h筺 ch� cho 10 i m玭 ph竔 tham gia. Ngi kh玭g c� m玭 ph竔 n祇 h誸 trong v� l﹎, kh玭g th� t飝 ti謓 tham gia 頲, mau gia nh藀 th藀 i m玭 ph竔, r錳 n ng k� sau!", 0)
		return
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--少林
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--天王
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--唐门
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--五毒
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--峨嵋
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--翠烟
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--丐帮
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--天忍
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--武当
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--昆仑
		end
		Msg2Player("B筺  v祇 u trng V� l﹎ ki謙 xu蕋")
	end
end

-- 用于处理一堆选项的对话函数 Say(""...);
-- Edited by peres
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end
	dostring(strMsg)
end


