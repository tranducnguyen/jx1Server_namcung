--close_citydefence_1700.lua
--

function TaskShedule()
	TaskName("Phong Hoa Lien Thanh");	

	-- һ��һ�Σ���λ����
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(22, 0);
	OutputMsg(format("Phong Hoa Lien Thanh da ket thuc %d:%d...", 22, 0));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	OutputMsg("Phong H�a Li�n Th�nh �� k�t th�c");
	GlobalExecute("dw CityDefence_CloseMain()");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
