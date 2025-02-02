--以福缘出售物品的NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include([[\script\event\mid_autumn06\head.lua]]);
Include("\\script\\vng_feature\\thuongnhanthanbi\\moruongfour\\openchestfour.lua")

function main()
	local tab_Content = {
		"Giao d辌h/OnBuy", 
		"Kh玭g giao d辌h/OnCancel", 
		--"Xin h穣 a ta n ng鋘 n骾 Trng B筩h/GotoHuanZhuan",
		"Li猲 quan n ph骳 duy猲/OnAbout"
	};
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "Ho箃 ng Trung Thu/au06_lpaw_entrance");
	end;
	tinsert(tab_Content, "M� rng 4/#tbChectfour:main()");
	Say ( "Kh竎h quan mu鑞 mua g�? B鎛 ti謒 kh玭g thi誹 m鉵 g�!", getn(tab_Content), tab_Content);
end

function OnBuy()
	Sale( 93, 2 );
end

function OnAbout()
	Talk( 3, "", "S� 甶觤 ph骳 duy猲: Th玭g qua t輈h l騳 th阨 gian Online s� i l蕐 m閠 s� 甶觤 秓, c� th� d飊g  i c竎 lo筰 v藅 ph萴 c bi謙  � Th莕 b� Thng Nh﹏ Li評 蕋(Tng Dng) .", "фi ph骳 duy猲: Sau khi online > 2 gi�, n V� L﹎ Truy襫 Nh﹏ � c竎 Чi th祅h th�  i. N誹 1 ng祔 i ph骳 duy猲 th祅h c玭g 2 l莕, s� nh薾 頲 ph莕 thng. N誹 Online < 4 gi�, m鏸 gi� i 頲 1 甶觤. Sau , m鏸 2 gi� i 頲 1 甶觤. Th祅h vi猲 trong i c� th� nh薾 甶觤 gi髉 cho c� i.", "襲 ki謓 h筺 ch�: ng � i lao v� Уo Hoa Фo s� kh玭g 頲 t輓h t輈h l騳 th阨 gian online" );
end

function au06_lpaw_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ngi ch琲 n筽 th� m韎 c� th� tham gia ho箃 ng Trung thu", 0);
		return
	end;
	Say("N誹 ngi c� <color=yellow> 10 Thng C� l謓h b礽<color> ta s� i cho 1  <color=yellow>Ph鬾g Nguy謙 Qu� Dung<color> t╪g 甶觤 k� n╪g ho芻 1 <color=yellow>C鑞g Nguy謙 Ph� Dung<color> t╪g 甶觤 ti襪 n╪g.", 3, "фi 10 Thng C� l謓h b礽 l蕐 Ph鬾g Nguy謙 Qu� Dung/#shangjialingpai(1)", "фi 10 Thng C� l謓h b礽 l蕐 C鑞g Nguy謙 Ph� Dung/#shangjialingpai(2)", "Nh﹏ ti謓 gh� qua th玦/oncancel");
end;

function shangjialingpai(nIndex)
	if (CalcEquiproomItemCount(6, 1, 1252, -1) < 10) then
		Say("Ngi ch璦  10 Thng C� l謓h b礽", 0);
		return
	end;
	
	--扣除物品
	if (ConsumeEquiproomItem(10, 6, 1, 1252, -1) ~= 1) then
		return
	end
	
	--给予奖励
	local str = "<color=yellow>Ph鬾g Nguy謙 Qu� Dung<color>";
	if (nIndex == 1) then -- 增加一个技能点
		AddItem(6, 1, 127, 1, 0, 0, 0);
	else -- 增加5个潜能点
		AddItem(6, 1, 128, 1, 0, 0, 0);
		str = "<color=yellow>C鑞g Nguy謙 Ph� Dung<color>";
	end;
	
	--给予提示
	Say("Hay qu�! Xin nh薾 ch髏 qu� m鋘 p l�!", 0);
	Msg2Player("B筺 t 頲"..str);
end;

function OnCancel()
end
function GotoHuanZhuan()
	NewWorld(934, 49632 / 32, 105696 /32)
end
