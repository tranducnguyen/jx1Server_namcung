function TaskShedule()
	TaskName("2009Xinnian_FuLuShou");
	TaskInterval(60);
	local nhour = tonumber(date("%H"));
	local nstarth = 0;
	if nhour >= 23 then
		nstarth = 06;
	else
		tb_xmas2009_strattime = {06,19};
		for ni,nh in tb_xmas2009_strattime do
			if nh >= nhour then
				nstarth = nh;
				break
			end
		end
	end
	
	TaskTime(nstarth, 0);
	OutputMsg(format("HOAT DONG TIM KIEM 3 VI THAN %d:%d Start...",nstarth,0));
	TaskCountLimit(0);
end

function TaskContent()
	local ndate = tonumber(date("%y%m%d%H"));
	if ndate < 09011612 or ndate > 29021519 then
		return 
	end
	
	local nhm = tonumber(date("%H%M"))
	
	if nhm >= 0600 and nhm < 1300 then
		--ͨ��pass
	elseif nhm >= 1900 and nhm < 2000 then
		--ͨ��pass
	else
		return
	end
	
	local nrand = random(1, 2);
	local narry = random(1, 6);
	
	GlobalExecute(format("dwf \\script\\event\\chunjie_jieri\\200901\\fulushou\\findnpc.lua chunjie0901_findnpc(%d, %d, %d)",nrand, ndate, narry));
	
	local szMsg = "Tr��c m�t ch�ng ta 3 v� th�n �ang t�m v�i nhau, c�ng ti�n l�n thi�n ��nh b�i ki�n Ng�c ho�ng ��i ��, c�c v� nh�n s� c�ng nhau tr� gi�p b�n h� �i.";
	GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg));
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg));
end

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end
