local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end

Include("\\script\\event\\other\\caipiao\\head_gc_old.lua")

Include("\\script\\lib\\baseclass.lua")

function TaskShedule()
	--���÷�������
	TaskName("caipiao fix")
	
	
	
	

	--���ü��ʱ�䣬��λΪ����
	
	--���ô���������0��ʾ���޴���	
	
	TaskCountLimit(1)
	
	
end

function TaskContent()
	
	tbCaiPiao_Old:Fix(55)
	tbCaiPiao_Old:Fix(56)
	tbCaiPiao_Old:Fix(50)
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end