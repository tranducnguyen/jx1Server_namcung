

function TaskShedule()
	--���÷�������
	TaskName("��ɽ��ս")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(60) --15һ��
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg(" =================��ɽ��ս==================");
end

function TaskContent()

	local nHour = tonumber(date("%H"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	

	local bIsStart = 0
	if nHour == 10 or nHour == 22  then
		bIsStart = 1
	elseif (nHour == 15 ) and (nWeek == 6 or nWeek == 0) then
		bIsStart = 1
	end
	
	if bIsStart == 1 then
		GlobalExecute("dwf \\script\\missions\\huashanqunzhan\\missionctrl.lua startHuaShanQunZhanMission()")
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", "��ɽ�����ѿ�ʼ��ɽ��ս����."))
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


