Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Phuong tuong - Loi dai cuoc so tai bat dau");
	TaskSetMode(1);
	
	-- 2005��1��5��(������)��һ�ο�ʼ
	TaskSetStartDay(1, 5);

	-- һ��һ��ѭ��
	TaskInterval(7);
	
	-- 20��00�ֿ���
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ������Ϊ1,�����citywar.ini��ָ����һ��
	if (cw_CanStart(1,3) == 1) then
		StartArena(1);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
