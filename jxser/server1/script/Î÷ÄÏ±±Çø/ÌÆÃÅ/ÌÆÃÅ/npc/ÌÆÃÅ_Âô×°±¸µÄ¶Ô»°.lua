--西南北区 唐门 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("е t� b鎛 m玭 th﹏ ph竝 nhanh nh裯, th輈h h頿 trang b� nh鱪g v� kh� nh� g鋘!", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","M玭 ch� c� l謓h: trang b� m玭 ph竔 ch� b竛 cho t� mu閕 ng m玭!")
	end
end;

function yes()
Sale(55)
end;

function no()
end;
