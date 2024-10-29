function TaskShedule()
	TaskName("Ph��ng T��ng ghi danh");
	-- ������
	TaskInterval(60);	--ÿ��
	local ndate = tonumber(date("%H"))
	ndate = ndate + 1 
	if ndate >=24 then
		ndate = 0
	end
	TaskTime(ndate, 0);
	TaskCountLimit(0);
	OutputMsg(format("Ho�t ��ng h�i l�c ��u xu�n 2008 %s:00 b�t ��u",ndate))
end
NewYear2008_cailu_tbdate = 
{
	nstart = 80202,
	nend = 80302,
	ndate = { 
		nstart = 80205,
		nend = 80211,
		common =
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		}
	},
	nweek = {
		common = {
			{10,11},
			{22,23}
		},
		Satweek = 
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		},
		Sunweek =
		{
			{10,11},
			{14,15},
			{22,23},
		},
	}
}
function TaskContent()
	local ndate = tonumber(date("%y%m%d"))
	local nhour = tonumber(date("%H"))
	local nweek = tonumber(date("%w"))
	local szstrstrat = "<color=yellow>[��u xu�n h�i l�c ]<color> �� ch�nh th�c b�t ��u , h�y nhanh ch�n tham gia."
	local szstrend = "<color=yellow>[��u xu�n h�i l�c]<color> ��  k�t th�c , l�n sau h�y nhanh ch�n tham gia"
	if ndate < NewYear2008_cailu_tbdate.nstart or ndate > NewYear2008_cailu_tbdate.nend then
		return
	end
	local tbspdate =  NewYear2008_cailu_tbdate.ndate
	if ndate >= tbspdate.nstart and ndate <= tbspdate.nend then
		for ni,nitem in tbspdate.common do
			if nhour == nitem[1] then
					NewYear2008_cailu_msg(szstrstrat)
					return
			end
			if nhour == nitem[2] then
					NewYear2008_cailu_msg(szstrend)
					return				
			end
		end
	else
		local tbdate
		if nweek == 6 then
			tbdate = NewYear2008_cailu_tbdate.nweek.Satweek
		elseif nweek == 0 then
			tbdate = NewYear2008_cailu_tbdate.nweek.Sunweek
		else
			tbdate = NewYear2008_cailu_tbdate.nweek.common
		end 
		for ni,nitem in tbdate do
			if nhour == nitem[1] then
					NewYear2008_cailu_msg(szstrstrat)
					return
			end
			if nhour == nitem[2] then
					NewYear2008_cailu_msg(szstrend)
					return				
			end			
		end
	end
end

function NewYear2008_cailu_msg(str)
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
