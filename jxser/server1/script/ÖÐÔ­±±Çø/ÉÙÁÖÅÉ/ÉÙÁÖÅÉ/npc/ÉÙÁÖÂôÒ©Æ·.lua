--少林派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("Tuy n鉯 v� c玭g b鎛 ph竔 t╪g cng s鴆 kh醗, nh璶g c騨g c� l骳 l﹎ b謓h, n猲 c騨g c莕 c竎 lo筰 thu鑓 men.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h, thu鑓 c馻 b鎛 ph竔 ch� b竛 cho ng m玭")
	end
end;

function yes()
Sale(71)
end;

function no()
end;
