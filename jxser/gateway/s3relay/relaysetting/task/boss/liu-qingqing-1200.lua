Include("\\RelaySetting\\Task\\boss\\bosswhere.lua")
Include("\\RelaySetting\\Task\\boss\\GoldBossHead.lua");
Sid = 52312
Interval = 1440;
Count = 0;
StartHour=12;
StartMin=0;

function NewBoss()
	str = "Nghe n�i ���ng M�n Li�u Thanh Thanh �� gi�t r�t nhi�u cao th� tr�n giang h� "
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["liuqingqing"][Random(getn(where.liuqingqing))+1], 523, 90;
end;



