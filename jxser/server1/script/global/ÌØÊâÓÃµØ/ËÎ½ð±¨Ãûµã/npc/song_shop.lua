
-- 宋金报名点	宋军军需官
-- lixin 2004-12-13
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\global\\特殊用地\\宋金报名点\\npc\\head.lua")
Include("\\script\\global\\特殊用地\\宋金报名点\\npc\\songjin_shophead.lua")

Include("\\script\\global\\global_tiejiang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\battles\\vngbattlesign.lua")

--襲 ch豱h 甶觤 kinh nghi謒 gi韎 h筺 khi i 甶觤 t輈h lu� - Modified by DinhHQ - 20110810
--Limit_Exp = 550000
--Limit_Exp = 700000
tbLimit_Exp = {
						[0] = 700000,
						[3] = 800000,
						[4] = 1000000, 
					};
YUEWANGHUN_STONECOUNT = 100
nState = 0;

function main(sel)
	local nWorld, _, _ = GetWorldPos()
--	if nWorld ~= 162 then
--		Talk(1, "", "Ch鴆 n╪g  ng.")
--		return
--	end
	nOldSW = SubWorld
	SubWorld = SubWorldID2Idx(325)
	if (nState == 0) then
		bt_setnormaltask2type()
		nState = 1;
	end
	battlemapid = BT_GetGameData(GAME_MAPID);
	
	--当前没有任何战役打响
	if (battlemapid <= 0) then
			maintalk()
			return 
	end
	SyncTaskValue(747);--同步玩家的总积分给客户端，用于积分购买功能
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Msg2Player("error"..battlemap)
		return
	end
	
	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	
	if (state == 0 or state == 1) then
		maintalk()
		SubWorld = tempSubWorld;
		return
	else
		Talk(1,"","Qu﹏ Nhu quan: Chi課 tranh 產ng di詎 ra 竎 li謙 ph輆 trc, c竎 v� n猲 t筸 l竛h m閠 ch髏!")
		SubWorld = tempSubWorld;
		return
	end;
	SubWorld = nOldSW;	
end;

function no()
end;

function songshop_sell()
		Sale(98, 4);			
end;

--str1 = "宋军军需官：大家同为大宋子民，你既然决定报效国家，抗击金寇，便可以在我这里用宋金积分<color=yellow>换取经验、岳王魂之石<color>，还可以购买<color=yellow>宋金专用道具<color>。"
--str2 = "如果，你有岳王魂之石的话，还能在我这里炼造岳王剑哦！"
function maintalk()
	
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--弹出对话框
	tbDailog.szTitleMsg = "Qu﹏ Nhu Quan: Ngi c莕 g�?"
	tbDailog:AddOptEntry("Ta mu鑞 mua o c�", songshop_sell)
	tbDailog:AddOptEntry("Ta mu鑞 i 甶觤 kinh nghi謒", exp_exchange)
	tbDailog:AddOptEntry("Ta mu鑞 i trang b� xanh", trangbi_exchange)
	tbDailog:AddOptEntry("S� d鬾g Nh筩 Vng H錸 Th筩h  c luy謓 Nh筩 Vng Ki誱", yuewang_want)
	tbDailog:AddOptEntry("Chi課 trng v� song m穘h tng",wushuangmengjiang)--无双猛将
	--tbDailog:AddOptEntry("C鯽 h祅g tinh l鵦", energy_sale)
	--tbDailog:AddOptEntry("фi B� B秓", duihuangmibao)
	--T筸 ng ki誱 gia m� cung - Modified by DinhHQ - 20110810
	--tbDailog:AddOptEntry("D飊g Nh筩 Vng H錸 Th筩h i l蕐 Ng鋍 Long Anh H飊g Thi誴", talk_yulongtie)
	
	tbDailog:Show()
end

function xunzhang_exchange()
	if( GetLevel() < 40 ) then
		Talk( 1, "", "Qu﹏ Nhu Quan: Ch� c� ngi ch琲 c蕄 t� 50 tr� l猲 m韎 c� th� nh薾 Huy chng .");
		return 0
	elseif ( GetExtPoint(0)==0 ) then
		Talk( 1, "", "Qu﹏ Nhu Quan: Ch� c� ngi ch琲  n筽 th� m韎 c� th� nh薾 Huy chng .");
		return 0
	elseif ( CalcFreeItemCellCount() < 1 ) then
		Talk( 1, "", "H穣 chu萵 b� 1 � tr鑞g  t v祇 1 Huy chng");
		return 0;
	else
		Say("Qu﹏ Nhu Quan: Ngi c� mu鑞 d飊g 500 甶觤 t輈h l騳  i l蕐 Huy chng kh玭g?", 2,"фi l蕐 Huy chng/xunzhang_do", "Hi謓 t筰 kh玭g mu鑞 i/no");
	end
end

function xunzhang_do()
	if nt_getTask(747) < 500 then
		Say("觤 t輈h l騳 kh玭g  500, kh玭g th� nh薾 Huy chng",0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - 500));
	local nidx = AddItem(6,1,1412,1,0,0) --获得宋金勋章
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s Del:500SongJinJiFen\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	Say("Х nh薾 th祅h c玭g 1 Huy chng",0);
end

function exp_exchange()
	--Say("本功能暂不开放，敬请期待！", 0 )
	if( GetLevel() < 40 ) then
		Talk( 1, "", "Qu﹏ Nhu quan: B筺 ch璦 t 頲 c蕄 40, kh玭g th� tham gia chi課 trng, sao c� th� l蕐 甶觤 t輈h l騳 i 甶觤 kinh nghi謒?");
	else
		if (GetTiredDegree() == 2) then
			Say("Qu﹏ Nhu Quan: ng � tr筺g th竔 m謙 m醝, kh玭g th� i 甶觤 kinh nghi謒.",0);
		else
			local tbOpt = 
			{
				"500 甶觤 t輈h l騳/#wantpay(500)", 
				"1000 甶觤 t輈h l騳/#wantpay(1000)",
				 "2000 甶觤 t輈h l騳/#wantpay(2000)",
				  "5000 甶觤 t輈h l騳/#wantpay(5000)",
				   "T蕋 c� 甶觤 t輈h l騳/#wantpay(9999)",
				   "Hi謓 t筰 kh玭g mu鑞 i/no"
			}
			local nDate = tonumber(GetLocalDate("%Y%m%d"))
			local nHM	= tonumber(GetLocalDate("%%H%M"))
			
			
			if  20090925 <= nDate and  nDate <= 20091101 then
			--	tinsert(tbOpt, 5, format("%d点积分/#wantpayex(%d,%d)",80000,80000,0))
			end
			--活动期间(2009/09/25至2009/11/01)从12h30 至 23h30
			
			Say("Qu﹏ Nhu quan: B筺 mu鑞 t鑞 bao nhi猽 甶觤 t輈h l騳  i 甶觤 kinh nghi謒?", getn(tbOpt), tbOpt);
		end;
	end
end;

function wantpayex(mark, nStep)
	
	if GetLevel() < 120 then
		Talk(1, "", format("Y猽 c莡 c莕 %d c蕄 tr� l猲 m韎 c� th� i.", 120))
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(2645, 1, "Ph莕 thng n祔 m鏸 ng祔 ch� c� th� nh薾 1 l莕.", "<") ~= 1 then
		return
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
				
	if gb_GetTask("songjin butianshi2009", 1) ~= nDate then
		gb_SetTask("songjin butianshi2009", 1, nDate)
		gb_SetTask("songjin butianshi2009", 2, 0)
	end
	
	if gb_GetTask("songjin butianshi2009", 2) >= 10 then
		Talk(1, "", "M鏸 ng祔 m鏸 server, 10 ngi nhanh nh蕋 m韎 c� th� i ph莕 thng n祔.")
		return 
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu﹏ Nhu quan: 觤 t輈h l騳 c馻 b筺 kh玭g , mu鑞 nh薾 頲 甶觤 kinh nghi謒", 1, "сng/no");
	elseif (mark == 0) then
		Say("Qu﹏ Nhu quan: Kh玭g c� 甶觤 t輈h l騳 m� mu鑞 i 甶觤 kinh nghi謒 礹, ng l� chuy謓 hoang 阯g.", 1, "сng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		
		local tbItem = {szName="M秐h B� Thi猲 Th筩h (trung)", tbProp={6, 1, 1309, 1, 0, 0}}
		if nStep == 1 then
			if (expchange_limit(mark) == 1) then
				nt_setTask(747, floor(nt_getTask(747) - mark))
				AddOwnExp( bonus);
				Add120SkillExp(bonus);
				
				tbAwardTemplet:GiveAwardByList(tbItem, "MidAutumn,GetItemFromSongjin")
				gb_AppendTask("songjin butianshi2009", 2, 1)
				PlayerFunLib:AddTaskDaily(2645, 1)	
				Msg2Player("<#>B筺  t鑞"..mark.."<#>甶觤 t輈h l騳, i l蕐"..bonus .."<#>甶觤 kinh nghi謒.");
				WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: Х t鑞"..mark.."甶觤 t輈h l騳, i l蕐"..bonus.."甶觤 kinh nghi謒.");
			end
			
			
			
		elseif nStep == 0 then
			Say("Qu﹏ Nhu quan: B筺 c� th� i 頲"..bonus.."觤 kinh nghi謒, x竎 nh i ph秈 kh玭g?", 2, "ng, ta c莕 i/#wantpayex("..mark..",1"..")", "Uhm, в ta suy ngh� l筰!/no")	
		end
		
	end	
end
function wantpay(mark)
	if (mark == 9999) then		--换取所有积分
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu﹏ Nhu quan: 觤 t輈h l騳 c馻 b筺 kh玭g , mu鑞 nh薾 頲 甶觤 kinh nghi謒", 1, "сng/no");
	elseif (mark == 0) then
		Say("Qu﹏ Nhu quan: Kh玭g c� 甶觤 t輈h l騳 m� mu鑞 i 甶觤 kinh nghi謒 礹, ng l� chuy謓 hoang 阯g.", 1, "сng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		Say("Qu﹏ Nhu quan: B筺 c� th� i 頲"..bonus.."觤 kinh nghi謒, x竎 nh i ph秈 kh玭g?", 2, "ng, ta c莕 i/#paymark("..mark..")", "Uhm, в ta suy ngh� l筰!/no")
	end	
end

function paymark(mark)
	if (mark == 9999) then		--换取所有积分
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu﹏ Nhu quan: 觤 t輈h l騳 c馻 b筺 kh玭g , mu鑞 nh薾 頲 甶觤 kinh nghi謒", 1, "сng/no");
	elseif (mark == 0) then
		Say("Qu﹏ Nhu quan: Kh玭g c� 甶觤 t輈h l騳 m� mu鑞 i 甶觤 kinh nghi謒 礹, ng l� chuy謓 hoang 阯g.", 1, "сng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		if (expchange_limit(mark) == 1) then
			nt_setTask(747, floor(nt_getTask(747) - mark))
			AddOwnExp( bonus);
			Add120SkillExp(bonus);
			Msg2Player("<#>B筺  t鑞"..mark.."<#>甶觤 t輈h l騳, i l蕐"..bonus .."<#>甶觤 kinh nghi謒.");
			WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: Х t鑞"..mark.."甶觤 t輈h l騳, i l蕐"..bonus.."甶觤 kinh nghi謒.");
		end
	end
end


function expchange_limit(cost)
	--local ww = tonumber(date("%W"))
	--local yy = tonumber(date("%Y")) - 2000
	local nNumber = tbVNG2011_ChangeSign:GetTransLife()	
	local Limit_Exp = tbLimit_Exp[nNumber]
	if((nt_getTask(1017) + cost) <= Limit_Exp) then
		nt_setTask(1017, nt_getTask(1017) + cost)
		return 1
	else
		Say("Qu﹏ Nhu quan: ng tham lam nh� v藋, trong m閠 tu莕 kh玭g th� i qu�<color=red>"..Limit_Exp.."<color>甶觤 kinh nghi謒 c馻 t輈h l騳", 0)
		return -1
	end
end

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function person_change()
	Say("Qu﹏ Nhu quan: T筰<color=yellow> b秐g b譶h ph萴 x誴 h筺g <color>x誴 h筺g<color=yellow> 5 t猲<color> ngi ch琲 u ti猲 s� nh薾 頲 danh hi謚 c bi謙 v� h譶h tng oai phong", 3, "Xem h譶h tng nh﹏ v藅 nam T鑞g Kim/title_male","Xem h譶h tng nh﹏ v藅 n� T鑞g Kim/title_female","Kh玭g mu鑞 xem u!/no" )
end;

function title_male()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy208\\enemy208_at.spr>H譶h tng nh﹏ v藅 nam T鑞g Kim<link>B譶h ph萴 nh﹏ v藅 nam c� t猲 5 ngi trong b秐g x誴 h筺g s� nh薾 頲 h譶h tng tng 鴑g", 1, "сng/no" );
end

function title_female()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy207\\enemy207_at.spr>H譶h tng nh﹏ v藅 n� T鑞g Kim<link>B譶h ph萴 nh﹏ v藅 n� c� t猲 5 ngi trong b秐g x誴 h筺g s� nh薾 頲 h譶h tng tng 鴑g", 1, "сng/no" );
end

function effect_aura()
	Say("Qu﹏ Nhu quan: T筰<color=yellow> b秐g b譶h ph萴 x誴 h筺g <color>x誴 h筺g <color=yellow>5 t猲<color> nh﹏ v藅 u ti猲 s� nh薾 頲 c hi謚 v遪g tr遪 c bi謙", 6, "Xem мnh Qu鑓 Nguy猲 So竔 c Hi謚/aura_dingguo","Xem An Bang Чi Tng Qu﹏ c Hi謚/aura_anbang","Xem Phi猽 K� Tng Qu﹏ c Hi謚/aura_biaoji","Xem V� L﹎ Trung Lang c Hi謚/aura_yulin","Xem Chi猽 V� Hi謚 髖 c Hi謚/aura_zhaowu","Kh玭g mu鑞 xem u!/no" );
end

function aura_dingguo()
	Describe("<link=image:\\spr\\skill\\others\\title_dg.spr>мnh Qu鑓 Nguy猲 So竔 c Hi謚<link>B譶h ph萴 nh﹏ v藅 x誴 h筺g 1 trong b秐g x誴 h筺g s� nh薾 頲 c hi謚 c馻 v遪g tr遪", 1, "сng/no" );
end

function aura_anbang()
	Describe("<link=image:\\spr\\skill\\others\\title_ab.spr>An Bang Чi Tng Qu﹏ c Hi謚<link>B譶h ph萴 nh﹏ v藅 x誴 h筺g 2 trong b秐g x誴 h筺g s� nh薾 頲 c hi謚 c馻 v遪g tr遪", 1, "сng/no" );
end

function aura_biaoji()
	Describe("<link=image:\\spr\\skill\\others\\title_bj.spr>Phi猽 K� Tng Qu﹏ c Hi謚<link>B譶h ph萴 nh﹏ v藅 x誴 h筺g 3 trong b秐g x誴 h筺g s� nh薾 頲 c hi謚 c馻 v遪g tr遪", 1, "сng/no" );
end

function aura_yulin()
	Describe("<link=image:\\spr\\skill\\others\\title_yl.spr>V� L﹎ Trung Lang c Hi謚<link>B譶h ph萴 nh﹏ v藅 x誴 h筺g 4 trong b秐g x誴 h筺g s� nh薾 頲 c hi謚 c馻 v遪g tr遪", 1, "сng/no" );
end

function aura_zhaowu()
	Describe("<link=image:\\spr\\skill\\others\\title_zw.spr>Chi猽 V� Hi謚 髖 c Hi謚<link>B譶h ph萴 nh﹏ v藅 x誴 h筺g 5 trong b秐g x誴 h筺g s� nh薾 頲 c hi謚 c馻 v遪g tr遪", 1, "сng/no" );
end

function yuewang_want()
	Say("Qu﹏ Nhu quan: T� nh鱪g tinh hoa c� 頲 trong Nh筩 Vng H錸 Th筩h ta ch� t筼 ra Nh筩 Vng Ki誱, c莕 ph秈 t鑞"..YUEWANGHUN_STONECOUNT.."Vi猲 Nh筩 Vng H錸 Th筩h n祔 x竎 nh i ph秈 kh玭g?", 2, "Mu鑞/yuewang_change", "в ta xem l筰/no")
end

function yuewang_change()
	Say("Qu﹏ Nhu quan: Nh筩 Vng Ki誱 chi誱 kh玭g gian trong h祅h trang l� <color=yellow>6 (2 X 3)<color>�, ngi x竎 nh c遪 ch� tr鑞g trong h祅h trang ch璦?", 2, "Mu鑞/yuewang_sure", "в ta x誴 g鋘 h祅h trang /no")
end

function yuewang_sure()
	if (CalcEquiproomItemCount(4, 507, 1, -1) >= YUEWANGHUN_STONECOUNT) then
		ConsumeEquiproomItem(YUEWANGHUN_STONECOUNT, 4, 507, 1, -1)
		AddEventItem(195)
		Say("Qu﹏ Nhu quan: Thanh Nh筩 Vng Ki誱 n祔 r蕋 qu� b竨, ngi ph秈 bi誸 t薾 d鬾g t鑤 y!", 0)
		Msg2Player("B筺 nh薾 頲 Nh筩 Vng Ki誱")
	else
		Say("Qu﹏ Nhu quan: Ngi kh玭g c� nhi襲 Nh筩 Vng H錸 Th筩h, h穣 ki觤 tra l筰 甶! Thanh Nh筩 Vng Ki誱 kh玭g ph秈 ngi n祇 c騨g c� 頲 u.", 0)
	end
end

function ore()
	Sale( 102, 4);
end

function goldenitem_menu()
	Sale( 103, 4);
end
--th猰 i trang b� xanh
function trangbi_exchange()
	if( GetLevel() < 40 ) then
		Talk( 1, "", "Qu﹏ Nhu quan: B筺 ch璦 t 頲 c蕄 40, kh玭g th� tham gia chi課 trng, sao c� th� l蕐 trang b� xanh?");
	else
		if (GetTiredDegree() == 2) then
			Say("Qu﹏ Nhu Quan: ng � tr筺g th竔 m謙 m醝, kh玭g th� i trang b� xanh.",0);
		else
			local tbOpt = 
			{
				"V� kh� (3000 甶觤 t輈h l騳)		/#wanttrangbi(3000,1)", 
				"竚 kh� (3000 甶觤 t輈h l騳)		/#wanttrangbi(3000,7)",
				"D﹜ chuy襫 (3000 甶觤 t輈h l騳)	/#wanttrangbi(3000,9)",
				"竜 gi竝 (2000 甶觤 t輈h l騳)		/#wanttrangbi(2000,2)", 
				"N鉵 (2000 甶觤 t輈h l騳)		/#wanttrangbi(2000,3)",
				"Gi祔 (2000 甶觤 t輈h l騳)		/#wanttrangbi(2000,4)",
				"Th総 l璶g (2000 甶觤 t輈h l騳)		/#wanttrangbi(2000,5)",
				"Bao Tay (2000 甶觤 t輈h l騳)		/#wanttrangbi(2000,6)",
				"Ng鋍 b閕 (2000 甶觤 t輈h l騳)		/#wanttrangbi(2000,8)", 
				"Nh蒼 (2000 甶觤 t輈h l騳)		/#wanttrangbi(2000,10)", 
				"Hi謓 t筰 kh玭g mu鑞 i/no"
			}
			Say("Qu﹏ Nhu quan: Hi謓 b筺 c� <color=yellow>"..nt_getTask(747).."<color> 甶觤 t輈h l騳 b筺 mu鑞 d飊g 甶觤 t輈h l騳 i trang b� xanh n祇?", getn(tbOpt), tbOpt);
		end;
	end
end;
function wanttrangbi(mark,n)
	if( mark > nt_getTask(747) ) then
		Say("Qu﹏ Nhu quan: 觤 t輈h l騳 c馻 b筺 kh玭g , mu鑞 nh薾 頲 trang b� xanh", 1, "сng/no");
	elseif (mark == 0) then
		Say("Qu﹏ Nhu quan: Kh玭g c� 甶觤 t輈h l騳 m� mu鑞 i trang b� xanh 礹, ng l� chuy謓 hoang 阯g.", 1, "сng/no");
	else
		Say("Qu﹏ Nhu quan: B筺 c� th� i 頲 trang b� xanh, x竎 nh i ph秈 kh玭g?", 2, "ng, ta c莕 i/#paymarkTB("..mark..","..n..")", "Uhm, в ta suy ngh� l筰!/no")
	end	
end
function paymarkTB(mark,n)
	if( mark > nt_getTask(747) ) then
		Say("Qu﹏ Nhu quan: 觤 t輈h l騳 c馻 b筺 kh玭g , mu鑞 nh薾 頲 trang b� xanh", 1, "сng/no");
	elseif (mark == 0) then
		Say("Qu﹏ Nhu quan: Kh玭g c� 甶觤 t輈h l騳 m� mu鑞 i trang b� xanh 礹, ng l� chuy謓 hoang 阯g.", 1, "сng/no");
	else
		nt_setTask(747, floor(nt_getTask(747) - mark))

		trangbi(n)

		Msg2Player("B筺  t鑞 "..mark.." 甶觤 t輈h l騳, i l蕐 trang b� xanh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: Х t鑞"..mark.."甶觤 t輈h l騳, i l蕐 trang b� xanh.");
	end
end
function trangbi(nsel)
	he = random(0,4)
	gioi = GetSex()
	tylemm = random(50,100)
	if nsel == 1 then --vu khi		nam su sai chung
		q = random(0,5)
		AddItem(0,0,q,10,he,tylemm,10)
	elseif nsel == 2 then --ao giap		nam: 0 - 6, Nu: 7 - 13
		if gioi == 0 then w = random(0,6)
		else w = random(7,13) end
		AddItem(0,2,w,10,he,tylemm,10)
	elseif nsel == 3 then --non		nam: 0 - 6, Nu: 7 - 13
		if gioi == 0 then w = random(0,6)
		else w = random(7,13) end
		AddItem(0,7,w,10,he,tylemm,10)
	elseif nsel == 4 then --giay		nam: 0 - 1, Nu: 2 - 3
		if gioi == 0 then w = random(0,1)
		else w = random(2,3) end
		AddItem(0,5,w,10,he,tylemm,10)
	elseif nsel == 5 then	--that lung		nam su sai chung
		w = random(0,1)
		AddItem(0,6,w,10,he,tylemm,10)
	elseif nsel == 6 then --bao tay		nam: 1, Nu: 0
		if gioi == 0 then w = 1
		else w = 0 end
		AddItem(0,8,w,10,he,tylemm,10)
	elseif nsel == 7 then --am khi		nam su sai chung
		w = random(0,2)
		AddItem(0,1,w,10,he,tylemm,10)
	elseif nsel == 8 then 	--ngoc boi		nam: 1, Nu: 0
		if gioi == 0 then w = 1
		else w = 0 end
		AddItem(0,9,w,10,he,tylemm,10)
	elseif nsel == 9 then --day chuyen	nam: 1, Nu: 0
		if gioi == 0 then w = 1
		else w = 0 end
		AddItem(0,4,w,10,he,tylemm,10)
	elseif nsel == 10 then --nhan		nam su sai chung
		AddItem(0,3,0,10,he,tylemm,10)		
	end
end
