Include("\\RelaySetting\\Task\\boss\\bosswhere.lua")
Include("\\RelaySetting\\Task\\boss\\GoldBossHead.lua");
Sid = 51320
Interval = 1440;
Count = 0;
StartHour=19;
StartMin=30;

function NewBoss()
	str = "Nghe n�i Nga Mi �� t� g�n nh�t �� xu�ng n�i!"
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["miaoru"][Random(getn(where.miaoru))+1], 513, 90;
end;



