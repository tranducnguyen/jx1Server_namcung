-- ��ս�ν�
-- DongZhi
Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

function TaskShedule()
	
	TaskName( "�ν��ս�ܵ���" );	--��������
	TaskTime( 20, 00 );				--����ʱ��
	TaskInterval(1440);				--���ʱ��:һ��
	TaskCountLimit(0);				--�޴�������
	
	OutputMsg("****************KHOI DONG NHIEM VU TONG KIM CHIEN QUOC ****************")	
end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 then
		OutputMsg("**************** Create GUOZHAN New Battle ****************")	
		battle_StartNewIssue(2, 3);	
		OutputMsg("***********************************************************")
	end

end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
