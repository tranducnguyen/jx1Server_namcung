--中原南区 武当派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("C竎 l鋋i thu鑓 n祔 u d飊g th秓 dc sinh trng tr猲 V� ng s琻 ch� th祅h, c� th� c莔 m竨 ch鱝 thng, l筰 c� th� t╪g cng s鴆 kh醗.", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Chng m玭 c� l謓h,dc ph萴 b鎛 gi竜 ch� c� th� b竛 cho m玭 h� V� ng.")
	end
end;

function yes()
Sale(65);  			
end;

function no()
end;






