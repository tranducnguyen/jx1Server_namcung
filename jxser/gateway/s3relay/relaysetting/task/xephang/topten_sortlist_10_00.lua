--ϵͳ���ܵǼǣ�����ǰʮ��  - Created by DinhHQ - 20110614
local nStartDate	 = 20110707;
local nCloseDate	 = 20120713;	
function TaskShedule()
	TaskName("Top 10 server - SERVER 10h")
	TaskInterval(24 * 60)
	TaskTime(10, 0)
	TaskCountLimit(0)
	OutputMsg("=====> DANH SACH TOP 10 TOAN SERVER 10H")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\vng_feature\\top10\\vngtop10.lua",	"tbTop10:UpdateTopList", 0)
	OutputMsg("======> Toplist sorted")
end
