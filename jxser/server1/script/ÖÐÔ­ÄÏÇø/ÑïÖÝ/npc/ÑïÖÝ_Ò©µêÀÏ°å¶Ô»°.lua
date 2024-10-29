-- 中原南区 扬州府 药店老板对话（五毒40级任务）
-- Update：Dan_Deng 加入五毒任务（2003-10-12）
Include("\\script\\config\\cfg_features.lua")

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(142) == 0) then 		--任务中
		local tbSay = {}
		tinsert(tbSay,"Mua 頲 X� hng/L40_buy_yes")
		tinsert(tbSay,"Giao d辌h/yes")
		if CFG_HONNGUYENLINHLO == 1 then
			tinsert(tbSay,"Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine")
		end
		tinsert(tbSay,"Kh玭g giao d辌h/no")
		Say("Gi� dc li謚 qu� X� Hng h玬 nay l� 500 lng th玦!",getn(tbSay),tbSay)
	else
		local tbSay = {}
		tinsert(tbSay,"Giao d辌h/yes")
		if CFG_HONNGUYENLINHLO == 1 then
			tinsert(tbSay,"Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine")
		end
		tinsert(tbSay,"Kh玭g giao d辌h/no")
		Say("Ch� t玦 y dc li謚 g� c騨g c�, c� b謓h th� kh醝 b謓h, kh玭g b謓h kh醗 ngi, b竛 thu鑓 ng gi� kh玭g l鮝 g箃, ng礽 mua m閠 輙 ch�?",getn(tbSay),tbSay)
	end
end;

function L40_buy_yes()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(142)
		AddNote("Mua 頲 X� hng.")
		Msg2Player("Mua 頲 X� hng.")
	else
		Talk(1,"","Gi� v藋 c騨g mua kh玭g n鎖, 甶 ra cho ta l祄 ╪!")
	end
end;

function yes()
Sale(96);  			--弹出交易框
end;

function no()
end;
