if (GetProductRegion() == "cn_ib") then
	QY_GOLDBOSS_DPOS_INFO = {
					--{"��˼��", 746, 95, 341, 4, "������������߳����Ƶ� ��˼�� ��Į����ԭ����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					{"��ӯӯ", 742, 95, 336, 1, "�������Ű�ӯӯ�������𽭺��������ڷ���ɱ�! �Ʊ�����һ���ȷ�Ѫ��!", "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
					--{"����", 748, 95, 342, 1, "������������߳����Ƶ� ���� ����ɽ�����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"}
	}
else
	QY_GOLDBOSS_DPOS_INFO = {
--					{"��˼��", 746, 95, 341, 4, "������������߳����Ƶ� ��˼�� ��Į����ԭ����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					{"��ӯӯ", 742, 95, 336, 1, "�������Ű�ӯӯ�������𽭺��������ڷ���ɱ�! �Ʊ�����һ���ȷ�Ѫ��!", "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
--					{"����", 748, 95, 342, 1, "������������߳����Ƶ� ���� ����ɽ�����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"}
					{"���� ", 739, 95, 341, 0, "������������߳����Ƶ����������Į����ԭ! �Ʊ�����һ���ȷ�Ѫ��!", "\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"},
					{"��ľ�� ", 565, 95, 227, 3,"���˿�����ľ�������ɳĮ�Թ��ػ�.", "\\settings\\maps\\��������\\ɳĮ�Թ�\\duanmuruiboss.txt"},
					{"������", 582, 95, 181, 1, "�����ɾ���Ů������������ˮ������.", "\\settings\\maps\\������\\��ˮ���Թ�\\lanyiyiboss.txt"},
					{"�Ʒ���", 1366, 95, 342, 1, "�����Ʒ��������΢ɽ�����Ʊ�����һ���ȷ�Ѫ��", "\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
	}
end

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 21:00" );
	TaskInterval( 1440 );
	TaskTime( 21, 0 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  21:00" );
end

function TaskContent()
TAB_CITY_EMPTY = {}
	qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
