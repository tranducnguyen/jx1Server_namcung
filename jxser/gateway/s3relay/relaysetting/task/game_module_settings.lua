-- ��ʱ��һ�������������Gameserver��ϵͳ����
Include("\\script\\gb_modulefuncs.lua")
tab_GameSetting = 
{
"Hoat dong mua xuan 2006",--����
"OpenShop",--�̳�
"Thiep Chuc Mung Nam Moi",--Msg2SubWorld
"Do Pho Hoang Kim",--AddLocalNews
"Phuc Duyen - Phao Bong", 
"Truyen Cong",
"Le vat tinh nhan",--AddLocalNews and AddGift
"YANDIBAOZANG",
"YANDIBAOZANG_TALK",
"SWITH_DAIYITOUSHI",
"chunjie2009_dangboss",
}

function TaskShedule()
	TaskName("Thi�t k�  h� th�ng tr� ch�i");
	TaskInterval(1000000);
	TaskCountLimit(0);
	OutputMsg("=====> BAT DAU KHOI DONG CAC TINH NANG CUA GAME VO LAM TRUYEN KY <=====");
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
