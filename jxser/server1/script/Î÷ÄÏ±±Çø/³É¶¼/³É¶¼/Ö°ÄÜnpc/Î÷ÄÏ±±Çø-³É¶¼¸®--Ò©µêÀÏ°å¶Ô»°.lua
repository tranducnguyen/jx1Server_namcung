--西南北区 成都府 药店老板对话
Include("\\script\\config\\cfg_features.lua")
-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	local tbSay = {}
	tinsert(tbSay,"Giao d辌h/yes")
	if CFG_HONNGUYENLINHLO == 1 then
		tinsert(tbSay,"Ta mu鑞 ch� t筼 H鏽 Nguy猲 Linh L�/refine")
	end
	tinsert(tbSay,"Kh玭g giao d辌h/Cancel")
	Say("L骳 ta c遪 tr�, mu鑞 l祄 m閠 danh y gi鑞g nh� Hoa У, sau n祔 l藀 gia th蕋 sinh con  c竔, v� nu玦 m蕐 mi謓g ╪ m� ch� c� th� m� c竔 ti謒 thu鑓 n祔 th玦. Chao!Con ngi c馻 ta, nhi襲 chuy謓 n穣 gi� m� v蒼 ch璦 h醝 kh竎h quan c莕 mua thu鑓 g�?",getn(tbSay),tbSay)
end

function yes()
	Sale(15) 		--弹出交易框
end
