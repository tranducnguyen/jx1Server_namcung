-- 临安　职能　杂货店老板
-- by：Dan_Deng(2003-09-16)

--========脚本修改==================================--
--修改者：yfeng
--修改日期：2005-1-28
--修改原因：春节市场活动
--
--
--==================================================--
Include "/script/event/chinesenewyear/eventhead.lua"
Include("\\script\\global\\global_zahuodian.lua");


--if CHINESENEWYEAR then
--	tinsert(Buttons,1,"购买节日道具/BuyNewyearItem")
--end 
	
function main()
local Buttons = store_sel_extend();
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2006122200 and nDate <= 2007011424) then
		tinsert(Buttons,1,"Mua Thi謕/BuyVnXasCard")
	end;
	Say("B鎛 ti謒 x璶g danh l� 't筽 h鉧 nam b綾'. H祅g h鉧 ng t﹜ nam b綾 u c�  c�. S琻 H� � Йng H秈, m� l筩  � Gobi, Kh鎛g tc Linh � L躰h Nam, da ch錸 t輒 � n骾 Trng B筩h, b蕋 k� l� th� ngi  nh譶 th蕐 hay ch璦 t鮪g th蕐 qua, � y ta u c� c� ",
			getn(Buttons),
			Buttons)
end;

function yes()
	Sale(2);  				--弹出交易框
end;

function no()
end;

function BuyNewyearItem()
	Sale(101)
	return
end

function BuyChristmasCard()
	Sale(97);
end

function BuyVnXasCard()
	Sale(147)
end;