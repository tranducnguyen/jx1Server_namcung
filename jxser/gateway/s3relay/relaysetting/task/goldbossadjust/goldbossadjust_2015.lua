
Include("\\script\\event\\goldboss_adjust_2011\\boss_initialize.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 20:15" );
	TaskInterval( 1440 );
	TaskTime( 20, 15 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "=====> BOSS Hoang Kim jinshiliang XUAT HIEN:  20:15" );
end

function TaskContent()
	makeboss_onlyone_pos(2)
	OutputMsg( "=====> BOSS Hoang Kim jinshiliang XUAT HIEN:  20:15 (goldbossadjust_2015.lua)" );
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
