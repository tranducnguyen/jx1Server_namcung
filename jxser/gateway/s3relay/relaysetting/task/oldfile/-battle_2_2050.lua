-- ս��ϵͳ
-- Dongzhi

function TaskShedule()
	TaskName( "�ν��սս��20:50" );
	TaskInterval( 1440 );
	TaskTime( 20, 50 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "BATTLE[GuoZhan] 20:50 startup..." );

end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		
		if CW_GetOccupant(4) == CW_GetOccupant(7) then
			local szMsg  = format("گ������ \"%s\" ͬʱ��ռ���ٰ����꾩����������ֱ�ӵǻ�������", CW_GetOccupant(4));
			local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
			GlobalExecute(szNews);
			
			for i = 0,10 do
				NW_SetTask(i, 0);
			end
			NW_Abdicate();			-- ԭ��������λ
			NW_SetTask(0, 1);		-- ��Ӯ
			return
		end
		
		local szMsg  = format("ǰ���ܱ����ι�\"%s\" ��� \"%s\"����ϯλ�����ѿ�ʼ�����λ��ʿ���ν�������ս!", CW_GetOccupant(7), CW_GetOccupant(4));
		local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
		GlobalExecute(szNews);
		Battle_StartNewRound( 2, 3 );	-- GMָ�������ս�ν�
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
