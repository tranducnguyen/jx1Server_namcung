--AddEventItem(489)风陵渡领牌
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

MISSIONID = 15			--未定
FRAME2TIME = 18;		--18帧游戏时间相当于1秒钟
boatMAPS = {337, 338, 339};		--南岸渡船地图依顺序为，337南岸上游、338中游、339下游
boatMAP_POS = {1646, 3233}
northMAP = 336
northMAP_POS = {{1158, 2964}, {1343, 2868}, {1482, 2796}}
TNPC_THIEF = {724, 725}
TNPC_THIEF_COUNT = 30
npcthiefpos = "\\settings\\maps\\中原北区\\渡船\\渡船刷怪点.txt"
FLD_TIMER_1 = 20 * FRAME2TIME	--每20秒公布一下战况
FLD_TIMER_2 = 39 * 60 * FRAME2TIME		--从报名到进入打宝地图40分钟
ENDSIGN_TIME = 10 * 60 * FRAME2TIME/FLD_TIMER_1		--报名时间结束
UPBOSS_TIME = 25 * 60 * FRAME2TIME/FLD_TIMER_1		--开打15分钟时产生第1个BOSS
UPBOSS_TIME2 = 30 * 60 * FRAME2TIME/FLD_TIMER_1		--开打20分钟时产生第2个BOSS
UPBOSS_TIME3 = 35 * 60 * FRAME2TIME/FLD_TIMER_1		--开打25分钟时产生第3个BOSS
REPORT_TIME = 38 * 60 * FRAME2TIME/FLD_TIMER_1 
HUOYUEDU_TIME = 3 * 60 * FRAME2TIME/FLD_TIMER_1 -- 活跃度获得时间，船开启后的3分钟

MS_STATE = 1
MS_TIMEACC_1MIN = 2
MS_TIMEACC_20SEC = 3




function fld_cancel()
end

function fld_wanttakeboat(addr)

	-- Gia nh藀 m玭 ph竔 m韎 l猲 thuy襫 Modified - by AnhHH - 20110724
	if (GetLastFactionNumber() == -1)then
		Talk(1,"","Чi hi謕 ch璦 gia nh藀 m玭 ph竔 kh玭g th� l猲 thuy襫")
		return
	end
	
	local orgworld = SubWorld
	local MapId = boatMAPS[addr]
	if (MapId <= 0) then
		print("error:fenglingdu script wrong! mapid is nil!")
		return
	end
	local idx = SubWorldID2Idx(MapId)		
	if (idx < 0) then
		Say("Xin l鏸! Ph輆 trc 產ng c� nguy hi觤! T筸 th阨 ch璦 th� l猲 thuy襫!.",0)
		return
	end
	if (fld_haveroom() == 1) then
		return
	end
	local sz_msg = "Mu鑞 n thuy襫 n b� B綾 Phong L╪g ч ph秈 c� Phong L╪g ч l謓h b礽 ho芻 ngi a ta <color=red>200<color> cu鑞 M藅  th莕 b�, ta s� cho ngi l猲 thuy襫!";
	local str = {	
		"Ta c� l謓h b礽 Phong L╪g ч/use_lingpai",
		"Ta  thu th藀  200 cu鑞 M藅  th莕 b�/use_juanzhou",
		"в ta suy ngh� l筰!/fld_cancel",
			};
	--襲 ch豱h th阨 gian phong l╪g  t鑞 ph� - Modified by DinhHQ - 20110504
	if (check_new_shuizeitask() == 1) then
		sz_msg = format("M鏸 ng祔 v祇 l骳 10:00,14:00,16:00,18:00,20:00,c莕 ph秈 c� %s m韎 c� th� 甶 tham gia B� B綾 Phong L╪g ч, sau khi thu薾 l頸 vt qua s� c� ph莕 thng", "L謓h B礽 Th駓 T芻");
		str = {	
		format("Ta c� %s/use_suizeilingpai", "L謓h B礽 Th駓 T芻"),
		"в ta suy ngh� l筰!/fld_cancel",
			};
	end
	
	if (addr == 1) then
		Say(" "..sz_msg, getn(str), str);
	elseif (addr == 2) then
		Say(" "..sz_msg, getn(str), str);
	elseif (addr == 3) then
		Say(" "..sz_msg, getn(str), str);
	end
end



function fld_TakeBoat(plindex)
	orgplayerindex = PlayerIndex
	PlayerIndex = plindex

	local orgworld = SubWorld
	if ( BOATID == 1 ) then
		boatmapid = 337
		idx = SubWorldID2Idx(boatmapid)
	elseif( BOATID == 2 ) then
		boatmapid = 338
		idx = SubWorldID2Idx(boatmapid)
	elseif ( BOATID == 3 ) then
		boatmapid = 339
		idx = SubWorldID2Idx(boatmapid)
	else
		return 0
	end

	oldsubworldindex = SubWorld
	SubWorld = SubWorldID2Idx(boatmapid)
	if (fld_haveroom() == 1) then
		return 0
	end
	t = 10 - GetMissionV(MS_TIMEACC_1MIN)
	if (t <= 0) then
		return 0
	end
	LeaveTeam()
	--DinhHQ
	--20110405: Fix bug, ngo礽 th阨 gian 13h, 15h, 17h, 19h b課 2 3 c� th� pk c鮱 s竧
	if (check_new_shuizeitask() == 1) then
		if ( BOATID ~= 1 ) then
			SetTaskTemp(200,1);
			ForbidEnmity(1);			
		end		
	end
	SetCurCamp(1);	
--	if ( BOATID ~= 1 ) then
--		ForbidEnmity(1);
--		SetCurCamp(1);
--	end
	
--	SetTaskTemp(200,1);
	SetFightState(0)
	posx, posy = fld_getadata(npcthiefpos)
	posx = floor(posx/32)
	posy = floor(posy/32)
	AddMSPlayer(MISSIONID,1)
	NewWorld(boatmapid, posx, posy)
	Msg2Player("c遪"..t.." ph髏 thuy襫 r阨 b課, n b� B綾 Phong L╪g ч")
	DisabledUseTownP(1)	--限制其在渡船内使用回城符
	SetRevPos(175,1);		--设置重生点在西山村
	SetLogoutRV(1)
	SetCreateTeam(0);
	SetDeathScript("\\script\\missions\\fengling_ferry\\fld_death.lua")
	SubWorld = oldsubworldindex
	PlayerIndex = orgplayerindex
	return 1
end

function fld_haveroom()
	if (GetMSPlayerCount(MISSIONID, 1) >= 100 ) then
		if (BOATID == 1) then
			Say("Ngi n tr� r錳! Thuy襫  y r錳, h穣 ch� chuy課 sau 甶!", 0)
			return 1
		elseif (BOATID == 2) then
			Say("Ngi  n tr�! Thuy襫  y r錳, h穣 ch� chuy課 sau 甶!", 0)
			return 1
		elseif (BOATID == 3) then
			Say("Ngi  n tr�! Thuy襫  y r錳, h穣 ch� chuy課 sau 甶!", 0)
			return 1
		end
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function fld_landingpos(posation)
	if (posation <= 0 and posation >3) then
		print("error: i still not know why!")
		return
	end
	return northMAP, northMAP_POS[posation][1], northMAP_POS[posation][2]
end

function fld_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

-- 神秘卷轴交付界面
function	use_juanzhou()	--使用神秘卷轴
	GiveItemUI( "Giao M藅  th莕 b� ", "t 200 cu鑞 M藅  th莕 b� v祇 � ph輆 di, b筺 ph秈 ch� �, n誹 M藅  th莕 b� trong � 輙 h琻 ho芻 nhi襲 h琻 200 cu鑞 ta s� kh玭g nh薾.", "exchange_juanzhou", "no" );
end;

-- 确定神秘卷轴数量函数
function exchange_juanzhou(ncount)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("M藅  th莕 b� h譶h nh� kh玭g ng! H穣 ki觤 tra l筰 xem.", 2, "�! Th� ra t nh莔  ta th� l筰./use_juanzhou", "в ta ki觤 tra xem sao/no")
		return
	end
	if (scrollcount > 200) then
		Say("Ta ch� c莕 200 cu鑞 M藅  th莕 b�, c遪 l筰 ngi 甧m v� 甶!", 2, "�! Th� ra t nh莔  ta th� l筰./use_juanzhou", "в ta ki觤 tra xem sao/no")
		return
	end
	if (scrollcount < 200) then
		Say("M藅  th莕 b� ch璦 ! H穣 th� l筰 xem!", 2, "�! Th� ra t nh莔  ta th� l筰./use_juanzhou", "в ta ki觤 tra xem sao/no")
		return
	end
	if (scrollcount == 200) then
		if (fld_TakeBoat(PlayerIndex) ~= 1) then
			Say("Th阨 gian kh玭g i ai c�! Thuy襫  甶 r錳, l莕 sau ngi h穣 quay l筰!", 0)
			return
		end
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
	end;		
end;


-- 风陵渡令牌交付界面
function	use_lingpai()	--使用风陵渡令牌
	GiveItemUI( format("Giao di謓 giao ph� %s L謓h B礽", "L謓h b礽 Phong L╪g ч"), format("D飊g 1 c竔 %s t v祇 � tr鑞g ph輆 di. N?u ngi l蕐 nh鱪g th� r竎 ri kh竎 t v祇, ta s� kh玭g th蘭 nh薾", "L謓h b礽 Phong L╪g ч"), "exchange_lingpai_1", "no" );
end;

function use_suizeilingpai()
--Modified By DinhHQ - 20110930
	GiveItemUI( format("Giao di謓 giao ph� %s L謓h B礽", "L謓h B礽 Th駓 T芻"), format("D飊g 1 c竔 %s t v祇 � tr鑞g ph輆 di. N?u ngi l蕐 nh鱪g th� r竎 ri kh竎 t v祇, ta s� kh玭g th蘭 nh薾", "L謓h B礽 Th駓 T芻"), "exchange_lingpai_2", "no", 1 );
end

function exchange_lingpai_1(ncount)
	exchange_lingpai(ncount, 1)
end

function exchange_lingpai_2(ncount)
	exchange_lingpai(ncount, 2)
end

-- 确定
function exchange_lingpai(ncount, ntype)
	if (ncount == 0) then
		Say("H�! Kh玭g c� l謓h b礽 m� mu鑞 ng錳 thuy襫?", 0)
		return
	end
	
	if (ncount > 1) then
		Say("Kh玭g ph秈 ta b秓 ngi ng t lung tung hay sao?", 0)
		return
	end

	local nItemIdx = GetGiveItemUnit(1);
	local nStackCount = GetItemStackCount(nItemIdx);
	
	if (nStackCount > 1) then
		Say("Thuy襫 Phu B� Nam:  Ta ch� c莕 m閠 c竔 L謓h B礽, nh鱪g th� kh竎 ta kh玭g c莕", 0)
		return
	end
	
	local itemgenre, detailtype, particular = GetItemProp(nItemIdx);
	
	if (ntype ==1) then
		if (itemgenre ~= 4 or detailtype ~= 489) then
			Say(format("Thuy襫 Phu B� Nam:  Ta ch� c莕 m閠 c竔 L謓h B礽, nh鱪g th� kh竎 ta kh玭g c莕", "L謓h b礽 Phong L╪g ч"), 2, "�! Th� ra t nh莔  ta th� l筰./use_lingpai", "в ta ki觤 tra xem sao/no")
			return
		end
	else
		if (itemgenre ~= 6 or particular ~= 2745) then
			Say(format("Thuy襫 Phu B� Nam:  Ta ch� c莕 m閠 c竔 L謓h B礽, nh鱪g th� kh竎 ta kh玭g c莕", "L謓h B礽 Th駓 T芻"), 2, "�! Th� ra t nh莔  ta th� l筰./use_suizeilingpai", "в ta ki觤 tra xem sao/no")
			return
		end
	end
	
	if (fld_TakeBoat(PlayerIndex) ~= 1) then
		Say("Th阨 gian kh玭g i ai c�! Thuy襫  甶 r錳, l莕 sau ngi h穣 quay l筰!", 0)
		return
	end
	
	RemoveItemByIndex(nItemIdx);
	if particular == 2745 then
		AddStatData("shuizeilingpai_shiyongshuliang", 1)	--数据埋点第一期
	end
	tbLog:PlayerActionLog("EventChienThang042011","BaoDanhPhongLangDo")	-- 报名日志
	--ghi log t輓h n╪g key - Modified By DinhHQ - 20120410
	if particular == 2745 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiThuyTac")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiPLD")
	end
end;

function check_new_shuizeitask()
	local nHour = tonumber(GetLocalDate("%H"));
	--襲 ch豱h th阨 gian phong l╪g  t鑞 ph� - Modified by DinhHQ - 20110504
	local tb_sptime = {
		[10] = 1,
		[14] = 1,
		[16] = 1,
		[18] = 1,
		[20] = 1,
	};
	if (tb_sptime[nHour] and tb_sptime[nHour] == 1) then
		return 1
	else
		return 0
	end
end	

function no()
end;
