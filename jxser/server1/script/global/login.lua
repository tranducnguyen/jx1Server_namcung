Include("\\script\\global\\login_head.lua")
-- 登⒓脚本
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) 添加自动更孝技能功能
-- Update: FanZai 改用孝的机制，只需去掉Include就可以实现功能开关


--一般只需修改（添加/删除）这里的Include文件：
--（在文件中执行一息login_add(fun, n_time)即可，例子参见"\\script\\missions\\leaguematch\\wlls_login.lua"）
--============================include namcung====================================
Include("\\script\\global\\namcung\\xephang\\top10_all.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\gmroleitem_player.lua")
--------------------------------------------------------------------------------------
Include("\\script\\global\\login_old.lua")	--旧的Login脚本（包含兜个活动）
Include("\\script\\missions\\leaguematch\\wlls_login.lua")	--WLLS武林联赛
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")	--if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
Include ("\\script\\global\\login_hint.lua")	--登⒔活动提示
--================================================================

Include("\\script\\activitysys\\g_activity.lua")	


if (GetProductRegion() ~= "vn") then
	Include("\\script\\global\\chuangong_login.lua")
	Include("\\script\\task\\lv120skill\\head.lua")	-- 120级技能任务

	-- LLG_ALLINONE_TODO_20070802 待确认
	Include("\\script\\battles\\battle_login.lua")	--宋金荣誉奖励的提示
end

if (GetProductRegion() == "cn_ib") then
	Include("\\script\\misc\\spreader\\emigration.lua")
	Include("\\script\\misc\\lost_item\\takelostitem.lua")
	Include([[\script\item\ib\tishenzhiren.lua]])	-- 替身纸人
	Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua");	-- 天之玉玺
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_feature\\top10\\vngtop10.lua");
Include("\\script\\global\\namcung\\login\\login.lua")

function main(bExchangeIn)
	
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( nMapId == 341 ) or ( nMapId == 162 ) then
			Msg2Player("N琲 y  thng tuy課 s緋 tr� v� th祅h...");
			SetRevPos(19);		--设置重生点
			UseTownPortal();        --执行回城
		end		
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- H� th鑞g Vi誸 th猰	
login()
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--tinhpn 20110223:Reset pass ruong
	ResetBox:AnnounceResetBoxDate()
	--tinhpn 20100817: Online Award
	if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
		Msg2Player("Ng礽 c� th� nh薾 l蕐 ph莕 thng online m鏸 ng祔!")
		OnlineAward_ResetDaily()
		OnlineAward_SummaryOnlineTime()
		OnlineAward_StartTime()
	end
	
	PlayerList:AddPlayer(PlayerIndex)
	--载入全部login脚本
	if (TB_LOGIN_FUN[0]) then
		for i = 1, getn(TB_LOGIN_FUN[0]) do
			local func = TB_LOGIN_FUN[0][i]
			if (func) then
				func(bExchangeIn)
			end
		end
	end
	
	EventSys:GetType("OnLogin"):OnPlayerEvent(0, PlayerIndex, bExchangeIn)
	G_ACTIVITY:OnMessage("OnLogin", PlayerIndex)
	
	
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local reg = TB_LOGIN_FILEFUN[i]
		DynamicExecute(reg[1], reg[2], PlayerIndex, bExchangeIn)
	end
	TaskManager:ResetUseGroup()
	LoginDelaySync(1)  -- 1 表示需要延时同步数据, 0 表示不需要
	-- 请勿在此函数中直接添加⑦辑处理，请封装成函数并通过login_add放置到TB_LOGIN_FUN[0]数组里
end

-------------------------------------------
--  功能：登⒓时，延时同步一些不影响系统运行的数据到客户端，减少登⒓耗费的时间
--  目前延时时间为2秒(即：执行main_delaysync的间隔：两秒)
--- 参数：nStep 表示当前是第几次同步
-- 返回：0 - 表示同步未结束，系统在本次调用完成后，仍会再次调用 main_delaysync
--		 1 - 表示所有同步结束
function main_delaysync(nStep)	
	if (nStep < 1 or nStep > getn(TB_LOGIN_FUN)) then
		print("main_delaysync error: "..nStep.." funccount:"..getn(TB_LOGIN_FUN));
		return 1;
	end
	
	--运行第nStep次延时同步的所有函数
	if (TB_LOGIN_FUN[nStep]) then
		for i = 1, getn(TB_LOGIN_FUN[nStep]) do
			if (TB_LOGIN_FUN[nStep][i]) then TB_LOGIN_FUN[nStep][i]() end
		end
	end

	if (nStep < getn(TB_LOGIN_FUN)) then
		return 0
	else
		return 1
	end
end
function no()
	if chuangong_login ~= nil then
		chuangong_login()
	end
end
function WriteLogPro(data,str)
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end
function logplayer(zFile,szMsg)
  local handle = openfile(zFile,"a")
  write(handle,format("%s\n",szMsg));
  closefile(handle);
 end