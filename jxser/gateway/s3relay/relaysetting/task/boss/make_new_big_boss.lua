Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ��ַ��������
	TaskName( "BOSS HOANG KIM XUAT HIEN 19h45" );
	TaskInterval( 1440 );
	TaskTime( 19, 45 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( format("=====> SO LUONG BOSS HOANG KIM XUAT HIEN :  %d", BigBoss.gold_boss_count) );
	OutputMsg("=====> BOSS DOC CO THIEN PHONG XUAT HIEN :  19:45" );
	
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		return 0;
	end;
	
	BigBoss.isBigBossDead = 0;
	OutputMsg( format("GOLD BOSS COUNT :  %d", BigBoss.gold_boss_count) );
	if (BigBoss.gold_boss_count == 0) then
		local bossname = "��c C� Thi�n Phong";
		local series = random(0, 4);
		local bossid = BigBoss.BIG_BOSS_SER[series];
		local bosslvl = 95;
	
		local nPosIdx = random(1,getn(BigBoss.BIG_BOSS_POS));
		local nPosIdx2 = random(1,getn(BigBoss.BIG_BOSS_POS[nPosIdx][2]));
		local worldname = BigBoss.BIG_BOSS_POS[nPosIdx][3];
		local world = BigBoss.BIG_BOSS_POS[nPosIdx][1];
		local posx = BigBoss.BIG_BOSS_POS[nPosIdx][2][nPosIdx2][1];
		local posy = BigBoss.BIG_BOSS_POS[nPosIdx][2][nPosIdx2][2];
		local str = format("Giang h� truy�n r�ng<color=yellow>%s<color> xu�t hi�n t�i <color=yellow>%s<color> ! C�c nh�n s� v� l�m s� c� 1 tr�n chi�n ��m m�u !", bossname, worldname);
		
		GlobalExecute(format("dwf \\script\\missions\\boss\\call_big_boss.lua BigBoss:Make_Big_Boss(%d, %d, %d, %d, %d, %d, [[%s]], [[%s]] )",bossid, bosslvl, series, world, posx, posy, bossname, str ));
		bossnames = "Doc Co Thien Phong"
		OutputMsg("Create Boss "..bossnames..","..bossid..","..bosslvl..","..world..","..posx..","..posy..","..series..date("----%Y%m%d%H%M"))
	else
		
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
