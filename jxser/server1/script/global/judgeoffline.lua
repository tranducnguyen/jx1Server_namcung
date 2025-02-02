--用户选择离线托管时的脚本
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua");
Include("\\script\\global\\judgeoffline_limit.lua");		-- 2006年10月30日加入限制在所有城市车夫旁和天王帮托管的脚本  by peres
Include("\\script\\item\\ib\\zimudai.lua");
Include("\\script\\lib\\player.lua")
Include("\\script\\trip\\define.lua")

arraymap = 
	{
		["1"] = "Phng Tng",
		["11"] = "Th祅h Й",
		["37"] = "Bi謓 Kinh",
		["80"] = "Dng Ch﹗",
		["78"] = "Tng Dng",
		["162"] = "Чi L�",
		["176"] = "L﹎ An",
		["20"] = "Giang T﹏ Th玭",
		["53"] = "Ba L╪g huy謓",
		["54"] = "Nam Nh筩 tr蕁",
		["99"] = "V躰h L筩 tr蕁",
		["100"] = "Chu Ti猲 tr蕁",
		["101"] = "Чo Hng th玭",
		["121"] = "Long M玭 tr蕁",
		["153"] = "Th筩h C� tr蕁",
		["174"] = "Long Tuy襫 th玭",
		["13"] = "Nga Mi",
		["25"] = "Л阯g M玭",
		["49"] = "Thi猲 Nh蒼",
--		["59"] = "天王",
		["81"] = "V� ng",
		["103"] = "Thi誹 L﹎",
		["115"] = "C竔 Bang",
		["131"] = "C玭 L玭",
		["154"] = "Th髖 Y猲",
		["183"] = "Ng� чc",
--		["208"]	= "大牢",	--by 子非鱼 2007/11/13 禁止大牢托管
		-- LLG_ALLINONE_TODO_20070802
		["235"] = "Уo Hoa o (1) ",
		["236"] = "Уo Hoa o (2) ",
		["237"] = "Уo Hoa o (3) ",
		["238"] = "Уo Hoa o (4) ",
		["239"] = "Уo Hoa o (5) ",
		["240"] = "Уo Hoa o (6) ",
		["241"] = "Уo Hoa o (7) ",
		["835"] = "V� Danh C鑓 (1)",
		["836"] = "V� Danh C鑓 (2)",
		["837"] = "V� Danh C鑓 (3)",
		["838"] = "V� Danh C鑓 (4)",
		["839"] = "V� Danh C鑓 (5)",
		["840"] = "V� Danh C鑓 (6)",
		["586"] = "Khu v鵦 bang h閕 chung",
		["587"] = "Khu v鵦 bang - Th祅h Й",
		["588"] = "Khu v鵦 bang - Чi L�",
		["589"] = "Khu v鵦 bang - Phng Tng",
		["590"] = "Khu v鵦 bang - L﹎ An",
		["591"] = "Khu v鵦 bang - Tng Dng",
		["593"] = "Khu v鵦 bang - Dng Ch﹗",
		["594"] = "Khu v鵦 bang - Bi謓 Kinh",
		["595"] = "Khu v鵦 bang h閕 chung",
		["596"] = "Khu v鵦 bang h閕 chung",
		["597"] = "Khu v鵦 bang h閕 chung",
	};

function judgeoffline(player_count, offline_count)
		
	-- szHour = date("%H");
	-- nHour = tonumber(szHour);
	
	-- sparetime = GetTask(AEXP_TASKID);	
	-- if (nHour >= AEXP_INVALIDTIMEBEGIN and nHour < AEXP_INVALIDTIMEEND) then 
	-- 		Say("<#>你在<color=red>"..AEXP_INVALIDTIMEBEGIN..":00<color>-<color=red>"..AEXP_INVALIDTIMEEND..":00<color>时间段内选择离线托管，可以继续摆摊交易，但是不会获得经验值，不会自动领取福缘。这个时间段系统不会扣除你的离线托管时间，而你的可进行游戏时间则会继续计算。", 2, "你确定要进入离线托管吗?/judgecontion", "暂时不要了。/donothing");
	-- 		return 5
	-- else
	--     judgecontion();
	-- end 	
	judgecontion();
	
	return 0
end

function judgecontion()
	--do
		--Talk(1, "", "离线托管功能关闭")
		--return
	--end

	--如果到达这一步那么成功开始离线托管
	local tbSpareTime = {};
										--特效大白驹丸	普通大白驹丸	白驹丸
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--特效技能大白驹丸	技能大白驹丸	技能白驹丸
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local btime = 0;
	for i = 1, getn(tbAexpTask) do
		tbSpareTime[i] = {};
		tbSpareTime[i][1] = GetTask(tbAexpTask[i]);
		tbSpareTime[i][2], tbSpareTime[i][3] = getFrame2MinAndSec(tbSpareTime[i][1]);	--给用户提示显示到分钟
		if (tbSpareTime[i][1] >= FRAME2TIME * 60 and btime ~= 1) then
			btime = 1;
		end;
	end;
	
	
	if (btime == 1 and IsCharged() == 1) then
		local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
		local szSkillExpName = "";
		if (nSkillExpID ~= 0) then
			szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
		else
			szSkillExpName = "<color=blue>Ch璦 ch鋘 k� n╪g<color>";
		end
		
		local szmsg = format("Th阨 gian 駓 th竎 r阨 m筺g c遪: Thi猲 tinh b筩h c﹗ ho祅 <color=red>%d<color>ti課g <color=red>%d<color> ph髏"..
	"<enter>Чi B筩h C莡 Ho祅 c Bi謙<color=red>%d<color>gi�<color=red>%d<color>ph髏"..
	"<enter>Чi B筩h C莡 Ho祅 駓 th竎<color=red>%d<color>gi�<color=red>%d<color>ph髏"..
	"<enter>B筩h C莡 Ho祅 駓 th竎<color=red>%d<color>gi�<color=red>%d<color>ph髏"..
	"<enter>ч thu莕 th鬰 k� n╪g(%s): i B筩h C莡 Ho祅 k� n╪g c hi謚<color=red>%d<color>gi�<color=red>%d<color>ph髏"..
	"<enter>Чi B筩h C莡 Ho祅 K� N╪g<color=red>%d<color>gi�<color=red>%d<color>ph髏"..
	"<enter>Bach C莡 Ho祅 K� N╪g<color=red>%d<color>gi�<color=red>%d<color>ph髏"..
	"<enter>Khi 駓 th竎 n誹 nh� c� hi謚 qu� cu� Thi猲 Tinh B筩h C莡 Ho祅, 璾 ti猲 hi謚 qu� c馻 lo筰 B筩h c莡 Ho祅 n祔 v� kinh nghi謒 v� s� tr� 甶 th阨 gian hi謚 qu� tng 鴑g.", 
					tbSpareTime[1][2],tbSpareTime[1][3],
					tbSpareTime[2][2],tbSpareTime[2][3],
					tbSpareTime[3][2],tbSpareTime[3][3],
					tbSpareTime[4][2],tbSpareTime[4][3],
					szSkillExpName, tbSpareTime[5][2],tbSpareTime[5][3],
					tbSpareTime[6][2],tbSpareTime[6][3],
					tbSpareTime[7][2],tbSpareTime[7][3]);
		local szSay =
		{	"B総 u r阨 m筺g v蒼 t╪g kinh nghi謒/beginoffline",
			"Ch鋘 k� n╪g r阨 m筺g v蒼 t╪g kinh nghi謒/#selectofflineskill('judgecontion')",
			"B総 u 駓 th竎 tr猲 m筺g/begin_onlinecommission",
			"D鮪g 駓 th竎 tr猲 m筺g/end_onlinecommission",
			"R阨 m筺g nh薾 thng/offlineaward",
			"в ta suy ngh� l筰/donothing"
		};
		Describe(szmsg, getn(szSay), szSay[1], szSay[2], szSay[3], szSay[4], szSay[5], szSay[6]);
	else
		if (IsCharged() ~= 1) then
			Talk(1, "", "<#>V� ngi kh玭g ph秈 l� t礽 kho秐 n筽 th�, cho n猲 kh玭g th� s� d鬾g t輓h n╪g r阨 m筺g 駓 th竎, xin h穣 n筽 th� r錳 sau  s� d鬾g t輓h n╪g n祔 nh�.");
			return
		end;
		--beginoffline();
		--用户剩余的时间
		Say("<#>Th阨 gian c遪 l筰 駓 th竎 kinh nghi謒 B筩h C莡 Ho祅 c馻 b筺 l�<color=red>0<color>ph髏. Ngi c� th� s� d鬾g Чi B筩h C莡 Ho祅 c Bi謙 ho芻 l� Чi B筩h C莡 Ho祅  t╪g th阨 gian 駓 th竎 c馻 m譶h. <enter>ho芻 l� ch鋘<color=yellow> 駓 th竎 r阨 m筺g mi詎 ph�<color>, c竔 n祔 ch� c� th� nh薾 頲 m閠 ch髏 輙 kinh nghi謒.",
			3,
			"駓 th竎 mi詎 ph�/beginoffline",
			"R阨 m筺g nh薾 thng/offlineaward",
			"в ta suy ngh� l筰/donothing");
	end
end

-- 开始在线托管
function begin_onlinecommission()
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	
	--判断用户剩余的时间
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<#>Th阨 gian 駓 th竎 kinh nghi謒 c馻 ngi c遪 l筰 l� 0 ph髏, ho芻 ch璦 l鵤 ch鋘 r阨 m筺g 駓 th竎 k� n╪g, xin h穣 x竎 nh薾 l筰 r錳 s� d鬾g t輓h n╪g n祔 nh�.", 0);
		return 3
	end

	if (GetOnlineCommissionStatus() ~= 0) then
		Msg2Player("<#>Hi謓 t筰 ngi  駓 th竎 tr猲 m筺g r錳")
	else
		Msg2Player("B筺  trong tr筺g th竔 駓 th竎 tr猲 m筺g")
		SetOnlineCommissionStatus(1)
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tbegin_onlinecommission, last online time:%s",
						GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
		--EnableClientInput(0)
	end
end

-- 结束在线托管
function end_onlinecommission()
	if (GetOnlineCommissionStatus() == 0) then
		Msg2Player("<#>Hi謓 t筰 ngi kh玭g 駓 th竎 tr猲 m筺g")
	else
		SetOnlineCommissionStatus(0)
		--EnableClientInput(1)
		Msg2Player("<#>Ngi  h駓 駓 th竎 tr猲 m筺g")
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tend_onlinecommission, last online time:%s",
							GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
	end
end

function check_if_can_offline()
	
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		Talk(1, "", "Xin i hi謕 lng th� kh玭g th� s� d鬾g t譶h n╪g 駓 th竎 t筰 server c玭g c閚g")
		return 1
	end
	--首先判断用户所在的区域
	mapid = SubWorldIdx2MapCopy(SubWorld);
	strmapid = ""..mapid.."";
	--没有在当前地图上
	if (arraymap[strmapid] == nil) then
		Say("<#>Ngi kh玭g th� th鵦 hi謓 t輓h n╪g 駓 th竎 t筰 khu v鵦 n祔, xin h穣 n m閠 khu v鵦 tng 鴑g ( bao g錷 t蕋 c� c竎 th祅h th� th玭 tr蕁 ) th鵦 hi謓 駓 th竎 r阨 m筺g.", 0);
		return 1
	end
	
	-- 判断是否在某些限制区域，比如说车夫、天王帮等
	if offlineCheckPermitRegion()~=1 then
		Say("<#>в ng l祄 c秐 tr� nh鱪g bc 阯g giang h� h祅h hi謕 c馻 c竎 anh h飊g h祇 ki謙, t鑤 nh蕋 ngi n猲 tr竛h xa nh鱪g n琲 nh� <color=yellow> Xa Phu, Dc 誱,Ti謒 T筽 H鉧 ho芻 l� nh鱪g con 阯g nh� <color>  m� r阨 m筺g 駓 th竎 nh�!", 0);
		return 1;
	end;
	
	--判断用户的战斗状态
	if (GetFightState() ~= 0) then 
		Say("<#>Hi謓 t筰 ngi 產ng trong tr筺g th竔 chi課 u, kh玭g th� 甶 v祇 tr筺g th竔 r阨 m筺g 駓 th竎 頲, xin h穣 tr� l筰 tr筺g th竔 phi chi課 u sau  h穣 ti課 h祅h r阨 m筺g 駓 th竎 nh�.", 0);
		return 2
	end
	
	--判断用户剩余的时间
--	local sparetime = getsparetime();
--	if (sparetime <= 0) then
--		Say("<#>你剩余的离线托管经验时间为0分钟，或者并未选择离线托管的技能，请重新确认后再使用该功能。", 0);
--		return 3
--	end
	
	-- 当一台服务器的人数超过800人，则不允许玩家在这台服务器内进行离线托管
	player_count = GetPlayerCount();
	local nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_LIMIT;
	if (mapid >= 835 and mapid <= 840) then
		nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_SPECIAL;--750
	end;
	if (player_count > nmax_count_limit) then
		Say("<#>Hi謓 t筰 ch� n祔 ngi th藅 l� ng c, hay l� ngi n ch� kh竎 nh� c竎 th玭 tr蕁 hay c竎 m玭 ph竔 r錳 ti課 h祅h 駓 th竎 nh�.",0);
		return 4
	end
	
	
end

function beginoffline()	
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	-- 判断是否在在线托管
	if (GetOnlineCommissionStatus() ~= 0) then
		Say("<#>Xin h穣 t筸 ng璶g 駓 th竎 tr猲 m筺g r錳 sau  ti課 h祅h 駓 th竎 r阨 m筺g.", 0)
		return 1
	end
	-- 开始离线挂机
	OfflineLive(PlayerIndex);
end

--什么都不做的函数，可能多个地方调用到，修改得时候请注意
function donothing()
	
end

TASKID_OFFLINELIVE_EXP = {
	AEXP_SMALL_TIME_TASKID,
	AEXP_TASKID,
	AEXP_SPECIAL_TIME_TASKID,
	AEXP_TIANXING_TIME_TASKID
}

TASKID_OFFLINELIVE_SKILL = {
	AEXP_SMALL_SKILL_TASKID,
	AEXP_SKILL_TIME_TASKID,
	AEXP_SPECIAL_SKILL_TASKID
}

function getsparetime()
	--判断用户剩余的时间
	local nLeftTime = 0
	for i = 1, getn(TASKID_OFFLINELIVE_EXP) do
		nLeftTime = nLeftTime + GetTask(TASKID_OFFLINELIVE_EXP[i])
	end
	if (GetTask(AEXP_SKILL_ID_TASKID) ~= 0) then
		local nTime = 0
		for i = 1, getn(TASKID_OFFLINELIVE_SKILL) do
			nTime = nTime + GetTask(TASKID_OFFLINELIVE_SKILL[i])
		end
		if (nLeftTime < nTime) then
			nLeftTime = nTime
		end
	end
	return nLeftTime
end

-- 选择离线托管技能
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "Xin l鵤 ch鋘 ch鴆 n╪g 駓 th竎:";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Tr� l筰/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- 设置离线托管技能
function onSetUpgradeSkill(nUpgradeSkillID)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	judgecontion();
end

function offlineaward()
	local player = Player:New(PlayerIndex)
	DynamicExecute(
		"\\script\\global\\offlineaward.lua",
		"dlg_offlineaward",
		player)
end
