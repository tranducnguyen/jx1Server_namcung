Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Thanh Do - Loi Dai cuoc so tai bat dau");
	TaskSetMode(1);
	
	-- 2005��1��3��(����һ)��һ�ο�ʼ
	TaskSetStartDay(1, 3);

	-- һ��һ��ѭ��
	TaskInterval(7);
	
	-- 20��00�ֿ���
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �ɶ����Ϊ2,�����citywar.ini��ָ����һ��
	if (cw_CanStart(2,3) == 1) then
		StartArena(2);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
