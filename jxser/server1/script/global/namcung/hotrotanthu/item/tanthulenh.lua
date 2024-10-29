--- §ua top by Nam Cung Nhat Thien---

Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\bonusvlmc\\fucmain.lua")
Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
Include("\\script\\event\\tongwar\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include([[\script\missions\chrismas\ch_head.lua]]);--
Include([[\script\event\springfestival07\head.lua]]);
Include( "\\script\\event\\wulinling\\wulinling.lua" )
Include( "\\script\\event\\nanfangjiefangri\\event.lua" )
Include("\\script\\event\\tongwar\\head.lua");
Include("\\script\\vng_event\\vip_account_2011\\npc\\volamtruyennhan.lua")
Include("\\script\\global\\namcung\\hotrotanthu\\duatop.lua")
Include("\\script\\global\\Â·ÈË_ÎäÁÖÃË´«ÈË.lua")
function main()
		dofile("script/global/namcung/tanthulenh.lua");	
local szTitle =  "<npc>Chµo mõng b¹n ®Õn víi thÕ giíi<color=red> Vâ L©m TruyÒn Kú <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt ®· ®Õn víi <color=green>Vâ L©m TruyÒn Kú<color>...<enter>Bæn trang muèn mang ®Õn cho c¸c b¹n mét s©n ch¬i lµnh m¹nh vµ æn ®Þnh l©u dµi...!<enter>Mäi chi tiÕt th¾c m¾c xin c¸c nh©n sü ®ãng gãp t¹i <color=red>https://www.facebook.com/groups/jxdocs<color>.<enter>Chóc c¸c nh©n sü b«n tÈu giang hå vui vÎ t¹i <color=green>ThÕ Giíi ¶o<color>. Xin ch©n thµnh c¶m ¬n quý nh©n sü... !"
		local tbOpt =
	{
		{"NhËn lÔ bao T©n thñ", lebao},	
		{"NhËn th­ëng theo cÊp ®é", top10all},
		--{"NhËn th­ìng tÝch luy giê choi Online",tichluy},
		{"Lµm nhiªm vô mçi ngµy", nhiemvu},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	
	return 1				
end

function lebao()
dofile("script/global/namcung/tanthulenh.lua");	
		if GetTask(3010) == 1 then
			Talk(1, "", "Ng­êi ®· nhËn phÇn th­ëng nµy råi c¬ mµ !");
			return
		end
		local tbAwardItem = {szName = "LÔ Bao T©n Thñ", tbProp = {6, 1, 4258, 1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc 1 lÔ bao t©n thñ!");
		SetTask(3010,1)
end
function top10all()
	duatop()
end

function tichluy()
local szTitle =  "<npc>Chµo mõng b¹n ®Õn víi thÕ giíi<color=red> Vâ L©m TruyÒn Kú <color>.<enter>Hoan nghªnh c¸c anh hïng hµo kiÖt ®· ®Õn víi <color=green>Vâ L©m TruyÒn Kú<color>...<enter>Bæn trang muèn mang ®Õn cho c¸c b¹n mét s©n ch¬i lµnh m¹nh vµ æn ®Þnh l©u dµi...!<enter>Mäi chi tiÕt th¾c m¾c xin c¸c nh©n sü ®ãng gãp t¹i <color=red>https://www.facebook.com/groups/jxdocs<color>.<enter>Chóc c¸c nh©n sü b«n tÈu giang hå vui vÎ t¹i <color=green>KÝ øc Vâ L©m<color>. Xin ch©n thµnh c¶m ¬n quý nh©n sü... !"
		local tbOpt =
	{
		{"NhËn th­ëng phóc duyªn", phucduyen},	
		{"NhËn  th­ëng danh väng", danhvong},
		{"NhËn th­ëng tiªn th¶o lé",tienthaolo},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)					
end

function phucduyen()
OnGain_Self()	
end
function danhvong()
W33_prise()		
end
function tienthaolo()
if (GetGameTime()  >= 7200) then

		local tbAwardItem ={szName = "Tiªn th¶o lé", tbProp = {6, 1, 71, 1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Tiªn th¶o lé");

else

	Say("§iÒu kiÖn cña ng­¬i hiÖn nay kh«ng ®ñ ®Ó nhËn Tiªn th¶o lé. H·y luyÖn tËp thªm !",0)

end

end

function nhiemvu()
VLMC_main()		
end	

