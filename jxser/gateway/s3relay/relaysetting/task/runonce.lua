-- �ύ���ļ��м�ͬʱ�ύTaskLit.ini������

RUNONCE_NAME	= "Th� ti�u  chi�n ��i v� d�ng"

function TaskShedule()
	-- ���÷�������
	TaskName(RUNONCE_NAME)
	-- ִֻ��һ��
	TaskInterval( 244000 )
	-- ���ô���������0��ʾ���޴���
	TaskCountLimit(1)
	-- ���������Ϣ
end

function TaskContent()
	if (tonumber(date("%Y%m%d")) > 20060228) then
		OutputMsg("["..RUNONCE_NAME.."] Nhi�m v� �� qua k� h�n, kh�ng th� ti�p nh�n.")
		return
	end
	
	for n_lgtype = 2, 4 do
		local n_count	= 0
		local n_lid		= LG_GetFirstLeague(n_lgtype)
		while (n_lid ~= 0) do 
			local str_lgname = LG_GetLeagueInfo(n_lid)
			n_lid = LG_GetNextLeague(n_lgtype, n_lid)
			LG_ApplyRemoveLeague(n_lgtype, str_lgname)
			n_count	= n_count + 1
		end
		OutputMsg("Th� ti�u chi�n ��i, lo�i h�nh :"..n_lgtype..". S� l��ng:"..n_count)
	end

	OutputMsg("�� ho�n th�nh nhi�m v� ["..RUNONCE_NAME.."]!")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
