Include("\\RelaySetting\\Task\\boss\\bosswhere.lua")
Include("\\RelaySetting\\Task\\boss\\GoldBossHead.lua");
Sid = 523
Interval = 1440;
Count = 0;
StartHour=-1;
StartMin=-1;

function NewBoss()
	str = "Nghe n�i ���ng M�n Li�u Thanh Thanh �� gi�t r�t nhi�u cao th� tr�n giang h�."
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["liuqingqing"][Random(getn(where.liuqingqing))+1], 523, 90;
end;



