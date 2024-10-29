-- 炎帝的宝藏比赛定时器
--每天息午2点到息午12点整点触发

--by 小浪兜兜
--2007.10.22
INTERVAL_TIME = 60	-- 每小时触发
Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\leaguematch\\head.lua")

function GetNextTime()	--每天息午1点55到晚上23点55 触发报名
	-- 改变炎帝性能参加的报名时间-Modifiled by AnhHH - 20110802
    local hour = tonumber(date("%H"));
    if (hour == 24) then
    	hour = 1;
    elseif(hour <= 1) then
    	hour = 1
    else
    	hour = hour + 1;
    end
    return hour, 25;
end

function TaskShedule()
	TaskName("YANDIBAOZANG");	
	
	-- 60分钟一次
	TaskInterval(INTERVAL_TIME);
	-- 设置触发时间
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("=====> HOAT DONG [VIEM DE BAO TANG] SE BAT DAU VAO LUC %d:%d...", h, m));
	-- 执行无限次
	TaskCountLimit(0);
	-- OutputMsg("启动自动滚动公告...");
end

function TaskContent()
	local TB_YDBZ_DATE_START =	--启动场次(时)
	{
		2,3,4,5,6,7,8,9,10,11,12,13,14,16,18,20,22,
	}
	
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_YDBZ_DATE_START do
		-- 改变炎帝性能参加的报名时间 -Modifiled by AnhHH - 20110802
		if (nhour == ndate_hour) then
			
--			if gb_GetModule("YANDIBAOZANG") == 1 and gb_GetModule("YANDIBAOZANG_TALK") == 1 then
				OutputMsg("[YANDIBAOZANG]"..tonumber(date("%H"))..":55 StartSignUp...");
				-- 触发GameServer上的脚本
				--GlobalExecute("dw LoadScript([[\\settings\\trigger_challengeoftime.lua]])");
				GlobalExecute("dwf \\script\\missions\\yandibaozang\\yandibaozang_trigger.lua YDBZ_OnTrigger()");
				szMsg = "Vi猰  b秓 t祅g ho箃 ng  m� v� b総 u b竜 danh, c竎 Чi Hi謕 nhanh ch﹏ 甶 Bi謓 Kinh g苝 B譶h B譶h C� Nng  ghi danh, th阨 gian ghi danh l� 5 ph髏."
				GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
--			end
			break;
		end
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
