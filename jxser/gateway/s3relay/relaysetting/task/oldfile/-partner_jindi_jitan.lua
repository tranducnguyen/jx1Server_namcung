--�����Ž��ء���̳����
Include("\\script\\gb_taskfuncs.lua")
LG_PARTNER_JITAN_NAME = "��̳"
function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName( "�����Ž��ء���̳����" );
	--����������㿪ʼ
	local h, m = 19,00;
	TaskTime(h, m);
	TaskInterval( 60 );
	TaskCountLimit( 0 );
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 0)
	end
	-- ���������Ϣ
	OutputMsg( "TRUONG CA MON CAM DIA : TE DAN NHIEM VU");
end

function TaskContent()
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 1)
	end
	GlobalExecute("dw Msg2SubWorld ( [ [Tr��ng ca m�n c�m ��a, S�t ��n Linh L�c �� s�ng l�i, h�n �ang g�i ��ng b�n,mang theo ��ng b�n v�o<color=yellow>Tr��ng ca m�n c�m ��a <color> x�m nh�p th�m hi�m c�m ��a.]]) ")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
