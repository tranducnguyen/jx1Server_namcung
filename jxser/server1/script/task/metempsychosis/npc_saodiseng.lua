-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - NPC对话处理
-- 文件名　：npc_saodiseng.lua
-- 创建者　：子非魚
-- 创建时间：2009-02-04 16:25:15

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
--Phong V﹏ L謓h B礽 - 襲 ch豱h th阨 gian tr飊g sinh i v韎 c竎 t﹏ th� - Modified By DinhHQ - 20110926
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
-- 被越南强制迁移到 北斗老人处
function beidou_translife_main()
	CreateTaskSay({"<dec><npc>L筰 n 1 ngi n鱝? Xem ra chuy謓 ta t 頲 <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲> kh玭g c遪 l� b� m藅 n鱝 r錳. L� n祇 vi謈 ph� v� c玭g kh玭g l祄 cho thi猲 h� s� h穒 hay sao. Vi謈  nh� th� n祔 r錳, ngi t譵 ta c� vi謈 g�.",
		"Ph� v� c玭g? Ngi ng d鋋 ta ch�?/zhuansheng_ondialog",
		"Ki觤 tra k� n╪g tr飊g sinh 4 c遪 d� 甶觤 k� n╪g/querySkillPoint_4",
		"T葃 甶觤 k� n╪g tr飊g sinh 4/wantClearSkillPoint_4",
		"V� c玭g, t﹎ ph竝 c竔 g�! L筰 th猰 1 k� 甶猲 kh飊g/OnCancel"
		});
end

function zhuansheng_ondialog()
	if (GetTask(TSK_ZHUANSHENG_FLAG) == 1) then
		Msg2Player("Х h鋍 <B綾 u Trng Sinh Thu藅 - C� S� Thi猲>");
	end
	
	local tbOpp = {"<dec><npc>Kh玭g sai, l� n祇 ngi kh玭g bi誸? Tu luy謓 B綾 u Trng Sinh Thu藅 xong. C蕄 b薱 c馻 i hi謕 s� th祅h c蕄 10, t蕋 c� k�  n╪g v� c玭g s� b� ph�, t n c蕄 b薱 tng 鴑g  m韎 c� th� h錳 ph鬰 (c蕄 90, 120 s� kh玦 ph鬰 c竎 k� n╪g v鑞 c�). Ngo礽 ra, s� b秓 l璾 t蕋 c� nh鱪g 甶觤 k� n╪g v� ti襪 n╪g c馻 i hi謕.<enter> N鉯 chung, i hi謕 c莕 b総 u t� u. Nh璶g c騨g ng  qu� n玭 n鉵g, i ngi l猲 c蕄 120 130 s� t竔 xu蕋  giang h�, thi猲 h� n祔 v蒼 l� thi猲 h� c馻 ngi m�."};
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	if (n_transcount == 0 and n_level == 199 and (n_date >= ZHUANSHENG_ITEM_BEGIN and n_date <= ZHUANSHENG_ITEM_ENDLE)) then --需要加入时间限制
		tinsert(tbOpp, "Ta mu鑞 t譵 hi觰 v� B綾 u Ti猲 Кn/zhuansheng_xiandan");
	end
	
	tinsert(tbOpp, "Xin h醝 tu luy謓 <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲> c莕 nh鱪g 甶襲 ki謓 g�?/zhuansheng_help_require");
	tinsert(tbOpp, "L祄 th� n祇 c� th� h鋍 <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲>?/zhuansheng_help_method");
	tinsert(tbOpp, "Xin h醝 ng c蕄 c馻 ta c� th� l璾 gi� bao nhi猽 甶觤 k� n╪g v� ti襪 n╪g?/zhuansheng_help_prop");
	tinsert(tbOpp, "Xin h醝 ta c� th� tu luy謓 n m鴆  n祇 r錳?/zhuansheng_query");
	tinsert(tbOpp, "Xin h醝 th阨 gian  chuy觧 sinh l莕 k� ti誴: /zhuansheng_time");
	tinsert(tbOpp, "K誸 th骳 i tho筰/OnCancel");
	
	CreateTaskSay(tbOpp);
end

--转生的条件
function zhuansheng_help_require()
	
	CreateTaskSay({"<dec><npc>襲 ki謓 r蕋 n gi秐"
		.."<enter>  ".."1. Y猽 c莡 ng c蕄 tr飊g sinh:"
		.."<enter>    "..format("L莕 tr飊g sinh th� %d, ng c蕄 kh玭g 頲 nh� h琻 %d", 1, TB_LEVEL_LIMIT[1])
		.."<enter>    "..format("L莕 tr飊g sinh th� %d, ng c蕄 kh玭g 頲 nh� h琻 %d", 2, TB_LEVEL_LIMIT[2])
		.."<enter>    "..format("L莕 tr飊g sinh th� %d, ng c蕄 kh玭g 頲 nh� h琻 %d", 3, TB_LEVEL_LIMIT[3])
		.."<enter>    "..format("L莕 tr飊g sinh th� %d, ng c蕄 kh玭g 頲 nh� h琻 %d", 4, TB_LEVEL_LIMIT[4])
		.."<enter>    "..format("L莕 tr飊g sinh th� %d, ng c蕄 kh玭g 頲 nh� h琻 %d", 5, TB_LEVEL_LIMIT[5])
		.."<enter>  ".."2. Х h鋍 <B綾 u Trng Sinh Thu藅 - C� S� Thi猲>"
		.."<enter>  ".."3. C雐 b� t蕋 c� trang b� v� ng鵤 tr猲 ngi."
		.."<enter>  ".."4. B総 bu閏 ph秈 tho竧 kh醝 chi課 i v� l﹎ li猲 u."
		.."<enter>  ".."5. Kh玭g 頲 c遪 nhi謒 v� ch璦 ho祅 th祅h (S竧 th�, t輓 s�, D� T萿)."
		.."<enter>  ".."6. Chuy觧 sinh l莕 th� 1 n th� 3 c莕 c� 100 v筺 lng, chuy觧 sinh l莕 th� 4 c莕 c� 200 v筺 lng"
		.."<enter>  "..format("7. Chuy觧 sinh l莕 4 c莕 c� %d c竔 %s.", TBITEMNEED_4[1].nCount, TBITEMNEED_4[1].szName)
		.."<enter>  "..format("8. Chuy觧 sinh l莕 4 c莕 c� %d c竔 %s.", TBITEMNEED_4[2].nCount, TBITEMNEED_4[2].szName)
		.."<enter>  ".."9. Ch璦 nh薾 ho芻 ch璦 ho祅 th祅h nhi謒 v� k� n╪g c蕄 150",
		--.."<enter>　　".."3、必须清除师徒关系。", 改为转生后80级以下不能使用师徒令
		"T譵 hi觰 vi謈 kh竎./zhuansheng_ondialog",
		"Ta hi觰 r錳./OnCancel"});
end

--转生的好处
function zhuansheng_help_effect()
	CreateTaskSay({"<dec><npc>1. Thu 頲 甶觤 d� k� n╪g v� ti襪 n╪g"
	.."<enter>  ".."2. Thu 頲 kh竛g t輓h c� gi韎 h筺 cao h琻, c� 頲 n╪g l鵦 sinh t錸 nhi襲 h琻."
	.."<enter>  ".."3. T╪g gi韎 h筺 k� n╪g v� c玭g cao nh蕋, s� c� 頲 l鵦 c玭g k輈h m筺h h琻 v� t鑓  nh nhanh h琻."
	.."<enter>  ".."4. C� th� s� d鬾g 1 s� trang b� m韎 nh蕋"
	.."<enter>  ".."5. Thu 頲 c� h閕 1 l莕 t葃 甶觤 mi詎 ph�",
		"T譵 hi觰 vi謈 kh竎./zhuansheng_ondialog",
		"Ta hi觰 r錳./OnCancel"});
end

--如何学习转生
function zhuansheng_help_method()
	CreateTaskSay({"<dec><npc>N誹 nh� ngi  h鋍 qua <B綾 u Trng Sinh Thu藅 - C� S� Thi猲>, th� ta c� th� c kh萿   quy誸 d箉 ngi <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲>."
		.. "Chuy觧 sinh l莕 1 n l莕 3 c莕 c� 10 ng祅 v筺 lng l� 頲, chuy觧 sinh l莕 4 th� ph秈 20 ng祅 v筺, ha ha."
		.. "<enter>Nh綾 nh� m閠 ch髏 l�, n誹 nh� mu鑞 chuy觧 sinh l莕 4, trc ti猲 b秐 th﹏ m譶h c莕 ph秈 nh薾 nhi謒 v�, sau  h穣 甶"
		.. "<color=yellow>Trng B筩h S琻 Nam, Dc Vng чng T莕g 4, Sa M筩 S琻 чng 3, Kh醓 Lang чng <color> nh b筰 <color=yellow> Sng o, Xuy猲 S琻, T藅 Phong, 秐h C玭 <color>"
		.. "M韎 c� t� l� nh蕋 nh nh薾 頲 T輈h L辌h Кn v藅 c莕 thi誸  chuy觧 sinh 4.", 
		"Л頲, ta mu鑞 h鋍 ngay./zhuansheng_want_learn",
		"Nh薾 nhi謒 v� chuy觧 sinh 4/wantGetTranslifeTask_4",
		"Ta mu鑞 t譵 hi觰 chi ti誸 h琻/zhuansheng_ondialog",
		"Ta bi誸 r�/OnCancel"});
end

--想要学习转生
--在此判断是否符合转生的条件
function zhuansheng_want_learn()
	local n_transcount = ST_GetTransLifeCount()
	
	if (n_transcount >= 4) then
		CreateTaskSay({"<dec><npc>"..format("L莕 chuy觧 sinh th� %d v蒼 ch璦 m�, th阨 gian c� th� s� c藀 nh藅 sau", 5), 
			"K誸 th骳 i tho筰/OnCancel"});
		return 0;
	end

	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ngi  nh薾 nhi謒 v� k� n╪g 150, xin h穣 ho祅 th祅h nhi謒 v� r錳 h穣 n g苝 ta")
		return 
	end

	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	if (n_transcount == 0) then
		CreateTaskSay({"<dec><npc>".."L莕 chuy觧 sinh th� nh蕋 5 lo筰 ph遪g ng� s� gia t╪g.", 
			"Л頲, ta mu鑞 h鋍 ngay./#zhuansheng_sure_learn(-1)", "K誸 th骳 i tho筰/OnCancel"});
	elseif (n_transcount < 0 or n_transcount >=5) then
		Say("Tr筺g th竔 b蕋 thng xin m阨 li猲 l筩 v韎 nh� 甶襲 h祅h x� l�.", 0);
	else
		local tbOpp = {"<dec><npc>".."Xin m阨 ch鋘 甶觤 ph遪g ng� mu鑞 t╪g:"};
		
		for k, sz in TB_BASE_RESIST do
			tinsert(tbOpp, format("%s%s/#zhuansheng_sure_learn(%d)", "+", sz, k));
		end
		tinsert(tbOpp, "K誸 th骳 i tho筰/OnCancel")
		CreateTaskSay(tbOpp);
		
	end
end

function zhuansheng_sure_learn(n_resist)
	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	local n_transcount = ST_GetTransLifeCount();
	
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			if (n_translevel ~= 0 and n_transresist == n_resist) then
				CreateTaskSay({"<dec><npc>"..format("Зy l� l莕 chuy觧 sinh th� %d v�  ch鋘 %s kh玭g th� ch鋘 nhi襲 l莕 1 甶觤 ph遪g ng�, xin m阨 h穣 ch鋘 l筰.", i, TB_BASE_RESIST[n_resist]),
								"Ta mu鑞 ch鋘 l筰/zhuansheng_want_learn",
								"K誸 th骳 i tho筰/OnCancel"});
				return 0;
			end
		end
	end
	
	SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, n_resist);
	if (n_transcount == 2 and GetLevel() >= 190) then
		SetTask(TSK_ZHUANSHENG_AWARD, 1);
	end
	local nlevel = GetLevel();
	--转生时的处理
	LeaveTeam();	--解散组队关系
	
	ST_DoTransLife();		--执行转生，会自动调用\\script\\global\\translife.lua的main函数 返回值为1为成功，成功后会记录转生前的等级。
	
	CreateTaskSay({"<dec><npc>Ngi  h鋍 <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲> r錳.", " ta s� ph�  ch� gi竜/OnCancel"});
end

function check_zhuansheng()
	-- 越南版允许多次转生 最多 5次
	if (check_zhuansheng_level() ~= 1) then							--基础篇的学习		
		return 0;
	end
	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount ~= 0) then
		--Phong V﹏ L謓h B礽 - 襲 ch豱h th阨 gian tr飊g sinh i v韎 c竎 t﹏ th� - Modified By DinhHQ - 20110926
		if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
			local tb = {6, 10, 180, 180, 180}
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + tb[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], tb[ntranscount]), "Л頲 r錳./OnCancel"});
				return 0;
			end
		else
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], TB_TRANSTIME_LIMIT[ntranscount]), "Л頲 r錳./OnCancel"});
				return 0;
			end
		end	
	end
	
	--type=2 好像是身上
	--type=3 应该是背包
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "Л頲 r錳./OnCancel"});
		return 0;
	end
	--if (check_zhuansheng_league(LG_SHITULEAGUE) == 1) then	--师徒关系
	--	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[3], "好的，我知道了。/OnCancel"});
	--	return 0;
	--end
	--T筸 b� 甶襲 ki謓 r阨 i li猲 u khi tr飊g sinh 4 - Modified By DinhHQ - 20110813
	if ntranscount < 3 and (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then	--战队关系
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "Л頲 r錳./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_KILLER_ID) ~= 0) then	--杀手任务完成
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[8], "Л頲 r錳./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_MESSENGER_FENG) ~= 0 or GetTask(TSK_MESSENGER_SHAN) ~= 0 or GetTask(TSK_MESSENGER_QIAN) ~= 0 ) then	--信使任务完成
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[9], "Л頲 r錳./OnCancel"});
		return 0;
	end
	if (GetTask(TSK_TASKLINK_STATE) ~= 3 and GetTask(TSK_TASKLINK_STATE) ~= 0) then	--野叟任务完成
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[10], "Л頲 r錳./OnCancel"});
		return 0;
	end
	
	if GetTask(TSK_TASKLINK_CancelTaskLevel) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp1) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp2) ~= 0 then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[11], "Л頲 r錳./OnCancel"});
		return 0;
	end
	
	if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then							--基础篇的学习
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "Л頲 r錳./OnCancel"});
		return 0;
	end
	
	--Phong V﹏ L謓h B礽 - 襲 ch豱h ph� tr飊g sinh i v韎 c竎 t﹏ th� - Modified By DinhHQ - 20110926
	if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
		if ntranscount == 0 then
		 	if GetCash() < 1000000 then
				CreateTaskSay({"H譶h nh� ti襫 v蒼 ch璦  <color=red>1000000<color>.", "Л頲 r錳./OnCancel"});
				return 0;
			end
		elseif ntranscount == 1 then
			if GetCash() < 20000000 then
				CreateTaskSay({"H譶h nh� ti襫 v蒼 ch璦  <color=red>20000000<color>.", "Л頲 r錳./OnCancel"});
				return 0;
			end
		else
			if (ntranscount < 3 and GetCash() < ZHUANSHENG_TUITION) then				--jxb要1亿
				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[2], "Л頲 r錳./OnCancel"});
				return 0;
			end
		end
	else
		if (ntranscount < 3 and GetCash() < ZHUANSHENG_TUITION) then				--jxb要1亿
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[2], "Л頲 r錳./OnCancel"});
			return 0;
		end
	end
	-- 需要第4次转生，判断是否具有999个霹雳弹，北斗长生术—大乘心法 和 二亿jxb
	if ntranscount == 3 then
		for i=1,getn(TBITEMNEED_4) do
			local tbProb = TBITEMNEED_4[i].tbProb
			if CalcItemCount(3,tbProb[1], tbProb[2],tbProb[3], -1) < TBITEMNEED_4[i].nCount then
				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13 + i], "Л頲 r錳./OnCancel"})
				return 0
			end
		end
		
		-- 4转二亿jxb
		if GetCash() < ZHUANSHENG_TUITION_4 then	
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13], "Л頲 r錳./OnCancel"});
		return 0;
		end
	end
	--其他？杀手任务？
	return 1;
end

--转生后能保留的潜能点 技能点说明
function zhuansheng_help_prop()
	local nlevel = GetLevel();
	local ncurexp = GetExp();
	local ntranscount = ST_GetTransLifeCount();
	
	if (check_zhuansheng_level() ~= 1) then
		return 0;
	end
	
	local nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][1],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][2],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][3],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][4];
	
	local sz_res = "Ch鋘 1 lo筰 kh竛g t輓h";
	local sz_addskill = "";
	
	if (ntranscount == 0) then
		sz_res = "T蕋 c� kh竛g t輓h";
	end
	
	if (nlevel == 199 and ncurexp >= ZHUANSHENG_XIANDAN_MINEXP and ntranscount == 0) then
		nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[200][ntranscount+1][1],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][2],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][3],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][4];
		sz_addskill = "[Hi謓 t筰 kinh nghi謒  vt qu� 2 t�:]";
	end
	
	CreateTaskSay({"<dec><npc>"..format("Theo nh� c蕄 %d c馻 ngi v� tr飊g sinh %d l莕, %s c� th� t╪g <color=yellow>%d<color> ti襪 n╪g, <color=yellow>%d <color> k� n╪g, t╪g <color=yellow>%d%%<color> kh竛g t輓h (%s), n﹏g cao <color=yellow>%d <color> gi韎 h筺 k� n╪g cao nh蕋.", 
				nlevel, (ntranscount+1), sz_addskill, nprop, nmgpoint, nresist, sz_res, naddskill), 
		"T譵 hi觰 vi謈 kh竎./zhuansheng_ondialog",
		"Л頲 r錳./OnCancel"});
end


function zhuansheng_query()
	--do return Say("未完成", 0)end
	local n_transcount = ST_GetTransLifeCount();
	local nmgpoint, nprop, nskill = 0,0,0;
	local tbresist = {0, 0, 0, 0, 0};
	local sz_msg = "";
	
	if (n_transcount ~= 0) then
		for i = 1, n_transcount do
			nlevel, nresistid = zhuansheng_get_gre(i);
			
			nmgpoint = TB_LEVEL_REMAIN_PROP[nlevel][i][1] + nmgpoint;
			nprop  = TB_LEVEL_REMAIN_PROP[nlevel][i][2] + nprop;
			nskill = TB_LEVEL_REMAIN_PROP[nlevel][i][4] + nskill;
			if (nresistid >= 0 and nresistid <= 4) then
				tbresist[nresistid+1] = tbresist[nresistid+1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Tr飊g sinh l莕 %d ng c蕄: %d; ch鋘 kh竛g t輓h: %s", i, nlevel, TB_BASE_RESIST[nresistid]);
			elseif (nresistid == 255) then
				tbresist[1] = tbresist[1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[2] = tbresist[2] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[3] = tbresist[3] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[4] = tbresist[4] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[5] = tbresist[5] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Tr飊g sinh l莕 %d ng c蕄: %d; ch鋘 kh竛g t輓h: %s", i, nlevel, "T蕋 c� kh竛g t輓h");
			end
		end
	end
	
	CreateTaskSay({format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s%s", 
					"<dec><npc>",
					format("S� l莕 chuy觧 sinh: %d", n_transcount),
					format("Thu 頲 甶觤 k� n╪g: %d", nmgpoint),
					format("Thu 頲 甶觤 ti襪 n╪g: %d", nprop),
					format("觤 k� n╪g cao nh蕋 t╪g th猰: %d", nskill),
					format("H醓 ph遪g t╪g: %d", tbresist[1]),
					format("B╪g ph遪g t╪g: %d", tbresist[2]),
					format("чc ph遪g t╪g: %d", tbresist[3]),
					format("L玦 ph遪g t╪g: %d", tbresist[4]),
					format("Ph� ph遪g t╪g: %d", tbresist[5]),
					sz_msg
					), 
			"T譵 hi觰 vi謈 kh竎./zhuansheng_ondialog",
			"Л頲 r錳./OnCancel"});
	
end


function zhuansheng_xiandan()
	
	CreateTaskSay({"<dec><npc>".."'B綾 u ti猲 n' l� lo筰 linh dc m� v� v� l﹎ cao th� c� n閕 c玭g th﹎ h藆 n祇 mu鑞 h鋍 'B綾 u trng sinh thu藅'  u ph秈 d飊g n, sau khi s� d鬾g c� th� t╪g th猰 nhi襲 ph莕 c玭g l鵦. Ch� t筼 B綾 u Ti猲 Кn b総 bu閏 c蕄 199 v� c� 201000 v筺 kinh nghi謒 m韎 ch� t筼 頲, l骳 ch� t筼 B綾 u Ti猲 Кn nh鱪g kinh nghi謒 vt qu� 2 t� s� chuy觧 h鉧 v祇 ti猲 n. N猲 nh� r籲g ph秈 chuy觧 sinh xong m韎 s� d鬾g 頲, m鏸 ngi nhi襲 nh蕋 s� d鬾g 1 linh n, ng th阨 b総 bu閏 trong v遪g 30 ng祔 ph秈 s� d鬾g. Ti猲 n c� n v� kinh nghi謒 l� 1000 v筺, v� v藋 nh鱪g kinh nghi謒 th鮝 c� nh鱪g s� kh玭g b� lt b� 甶. Ngi mu鑞 ch� t筼 'B綾 u Ti猲 Кn' kh玭g?",
				"Ch� t筼 B綾 u Ti猲 Кn/zhuansheng_makexiandan",
				"T譵 hi觰 v� 甶觤 kinh nghi謒/zhuansheng_help_xiandan",
				"Ta mu鑞 t譵 hi觰 th猰./zhuansheng_ondialog",
				"K誸 th骳 i tho筰/OnCancel"
				});
end


function zhuansheng_makexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (GetTask(TSK_ZHUANSHENG_XIANDAN) > 0) then
		CreateTaskSay({"<dec><npc>".."M鏸 ngi ch� c� th� ch� t筼 1 B綾 u Ti猲 Кn, c竎 h� kh玭g th� l祄 th�.", "K誸 th骳 i tho筰/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		n_addexp = floor(n_addexp / 10e7) * 10e7;
		CreateTaskSay({"<dec><npc>".."Ngi c�"..n_addexp.." kinh nghi謒 s� b� chuy觧 v祇 ti猲 n. Ngi c� x竎 nh薾 mu鑞 ch� t筼 'B綾 u Ti猲 Кn'?",
				"ng r錳, ta mu鑞 luy謓 ti猲 n!/zhuansheng_surexiandan",
				"Ta mu鑞 t譵 hi觰 th猰./zhuansheng_ondialog",
				"K誸 th骳 i tho筰/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."Theo nh� c玭g l鵦 c馻 c竎 h� kh玭g th� luy謓 th祅h B綾 u Ti猲 Кn, mu鑞 luy謓 th祅h ti猲 n th� xin h穣 luy謓 th猰 th阨 gian n鱝 nh�!",
				"Ta mu鑞 t譵 hi觰 th猰./zhuansheng_ondialog",
				"K誸 th骳 i tho筰/OnCancel"});
	end
end


function zhuansheng_surexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		CreateTaskSay({"<dec><npc>".."H祅h trang kh玭g  10 �, xin m阨 h穣 thu d鋘 h祅h l�.", "K誸 th骳 i tho筰/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		
		local nitemidx = AddItem(6,1,1970,1,1,0);
		if (nitemidx > 0) then
--			local n_recexp = n_addexp;
--			if (n_recexp <= 10e8) then
--				ReduceOwnExp(n_recexp);
--			else
--				while (n_recexp > 0) do
--					if (n_recexp < 10e8) then
--						ReduceOwnExp(n_recexp);
--						n_recexp = 0;
--					else
--						n_recexp = n_recexp - 10e8;
--						ReduceOwnExp(10e8);
--					end
--				end
--			end
			ReduceOwnExp(n_addexp);
			
			SetSpecItemParam(nitemidx, 1, floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP));
			ITEM_SetExpiredTime(nitemidx, ZHUANSHENG_ITEM_EXTIME);	-- 有效期30天
			SyncItem(nitemidx);
			SetTask(TSK_ZHUANSHENG_XIANDAN, 1);
			WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tMakeSuccess,LEVEL:%d,FACTION:%d,ReduceExp:"..n_addexp..",ItemExp:%d",
						"B綾 u Ti猲 Кn",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP)));
			Msg2Player(format("Thu 頲 1 %s", "B綾 u Ti猲 Кn"));
		end
	end
	
end


function zhuansheng_help_xiandan()
	CreateTaskSay({"<dec><npc>".."Ph祄 nh鱪g ngi c� c蕄 199 v� h琻 2 t� kinh nghi謒 tu luy謓 'B綾 u Trng Sinh Thu藅' s� 頲 n﹏g cao nh鱪g thu閏 t輓h, nh璶g nh鱪g kinh nghi謒 th鮝 ra s� b� l穘g ph�. V� v藋 c� m閠 ng祔 kia ta v� 1 v� 萵 s� ph竧 minh ra lo筰 ti猲 n n祔, th玭g qua 'B綾 u Ti猲 Кn' ngi c� th� l璾 gi� nh鱪g kinh nghi謒 c遪 th鮝  l骳 tr飊g sinh xong th� c� th� s� d鬾g.",
				"Ta mu鑞 t譵 hi觰 th猰./zhuansheng_ondialog",
				"K誸 th骳 i tho筰/OnCancel"});
end


function zhuansheng_time()
	local ntranscount = ST_GetTransLifeCount();
	local n_last_time = GetTask(TSK_ZHUANSHENG_LASTTIME);
	local n_cur_time = GetCurServerTime();
	local n_add_time = n_cur_time - n_last_time;
	
	if (ntranscount == 0) then
		CreateTaskSay({"<dec><npc>".."C竎 h� v蒼 ch璦 h鋍 B綾 u Truy襫 Sinh Thu藅, ch� c莕  甶襲 ki謓 n祔 th� c� th� chuy觧 sinh ngay l藀 t鴆.", "K誸 th骳 i tho筰/OnCancel"})
	else
		if (n_add_time >= TB_TRANSTIME_LIMIT[ntranscount]*24*60*60) then
			CreateTaskSay({"<dec><npc>".."Х  甶襲 ki謓 gi穘 c竎h th阨 gian chuy觧 sinh, ch� c莕  甶襲 ki謓 th� c� th� l藀 t鴆 chuy觧 sinh.", "K誸 th骳 i tho筰/OnCancel"})
		else
			
			CreateTaskSay({"<dec><npc>"..format("C遪 %d ng祔 m韎 c� th� ti誴 t鬰 chuy觧 sinh.",ceil((TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 - n_add_time) / (24*60*60))), "K誸 th骳 i tho筰/OnCancel"})
		end
	end
end

