-- 随机宝箱物品（随机获得一样物品）
-- By: Dan_Deng(2004-06-01)

function main(sel)
	p=random(0,99)
	if (p < 5) then
		p = random(238,240)
		AddEventItem(p)			-- 水晶
		Msg2Player("B筺 nh薾 頲 m閠 vi猲 Th駓 Tinh. ")
	elseif (p < 10) then
		AddEventItem(353)			-- 猩红
		Msg2Player("B筺 nh薾 頲 m閠 vi猲 Tinh H錸g B秓 Th筩h. ")
	elseif (p < 20) then
		AddItem(6,1,15,1,0,0,0)		-- 披风
		Msg2Player("B筺 nh薾 頲 m閠 t蕀 竜 kho竎. ")
	elseif(p < 40) then
		AddItem(6,1,18,1,0,0,0)		-- 心心相印
		Msg2Player("B筺 nh薾 頲 m閠 c竔 T﹎ T﹎ Tng 蕁 ph�! ")
	elseif (p < 65) then
		AddItem(6,1,19,1,0,0,0)		-- 吉祥包
		Msg2Player("B筺 nh薾 頲 m閠 c竔 T﹎ T﹎ Tng 蕁 ph�! ")
	else
		AddItem(6,0,20,1,0,0,0)		-- 玫瑰雨
		Msg2Player("B筺 nh薾 頲 m閠 c祅h hoa h錸g. ")
	end
	return 0
end
