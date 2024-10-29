
function store_sel_extend()
	local tbOpp = { 
			"Giao d�ch/yes",
			--"Ho�t ��ng c�a h�ng /HuoDongyes", 
			"Kh�ng giao d�ch/no"		};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070202 and nDate <= 20200225) then
		tinsert(tbOpp, 1, "Mua thi�p ch�c T�t/BuySpringFestival07Card");
	end;
	
	if (nDate >= 20070314 and nDate <= 20070321) then
		tinsert(tbOpp, 1, "Mua Kim th�ch/buy_collect_juanzhou")
	end;
	return tbOpp;
end;

function store_sel_village_extend()
	local tbOpp = {
			"Giao d�ch/yes",
		--"Ho�t ��ng c�a h�ng /HuoDongyes",
		"Ta ��n nh�n nhi�m v� S� nh�p/zboss",
		"Th�i kh�ng c�n ��u/no",
			};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070314 and nDate <= 20070321) then
		tinsert(tbOpp, 1, "Mua Kim th�ch/buy_collect_juanzhou")
	end;
	return tbOpp;
end;

function BuySpringFestival07Card()
	Sale(148);
end;

function buy_collect_juanzhou()
	Sale(165);
end;
function HuoDongyes() 
Sale(179); 
end; 