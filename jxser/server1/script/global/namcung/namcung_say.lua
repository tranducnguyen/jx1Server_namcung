IncludeLib("SETTING");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\activitysys\\functionlib.lua");
Include("\\script\\lib\\log.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\global\\fuyuan.lua");
Include("\\script\\global\\gmrole.lua");
Include("\\script\\global\\namcung\\hotrogm.lua");
Include("\\script\\global\\namcung\\xephang\\top10_all.lua");
Include("\\script\\task\\partner\\education\\swordking_people.lua");
Include("\\script\\global\\namcung\\hotrotanthu\\doiraclayvk.lua");

local tbGMAccount = {"123456", "admin1", "admin2", "admin3", "admin4", "nguyen"}
function main()
	dofile("script/global/namcung/namcung_say.lua");		
		str = "Ch�o m�ng c�c b�n �� tham gia th� gi�i <color=red>V� L�m Truy�n K�<color> ���c ph�t tri�n b�i <color=green>V� L�m Truy�n K�<color> m�i chi ti�t xin li�n h� <color=green>https://www.facebook.com/groups/jxdocs<color> �� nh�n ���c s� h� tr� khi c�n thi�t."
		AddGlobalCountNews(str, 1);
	local szAccount = GetAccount();
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>H� tr� GM<color>.<enter><color=yellow>V� L�m Truy�n K�<color><enter><color=red>C�u Ni�n T��ng Ph�ng<color>.<enter>Hoan ngh�nh c�c anh h�ng h�o ki�t... ! <enter>Script GM By <color=green>V� L�m Truy�n K�<color> clbgamesvn.com"
		local tbOpt =
		{
			{"H� tr� Admin", HoTroAdminScript},
			{"H� tr� T�n Th�", HoTroTanThuScript},
			{"��i t�n nh�n v�t", DoiTenNhanVatScript},
			{"G�i b�n ��ng h�nh", partner_getdust1},
			{"Nh�n k� n�ng h� tr� t�n th�.", hotrotanthu},
			{"Nh�p code nh�n qu�", phanthuong},
			{"Gia nh�p ph�i Hoa S�n", dkgm3},
			{"H�y trang b� kh�a", deltem},	
			{"Xem Danh ng��i ch�i �ang Online", dkgm9},
			{"��ng k� quy�n h�n GM", dkgm},
			{"��i r�c l�y v� kh� ng�u nhi�n", doirac},
			{"Tho�t"},
		}
		CreateNewSayEx(szTitle, tbOpt)		
	else
		Talk(1, "", "<color=yellow>V� L�m Truy�n K�<color><enter><color=red>C�u Ni�n T��ng Ph�ng<color>.<enter>Hoan ngh�nh c�c anh h�ng h�o ki�t... ! <enter>Script GM By <color=green>V� L�m Truy�n K�<color> clbgamesvn.com")
		str = "Ch�o m�ng c�c b�n �� tham gia th� gi�i <color=red>V� L�m Truy�n K�<color> ���c ph�t tri�n b�i <color=green>V� L�m Truy�n K�<color> m�i chi ti�t xin li�n h� <color=green>https://www.facebook.com/groups/jxdocs<color> �� nh�n ���c s� h� tr� khi c�n thi�t."
		AddGlobalCountNews(str, 2)
		local szTitle = "<npc><color=red>H� tr� GM<color>.<enter><color=yellow>V� L�m Truy�n K�<color><enter><color=red>C�u Ni�n T��ng Ph�ng<color>.<enter>Hoan ngh�nh c�c anh h�ng h�o ki�t... ! <enter>Script GM By <color=green>V� L�m Truy�n K�<color> clbgamesvn.com"
		local tbOpt =
		{
			{"��ng k� quy�n h�n GM", dkgm},	
			{"Xem Danh ng��i ch�i �ang Online", dkgm9},
			{"H� tr� Admin", HoTroAdminScript},
			{"��i t�n nh�n v�t", DoiTenNhanVatScript},
			{"G�i b�n ��ng h�nh", partner_getdust1},
			{"Nh�n k� n�ng h� tr� t�n th�.", hotrotanthu},
			{"Nh�p code nh�n qu�", phanthuong},
			{"Gia nh�p ph�i Hoa S�n", dkgm3},
			{"H�y trang b� kh�a", deltem},
			{"��i r�c l�y v� kh� ng�u nhi�n", doirac},
			{"Tho�t"},
		}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function dkgm9()
Msg2Player("<color=yellow>Hi�n t�i �ang c�<color><color=green> "..GetPlayerCount().."<color> Ng���i Online !.")
end

function dkgm4()
ShowTopList()
end

function dkgm3()
hoason()

end

function HoTroAdminScript()
namcung2()
end
function HoTroTanThuScript()
	Msg2Player( "Xin ch�o ��i hi�p, ch�ng t�i s� s�m h� tr" );
end

function phanthuong()
if CalcFreeItemCellCount() < 10 then
		Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 10 � tr�ng r�i h�y m�.",0);
		return 1;
end
AskClientForString("checkcode", "", 1, 100, "Xin nh�p code");
end
tbitem  =
	{
		[1]	={szName = "Ti�n th�o l�", tbProp = {6, 1, 71, 1,0,0}, nCount = 5, nExpiredTime = 10080, nBindState = -2},
		[2]	={szName = "H�i th�nh ph� (nh�)", tbProp = {6, 1, 1082,1,0,0}, nCount = 1, nExpiredTime = 43200, nBindState = -2},
		[3]	={szName = "Ph�c Duy�n L� (Trung)", tbProp = {6, 1, 123,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		[4]	={szName = "M�nh b�n �� s�n h� x� t�c (1000 m�nh)", tbProp = {6, 1, 2514,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		[5]	={szName="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nCount=1,nExpiredTime=43200,nBindState = -2},
		[6]	={szName="T�n Th� L�nh",tbProp={6,1,4265,1,0,0},nCount=1,nExpiredTime=14400,nBindState = -2},
	}
function checkcode(strings)
	if strings=="KAKAMI"then
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
	end
	if GetTask(3000)==1 then
		Talk(1, "", "B�n �� nh�n r�i m� ");
		return
	end
	if strings=="NAMCUNG"then
		SetItemBindState(AddGoldItem(0,184), -2)
		SetItemBindState(AddGoldItem(0,179), -2)
		SetItemBindState(AddGoldItem(0,177), -2)
		SetItemBindState(AddGoldItem(0,178), -2)
		SetItemBindState(AddGoldItem(0,180), -2)
		SetItemBindState(AddGoldItem(0,183), -2)
		SetItemBindState(AddGoldItem(0,181), -2)
		SetItemBindState(AddGoldItem(0,182), -2)
		SetItemBindState(AddGoldItem(0,185), -2)
		Msg2Player("B�n nh�n ���c Trang B� Kim Phong!")
		tbAwardTemplet:GiveAwardByList(tbitem, "Ph�n th��ng t�n th�");
		SetTask(3000,1)
	else
		Talk(1, "", "Code sai");
	end
end


function hotrotanthu()
	if GetLevel()<50 then
		AddSkillState(531,10,1,60*60*18);	--Ng�i sao
		AddSkillState(461,1, 1,60*60*18);

		AddSkillState(512,20,1,60*60*18);
		AddSkillState(527,5,1,60*60*18);
		AddSkillState(313,5,1,60*60*18); 	--Vong duoi chan
		AddSkillState(314,12,1,60*60*18);	 --Vong duoi chan
		AddSkillState(546,1,1,60*60*18);	 --Rong bay
		Talk(1, "", "B�n s� ���c nh�n h� tr� k� n�ng n�y ��n c�p 50");
		Msg2Player( "Nh�p m� <color=yellow>NAMCUNG<color> �� ���c t�ng th��ng nh�" );
		tbAwardTemplet:GiveAwardByList(tbItem, "Ph�n th��ng t�n th�");
	end
end

function partner_getdust1()
	partner_givetodo();
end

function DoiTenNhanVatScript()
	AskClientForString("danhten", "", 1, 100, "Xin nh�p t�n mu�n ��i");
end

function danhten(strings)
	RenameRole(strings)
end

function dkgm()
	n_title = 5000 -- S?a ID danh hi?u v�o
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate = FormatTime2Number(nServerTime);
	local nDay = floor(mod(nDate,1000000) / 10000);
	local nMon = mod(floor(nDate / 1000000) , 100)
	local nTime = nMon * 1000000 + nDay * 10000 
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	local nCurLevel = GetLevel()
	if nCurLevel < 150 then
		ST_LevelUp(150 - nCurLevel)
	end
	SetFightState(1)
	--SetCamp(6)
	--SetCurCamp(6)
	AddMagic(732, 50) --Skill GM
	AddMagic(733, 50) --Skill GM
	if CalcFreeItemCellCount() >= 1 then
		local tbItem = {szName="L�nh b�i Gm", tbProp={6,1,4257,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem, "L�nh b�i Gm", 1)
	end
end

function deltem()
	if (GetBoxLockState() ~= 0) then
		Say("Xin m� kh�a r��ng tr��c !", 0)
		return
	end
	GiveItemUI("H�y v�t ph�m", "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "M�i l�n ch� c� th� h�y ���c m�t v�t ph�m!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState >=0)  then
		Talk(1, "", "V�t ph�m c�n h�y ph�i l� v�t ph�m kh�a!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "��i hi�p c� th� s�p x�p l�i r��ng ch�a �� r�i!");
	Msg2Player("��i hi�p v�a h�y v�t ph�m th�nh c�ng")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." H�y item kh�a "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
end

function doirac()
weapon_ring()
end


