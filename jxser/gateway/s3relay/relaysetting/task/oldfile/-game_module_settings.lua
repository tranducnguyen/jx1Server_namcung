-- ��ʱ��һ�������������Gameserver��ϵͳ����
Include("\\script\\gb_modulefuncs.lua")
tab_GameSetting = 
{
"2006�����",--����
"OpenShop",--�̳�
"��ɫ�ؿ�",--Msg2SubWorld
"��",--AddLocalNews
"��Ե�̻�", 
"����",
"�������� ",--AddLocalNews and AddGift
"YANDIBAOZANG",
"YANDIBAOZANG_TALK",
"SWITH_DAIYITOUSHI",
"chunjie2009_dangboss",
}

function TaskShedule()
	TaskName("�����Ϸϵͳ");
	TaskInterval(1000000);
	TaskCountLimit(0);
	OutputMsg("������Ϸ���ְ�ܿ���ϵͳ...");
end

function TaskContent()
	for i = 1, getn(tab_GameSetting) do 
		gb_AutoStartModule(tab_GameSetting[i])
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
