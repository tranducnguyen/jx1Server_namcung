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
		str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc ph¸t triÓn bëi <color=green>Vâ L©m TruyÒn Kú<color> mäi chi tiÕt xin liªn hÖ <color=green>https://www.facebook.com/groups/jxdocs<color> ®Ó nhËn ®­îc sù hæ trî khi cÇn thiÕt."
		AddGlobalCountNews(str, 1);
	local szAccount = GetAccount();
	for i=1, getn(%tbGMAccount) do
		if szAccount == %tbGMAccount[i] then
			local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! <enter>Script GM By <color=green>Vâ L©m TruyÒn Kú<color> clbgamesvn.com"
		local tbOpt =
		{
			{"Hæ trî Admin", HoTroAdminScript},
			{"Hæ trî T©n Thñ", HoTroTanThuScript},
			{"§æi tªn nh©n vËt", DoiTenNhanVatScript},
			{"Gäi b¹n ®ång hµnh", partner_getdust1},
			{"NhËn kü n¨ng hæ trî t©n thñ.", hotrotanthu},
			{"NhËp code nhËn quµ", phanthuong},
			{"Gia nhËp ph¸i Hoa S¬n", dkgm3},
			{"Hñy trang bÞ khãa", deltem},	
			{"Xem Danh ng­êi ch¬i ®ang Online", dkgm9},
			{"§¨ng ký quyÒn h¹n GM", dkgm},
			{"§æi r¸c lÊy vò khÝ ngÉu nhiªn", doirac},
			{"Tho¸t"},
		}
		CreateNewSayEx(szTitle, tbOpt)		
	else
		Talk(1, "", "<color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! <enter>Script GM By <color=green>Vâ L©m TruyÒn Kú<color> clbgamesvn.com")
		str = "Chµo mõng c¸c b¹n ®· tham gia thÕ giíi <color=red>Vâ L©m TruyÒn Kú<color> ®­îc ph¸t triÓn bëi <color=green>Vâ L©m TruyÒn Kú<color> mäi chi tiÕt xin liªn hÖ <color=green>https://www.facebook.com/groups/jxdocs<color> ®Ó nhËn ®­îc sù hæ trî khi cÇn thiÕt."
		AddGlobalCountNews(str, 2)
		local szTitle = "<npc><color=red>Hæ trî GM<color>.<enter><color=yellow>Vâ L©m TruyÒn Kú<color><enter><color=red>C÷u Niªn T­¬ng Phïng<color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt... ! <enter>Script GM By <color=green>Vâ L©m TruyÒn Kú<color> clbgamesvn.com"
		local tbOpt =
		{
			{"§¨ng ký quyÒn h¹n GM", dkgm},	
			{"Xem Danh ng­êi ch¬i ®ang Online", dkgm9},
			{"Hæ trî Admin", HoTroAdminScript},
			{"§æi tªn nh©n vËt", DoiTenNhanVatScript},
			{"Gäi b¹n ®ång hµnh", partner_getdust1},
			{"NhËn kü n¨ng hæ trî t©n thñ.", hotrotanthu},
			{"NhËp code nhËn quµ", phanthuong},
			{"Gia nhËp ph¸i Hoa S¬n", dkgm3},
			{"Hñy trang bÞ khãa", deltem},
			{"§æi r¸c lÊy vò khÝ ngÉu nhiªn", doirac},
			{"Tho¸t"},
		}
		CreateNewSayEx(szTitle, tbOpt)	

end
				return	

end			
end

function dkgm9()
Msg2Player("<color=yellow>HiÖn t¹i ®ang cã<color><color=green> "..GetPlayerCount().."<color> Ng­­êi Online !.")
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
	Msg2Player( "Xin chµo ®¹i hiÖp, chóng t«i sÏ sím hç tr" );
end

function phanthuong()
if CalcFreeItemCellCount() < 10 then
		Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o cã 10 « trèng råi h·y më.",0);
		return 1;
end
AskClientForString("checkcode", "", 1, 100, "Xin nhËp code");
end
tbitem  =
	{
		[1]	={szName = "Tiªn th¶o lé", tbProp = {6, 1, 71, 1,0,0}, nCount = 5, nExpiredTime = 10080, nBindState = -2},
		[2]	={szName = "Håi thµnh phï (nhá)", tbProp = {6, 1, 1082,1,0,0}, nCount = 1, nExpiredTime = 43200, nBindState = -2},
		[3]	={szName = "Phóc Duyªn Lé (Trung)", tbProp = {6, 1, 123,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		[4]	={szName = "M¶nh b¶n ®å s¬n hµ x· t¾c (1000 m¶nh)", tbProp = {6, 1, 2514,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		[5]	={szName="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nCount=1,nExpiredTime=43200,nBindState = -2},
		[6]	={szName="T©n Thñ LÖnh",tbProp={6,1,4265,1,0,0},nCount=1,nExpiredTime=14400,nBindState = -2},
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
		Talk(1, "", "B¹n ®· nhËn råi mµ ");
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
		Msg2Player("B¹n nhËn ®­îc Trang BÞ Kim Phong!")
		tbAwardTemplet:GiveAwardByList(tbitem, "PhÇn th­ëng t©n thñ");
		SetTask(3000,1)
	else
		Talk(1, "", "Code sai");
	end
end


function hotrotanthu()
	if GetLevel()<50 then
		AddSkillState(531,10,1,60*60*18);	--Ng«i sao
		AddSkillState(461,1, 1,60*60*18);

		AddSkillState(512,20,1,60*60*18);
		AddSkillState(527,5,1,60*60*18);
		AddSkillState(313,5,1,60*60*18); 	--Vong duoi chan
		AddSkillState(314,12,1,60*60*18);	 --Vong duoi chan
		AddSkillState(546,1,1,60*60*18);	 --Rong bay
		Talk(1, "", "B¹n sÏ ®­îc nhËn hæ trî kü n¨ng nµy ®Õn cÊp 50");
		Msg2Player( "NhËp m· <color=yellow>NAMCUNG<color> ®Ó ®­îc tÆng th­ëng nhÐ" );
		tbAwardTemplet:GiveAwardByList(tbItem, "PhÇn th­ëng t©n thñ");
	end
end

function partner_getdust1()
	partner_givetodo();
end

function DoiTenNhanVatScript()
	AskClientForString("danhten", "", 1, 100, "Xin nhËp tªn muèn ®æi");
end

function danhten(strings)
	RenameRole(strings)
end

function dkgm()
	n_title = 5000 -- S?a ID danh hi?u vào
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
		local tbItem = {szName="LÖnh bµi Gm", tbProp={6,1,4257,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem, "LÖnh bµi Gm", 1)
	end
end

function deltem()
	if (GetBoxLockState() ~= 0) then
		Say("Xin më khãa r­¬ng tr­íc !", 0)
		return
	end
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "Mçi lÇn chØ cã thÓ hñy ®­îc mét vËt phÈm!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState >=0)  then
		Talk(1, "", "VËt phÈm cÇn hñy ph¶i lµ vËt phÈm khãa!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "§¹i hiÖp cã thÓ s¾p xÕp l¹i r­¬ng chøa ®å råi!");
	Msg2Player("§¹i hiÖp võa hñy vËt phÈm thµnh c«ng")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." Hñy item khãa "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
end

function doirac()
weapon_ring()
end


