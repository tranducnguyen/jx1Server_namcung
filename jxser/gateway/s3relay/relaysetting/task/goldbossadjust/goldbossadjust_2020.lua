
Include("\\script\\event\\goldboss_adjust_2011\\boss_initialize.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 20:20" );
	TaskInterval( 1440 );
	TaskTime( 20, 20 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg("=====> BOSS Hoang Kim murongquan XUAT HIEN:  20:20" );
end

function TaskContent()
	makeboss_onlyone_pos(3)
	OutputMsg( "=====> BOSS Hoang Kim jinshiliang XUAT HIEN:  20:20 (goldbossadjust_2020.lua)" );
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
