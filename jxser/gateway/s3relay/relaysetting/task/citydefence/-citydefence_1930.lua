--citydefence.lua
-- ����ս��֮�������

function TaskShedule()
	TaskName("�����������");	

	-- һ��һ�Σ���λ����
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(19, 30);
	OutputMsg(format("PHONG HOA LIEN THANH BAT DAU %d:%d...", 19, 30));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local weekdate = CloudOpen_Defence()
	if (weekdate == nil) then
		OutputMsg("PHONG HOA LIEN THANH : Khong phai thu 7 va chu nhat se khong mo")
		return
	end
	if (weekdate == 6) then
		OutputMsg("Phong h�a li�n th�nh Kim ph��ng �� b�t ��u ghi danh.");
		GlobalExecute("dw CityDefence_OpenMain(2)");
	else
		OutputMsg("Phong h�a li�n th�nh T�ng ph��ng �� b�t ��u ghi danh.");
		GlobalExecute("dw CityDefence_OpenMain(1)");
	end
end

function CloudOpen_Defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= 6 and weekdate ~= 0) then
		return nil
	end
	return weekdate
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
