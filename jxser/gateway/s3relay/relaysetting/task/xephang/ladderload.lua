-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6
function GameSvrConnected(dwGameSvrIP)
	SyncAllLadder(dwGameSvrIP)
end;
function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	-- ���÷�������
	TaskName( "Relay BANG XEP HANG" );
	-- 10����һ��
	TaskInterval( 2440 );
	-- ���ô���������0��ʾ���޴���
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "=======================>Xoa thong tin Xep Hang<========================" );
	for i=10001, 10300 do 
		LoadLadder(i)
	end
	
end

function TaskContent()
	OutputMsg( "===>Xep Hang Khoi Dong Hoan Tat<===" );
end