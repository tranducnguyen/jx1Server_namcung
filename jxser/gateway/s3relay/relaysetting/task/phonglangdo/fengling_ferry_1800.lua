function TaskShedule()
	--���÷�������
	TaskName("Phong L�ng ��")
	TaskTime(18, 0);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(1440) --60����һ��
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg("=====> [phonglangdo] Phong Lang Do 18h");
end

function TaskContent()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
	OutputMsg("=====> [phonglangdo] Phong Lang Do 18h");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end