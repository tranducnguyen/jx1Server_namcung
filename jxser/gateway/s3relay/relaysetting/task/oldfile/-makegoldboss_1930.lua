QY_GOLDBOSS_APOS_INFO = {
					{"�Ű�", 566, 95, 0, {"ܽ�ض�","ɽ����","city"}}, -- ����,����,�ȼ�,����,{���ܳ��ֵĵ�ͼ}
					{"������ʦ ", 740, 95, 0, {"��ʯ��","��Ϫ��","city"}},
					{"�Ʒ���", 1366, 95, 1, {"�������","��ȶ�","city"}},
					{"������", 582, 95, 1, {"���궴","���춴","city"}},
					{"���鶴", 568, 95, 2, {"����ɽ��","������","city"}},
					{"����կ", 744, 95, 2, {"ɳĮ1","ɳĮ3","city"}},
					{"�β���", 583, 95, 3, {"ɳĮ�ر�","ɳĮ2","city"}},
					{"������", 563, 95, 3, {"��ˮ��","���ж�","city"}},
					{"�������� ", 562, 95, 4, {"����ɽ��","Ī�߿�","city"}},
					{"ȫ���� ", 747, 95, 4, {"��ɽ��","���춴","city"}},
					
				--{"����ѩ��", 564, 95, 3, 227, 1504, 3144, "��˵����߹�������ѩ��׷���ľ�ȥ�����Ĺ��ػ�ɳĮ�Թ���"},
}

QY_GOLDBOSS_DPOS_INFO = {
					{"���ʦ̫", 743, 95, 341, 2, "������˵���ʦ̫�������𽭺���������Į����ԭ����������һ��Ѫս!", "\\settings\\maps\\������\\Į����ԭ\\qingxiaoshitaiboss.txt"},
					{"����կ", 744, 95, 336, 2, "��˵ˮ��ʹ�߰���կ�Ѿ������ڷ���ɱ�����������һ��Ѫս!", "\\settings\\maps\\��ԭ����\\����ɱ���\\yanxiaoqianboss.txt"},
					{"������", 745, 95, 321, 3, "�����ഫ���������ѳ����ڳ���ɽ����������һ��Ѫս!", "\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"},
					{"������ʦ", 740, 95, 322, 0, "������˵������ʦ�������𽭺��������ڳ���ɽ����������һ��Ѫս!", "\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"},
					{"Ȫ����", 747, 95, 340, 4, "������˵ȫ���������Ѿã�ͻȻ������Ī�߿ߣ���������һ��Ѫս!", "\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"},
					{"�ȴ���", 1367, 95, 342,4, "�ഫ�ȴ���������΢ɽ������������һ��Ѫս", "\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
}
Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 19:30" );
	TaskInterval( 1440 );
	TaskTime( 19, 30 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  19:30" );
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		qy_makeboss_fixure(1)
		return 0;
	end;
	BigBoss.gold_boss_count = 0;
TAB_CITY_EMPTY = {}
	qy_makeboss_onlyone_pos()
	--qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
