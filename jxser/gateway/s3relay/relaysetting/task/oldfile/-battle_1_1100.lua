-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- ���÷�������
	TaskName( "����ս�� (�ν�) 11:00" );
	TaskInterval( 1440 );
	TaskTime( 10, 50 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "CHIEN TRUONG TONG KIM 11:00 BAT DAU..." );
end

function TaskContent()
--	Battle_StartNewRound( 1, 1 );	-- GMָ������ͼ���ս��
--	Battle_StartNewRound( 1, 2 );	-- GMָ������м���ս��
	Battle_StartNewRound( 1, 3 );	-- GMָ������߼���ս��
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
