Include("\\script\\global\\login_head.lua")
-- �Ǣ��ű�
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) ����Զ���Т���ܹ���
-- Update: FanZai ����Т�Ļ��ƣ�ֻ��ȥ��Include�Ϳ���ʵ�ֹ��ܿ���


--һ��ֻ���޸ģ����/ɾ���������Include�ļ���
--�����ļ���ִ��һϢlogin_add(fun, n_time)���ɣ����Ӳμ�"\\script\\missions\\leaguematch\\wlls_login.lua"��
--============================include namcung====================================
Include("\\script\\global\\namcung\\xephang\\top10_all.lua")
Include("\\script\\global\\namcung\\gmquanlyserver\\gmroleitem_player.lua")
--------------------------------------------------------------------------------------
Include("\\script\\global\\login_old.lua")	--�ɵ�Login�ű��������������
Include("\\script\\missions\\leaguematch\\wlls_login.lua")	--WLLS��������
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")	--if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
Include ("\\script\\global\\login_hint.lua")	--�Ǣ����ʾ
--================================================================

Include("\\script\\activitysys\\g_activity.lua")	


if (GetProductRegion() ~= "vn") then
	Include("\\script\\global\\chuangong_login.lua")
	Include("\\script\\task\\lv120skill\\head.lua")	-- 120����������

	-- LLG_ALLINONE_TODO_20070802 ��ȷ��
	Include("\\script\\battles\\battle_login.lua")	--�ν�������������ʾ
end

if (GetProductRegion() == "cn_ib") then
	Include("\\script\\misc\\spreader\\emigration.lua")
	Include("\\script\\misc\\lost_item\\takelostitem.lua")
	Include([[\script\item\ib\tishenzhiren.lua]])	-- ����ֽ��
	Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua");	-- ��֮����
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
			Msg2Player("N�i ��y �� th��ng tuy�n s�p tr� v� th�nh...");
			SetRevPos(19);		--����������
			UseTownPortal();        --ִ�лس�
		end		
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- H� th�ng Vi�t th�m	
login()
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--tinhpn 20110223:Reset pass ruong
	ResetBox:AnnounceResetBoxDate()
	--tinhpn 20100817: Online Award
	if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
		Msg2Player("Ng�i c� th� nh�n l�y ph�n th��ng online m�i ng�y!")
		OnlineAward_ResetDaily()
		OnlineAward_SummaryOnlineTime()
		OnlineAward_StartTime()
	end
	
	PlayerList:AddPlayer(PlayerIndex)
	--����ȫ��login�ű�
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
	LoginDelaySync(1)  -- 1 ��ʾ��Ҫ��ʱͬ������, 0 ��ʾ����Ҫ
	-- �����ڴ˺�����ֱ����Ӣ߼��������װ�ɺ�����ͨ��login_add���õ�TB_LOGIN_FUN[0]������
end

-------------------------------------------
--  ���ܣ��Ǣ�ʱ����ʱͬ��һЩ��Ӱ��ϵͳ���е����ݵ��ͻ��ˣ����ٵǢ��ķѵ�ʱ��
--  Ŀǰ��ʱʱ��Ϊ2��(����ִ��main_delaysync�ļ��������)
--- ������nStep ��ʾ��ǰ�ǵڼ���ͬ��
-- ���أ�0 - ��ʾͬ��δ������ϵͳ�ڱ��ε�����ɺ��Ի��ٴε��� main_delaysync
--		 1 - ��ʾ����ͬ������
function main_delaysync(nStep)	
	if (nStep < 1 or nStep > getn(TB_LOGIN_FUN)) then
		print("main_delaysync error: "..nStep.." funccount:"..getn(TB_LOGIN_FUN));
		return 1;
	end
	
	--���е�nStep����ʱͬ�������к���
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