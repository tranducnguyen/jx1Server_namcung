--ʥ������ٻ�ʥ����
--2007-11-24
--by С�˶��
Include("\\RelaySetting\\Task\\vnxmas2007\\vnxmas2007_head.lua")

function TaskShedule()
	TaskName("Call boss vnxmas 2007");
	TaskInterval(1440);
	
	-- 20��00�ֿ�ս
	TaskTime(14, 0);
	OutputMsg("=====> [vnxmas2007] HOAT DONG GOI BOSS GIANG SINH BAT DAU LUC 14:00")
	TaskCountLimit(0);
end

function TaskContent()
	local ndate = tonumber(date("%y%m%d%H"))
	--if ndate < 07120800 or ndate > 19121524 then
	--	return 
	--end
	local ni = 0
	local tbmap = {}
	for nmapid,nitem in tb_xmas2007_city do
		ni = ni + 1
		tbmap[ni] = nmapid 
	end
	local np = random(1,getn(tbmap))
	local selectmapid = tbmap[np]
	GlobalExecute(format("dwf \\script\\event\\vnchristmas2007\\callboss\\callboss.lua xmars2007_callboss([[%s]])",selectmapid));
	OutputMsg("=====> [vnxmas2007] HOAT DONG GOI BOSS GIANG SINH BAT DAU LUC 14:00")
end
function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
