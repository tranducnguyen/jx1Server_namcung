-- 石鼓镇 职能 药店老板
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
		Say("Th筩h C� Tr蕁 t� truy襫, b秓 m tr� b� b謓h, Kh竎h quan mu鑞 mua g�?", 3, "Giao d辌h/yes","Ta n nh薾 nhi謒 v� S� nh藀/yboss", "Kh玭g giao d辌h/no")
end;

function yes()
	Sale(27);  			--弹出交易框
end;

function no()
end;
