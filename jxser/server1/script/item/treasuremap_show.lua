
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机任务藏宝图物品使用处理文件
-- Edited by peres
-- 2005/10/19 PM 14:22

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================

Include("\\script\\task\\random\\treasure_head.lua");  -- 藏宝图鉴赏功能


function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local nRow = magiclevel1;

	if magiclevel2==0 then
		return "<enter>M閠 b鴆 a , h譶h nh� hng d蒼 阯g n kho b竨.<enter> Tuy nhi猲  qu� c� kh玭g th� xem 頲, ch� c遪 c竎h n <color=green>Long Tuy襫 Th玭<color> t譵 <color=green>Ph� L玦 Th�<color> nh� gi髉 ";
	else
		return showTreasureText(nRow)
	end;

end;

-- 显示藏宝图具体的位置信息
function showTreasureText(nRow)

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

	return "<enter>M閠 b鴆 a , h譶h nh� hng d蒼 阯g n kho b竨.<enter><enter>"..
		   "Tr猲 tranh 萵 萵 hi謓 hi謓 ra n琲 y l�<color=green>"..strInfo.."<color><enter><enter>"..
		   "<color=yellow>Nh蕁 chu閠 ph秈 c� th� b総 u o<color><enter>";

end;