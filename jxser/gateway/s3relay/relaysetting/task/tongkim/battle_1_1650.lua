-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	TaskName( "CHIEN TRUONG TONG KIM 16:50" );
	TaskInterval( 1440 );
	TaskTime( 16, 50 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg("=====> [TongKim] Chien Truong Tong Kim 16:50 BAT DAU")

end

function TaskContent()
	Battle_StartNewRound( 1, 1 );		-- GMָ������ͼ���ս��
	Battle_StartNewRound( 1, 2 );		-- GMָ������м���ս��

	OutputMsg("=====> [TongKim] Chien Truong Tong Kim 16:50 BAT DAU")


	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		return							-- ����һ �ر�һ���߼��ν��ù�ս�ν����
	else
		Battle_StartNewRound( 1, 3 );	-- GMָ������߼���ս��	
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
