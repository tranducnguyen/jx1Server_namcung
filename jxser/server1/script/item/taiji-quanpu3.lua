-- Created by fangjieying 2003-5-17
-- 《太极拳谱·卷三》
-- 学会技能 天地无极
-- 武当，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(365)
	if(party ~= "wudang") then							-- 不是武当
		Msg2Player("B筺 nghi猲 c鴘 Th竔 C鵦 Ki誱 Ph� - Quy觧 3 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是武当但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Th竔 C鵦 Ki誱 Ph� - Quy觧 3 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Th竔 C鵦 Ki誱 Ph� - Quy觧 3, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(365,1)	
		Msg2Player("H鋍 頲 k� n╪g Thi猲 мa V� C鵦. ")
		return 0
	end
end