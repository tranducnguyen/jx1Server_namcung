Include("\\script\\activitysys\\config\\26\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click v祇 NPC B祅 Ti謈",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B祅 Ti謈"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu鑞 ╪ th鴆 ╪",2} },
		{"AddDialogOpt",	{"Ta mu鑞 u Ru",3} },
		{"SetDialogTitle",	{"Ch骳 M鮪g N╩ M韎!"} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "nil",
	szName = "Ta mu鑞 ╪ th鴆 ╪",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"Ch� c� nh鱪g Hi謕 S� c� ng c蕄 150 v� 150 tr� l猲 ho芻 l� nh鱪g Hi謕 S�  tr飊g sinh m韎 c� th� tham gia ho箃 ng n祔.",">="} },
		{"ThisActivity:CheckTask",	{TSK_TotalEatExp,nTotalEatUpExp,"Thi誹 Hi謕 ngi ╪ th鴆 ╪ nh薾 頲 kinh nghi謒  t n gi韎 h筺 r錳, kh玭g th� ╪ th猰 頲 n鱝","<"} },
		{"ThisActivity:CheckTaskA",	{TSK_EatExp, TSK_EatExpDate, nEatUpExp,"Xin l鏸, Thi誹 Hi謕 h玬 nay ngi ╪ no q骯 r錳, ng祔 mai l筰 n nh�.",nNumber} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveEatAward",	{TSK_EatExp, TSK_EatExpDate, TSK_TotalEatExp, nNumber} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Ta mu鑞 u Ru",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"u Ru , u ch輓h l� tr� tu� v� v薾 may"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"Ch� c� nh鱪g Hi謕 S� c� ng c蕄 150 v� 150 tr� l猲 ho芻 l� nh鱪g Hi謕 S�  tr飊g sinh m韎 c� th� tham gia ho箃 ng n祔.",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi韎 thi謚 quy t綾 u Ru",4} },
		{"AddDialogOpt",	{"Ta mu鑞 b総 u u ru",5} },
		{"AddDialogOpt",	{"Ta mu鑞 ki觤 tra k誸 qu� u ru",12} },
		{"AddDialogOpt",	{"Ta mu鑞 nh薾 ph莕 thng u Ru",23} },
		{"AddDialogOpt",	{"в ta suy ngh� l筰",0} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "Gi韎 thi謚 quy t綾 u Ru",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thi誹 Hi謕, ngi m鏸 ng祔 c� th� tham gia 3 tr薾 u Ru, m鏸 tr薾 u Ru t鎛g c閚g c� 12 lt ru, Thi誹 Hi謕 n誹 ngi mu鑞 th緉g 1 tr薾 u ru th祅h c玭g, th� c莕 ph秈 u鑞g h誸 12 lu顃 ru c馻 tr薾 u Ru n祔, trong m鏸 lt u Ru, Thi誹 Hi謕 c� th� l鵤 ch鋘 u鑞g B竧 Ru Nh�, B竧 Ru Trung, hay l� B竧 Ru L韓, u鑞g lo筰 ru kh玭g gi鑞g nhau s� c閚g th猰  cho ngi ч Say X豱 v� T鰑 Lng kh玭g gi鑞g nhau, Thi誹 Hi謕 c莕 ph秈 m b秓 trong l骳 ч Say X豱 nh� h琻 100 c� g緉g t╪g cao T鰑 Lng c馻 m譶h. N誹 ngi kh玭g th薾 tr鋘gu鑞g cho Say X豱 n 100 ho芻 100 tr� l猲, th� ngi  u鑞g say r錳, th� tr薾 u ru n祔 xem nh� l� th蕋 b筰, n誹 ngi u鑞g h誸 12 lt ru m� ч Say X豱 c馻 ngi v蒼 nh� h琻 100, th� tr薾 u Ru n祔 ngi  th祅h c玭g, ta s� l蕐 t蕋 c� T鰑 Lng nh薾 頲 c馻 nh鱪g l莕 u Ru th祅h c玭g trong ng祔 c閚g l筰 v� ti課 h祅h x誴 h筺g, X誴 h筺g � top 10 th� s� 頲 nh薾 ph莕 thng phong ph�. Qu� tr譶h u Ru, B竧 Ru Nh� c閚g th猰 3-6 ч Say X豱, 3 lng T鰑 Lng, B竧 Ru Trung c閚g th猰 2-12 ч Say X豱, 7 lng T鰑 Lng, B竧 Ru L韓 c閚g th猰 3-18 ч Say X豱, 11 lng T鰑 Lng."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "Ta mu鑞 b総 u u ru",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:BeginDrink",	{nil} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "U鑞g m閠 b竧 ru nh�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"small",5} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "U鑞g 1 B竧 Ru Trung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"middle",5} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "U鑞g m閠 b竧 ru l韓",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"big",5} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "Ch辵 thua",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Lose",	{TSK_DrinkTimes,TSK_DrinkRound,TSK_ZuiYi,TSK_AnWei,TSK_JiuLiang} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "ServerStart",
	szName = "Khi m� sever ng t秈 c竔 b祅",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"B祅 Ti謈", 1658, tbDeskPos} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ServerStart",
	szName = "Khi m� sever ng t秈 Th萴 Vi猲 Ngo筰",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"Th萴 Vi猲 Ngo筰", 1659, tbYuanWaiPos} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "Ki觤 tra k誸 qu� u ru",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ki觤 tra k誸 qu� u ru",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ki觤 tra t鰑 lng nh薾 頲 h玬 nay  c馻 ta.",13} },
		{"AddDialogOpt",	{"Ki觤 tra x誴 h筺g top 10 c馻 T鰑 Lng ng祔 h玬 trc",15} },
		{"AddDialogOpt",	{"Ki觤 tra x誴 h筺g t鰑 lng ng祔 h玬 trc c馻 ta.",16} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "Ki觤 tra t鰑 lng nh薾 頲 h玬 nay  c馻 ta.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurJiuLiang",	{nil} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "Ki觤 tra x誴 h筺g top 10 c馻 T鰑 Lng hi謓 t筰",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurTopTen",	{nil} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "nil",
	szName = "Ki觤 tra x誴 h筺g top 10 c馻 T鰑 Lng ng祔 h玬 trc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYTopTen",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "nil",
	szName = "Ki觤 tra x誴 h筺g t鰑 lng ng祔 h玬 trc c馻 ta.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYPlayerPaiMing",	{nil} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "Click v祇 Th萴 Vi猲 Ngo筰",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th萴 Vi猲 Ngo筰"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>C竎 ch� v� v� l﹎ h祇 hi謕, L穙 Th萴 t玦  b祔 l� r錳, n╩ m韎 c騨g g莕 k�, Ta � y  b祔 s絥 s琻 h祇 h秈 v� chi猽 i c竎 ch� v�, xin c竎 v� c� t� nhi猲, ng kh竎h s竜, ╪ u鑞g no say tho秈 m竔 甶!"} },
		{"AddDialogOpt",	{"Gi韎 thi謚 ho箃 ng Чi Y課 Qu莕 Hi謕",18} },
		{"AddDialogOpt",	{"Nh薾 h錸g bao",19} },
		{"AddDialogOpt",	{"фi l蕐 Gi秈 T鰑 Ho祅",20} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "Gi韎 thi謚 ho箃 ng Чi Y課 Qu莕 Hi謕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Th阨 gian t� 0h/23/01/2011 n 24h/20/02/2011, Thi誹 Hi謕 ngi c� th� t筰 ch� Ta � y  b祔 s絥 s琻 h祇 h秈 v� chi猽 i, ╪ u鑞g no say tho秈 m竔 甶, Th阨 gian t� 09/02 n 11/02,  c莡 may cho con trai xa x� c馻 ta, Thi誹 Hi謕 ngi c� th� n ch� c馻 ta y nh薾 1 Чi H錸g Bao! Th萴 Vi猲 Ngo筰 ta y kh玭g ph秈 l� ngi keo ki謙 u, ta  b� v祇 H錸g Bao n 300.000.000 kinh nghi謒, Thi誹 Hi謕 ngi ng qu猲 n nh薾 H錸g Bao nh�.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "nil",
	szName = "Nh薾 h錸g bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_LiBao,1,"Thi誹 Hi謕 ngi  nh薾 H錸g Bao � ch� c馻 ta r錳, m鏸 ngi ch� 頲 nh薾 H錸g Bao 1 l莕 � ch� c馻 ta!","<"} },
		{"lib:CheckDay",	{nGetLiBaoStartDate, nGetLiBaoEndDate, "V祇 kho秐g ng祔 10 th竛g 2, con trai c馻 ta ph秈 l猲 阯g t譵 ki誱 phng tr阨 bu玭 b竛 m韎,  c莡 may cho n�, v祇 ng祔 09 n ng祔 11 th竛g 2, Thi誹 Hi謕 ngi c� th� n ch� c馻 ta y nh薾 m閠 Чi H錸g Bao! Th萴 Vi猲 Ngo筰 ta y kh玭g ph秈 l� ngi keo ki謙 u, ta  b� v祇 H錸g Bao n 300.000.000 kinh nghi謒, Thi誹 Hi謕 ngi ng qu猲 n nh薾 H錸g Bao nh�."} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H祅h trang kh玭g  ch� tr鑞g, 輙 nh蕋 ph秈 1 c竔 1*1 kh玭g gian h祅h trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2694,1,0,0},nBindState = -2,nExpiredTime=20110221,},1,"Чi Y課 Qu莕 Hi謕 n╩ 2011, H錸g Bao Th萴 Vi猲 Ngo筰"} },
		{"ThisActivity:AddTask",	{TSK_LiBao,1} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "фi l蕐 Gi秈 T鰑 Ho祅",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Gi秈 T鰑 Ho祅",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2695,1,0,0},nExpiredTime=20110221,},1,"Чi Y課 Qu莕 Hi謕 n╩ 2011, nh薾 頲 Gi秈 T鰑 Ho祅"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Gi秈 T鰑 Ho祅",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2695,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckGetDrunk",	{1020,"Kh玭g c� say th� kh玭g c莕 d飊g Gi秈 T鰑 Ho祅 u"} },
	},
	tbActition = 
	{
		{"ThisActivity:JieJiu",	{1020} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "S� d鬾g H錸g Bao c馻 Th萴 Vi猲 Ngo筰",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2694,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_UseLiBao,0,"","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{nLiBaoExp,1,"Чi Y課 Qu莕 Hi謕 n╩ 2011, s� d鬾g H錸g Bao Th萴 Vi猲 Ngo筰 nh薾 頲 kinh nghi謒"} },
		{"ThisActivity:SetTask",	{TSK_UseLiBao,1} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "Nh薾 ph莕 thng u Ru",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nh薾 ph莕 thng u Ru",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh薾 ph莕 thng x誴 h筺g u Ru",24} },
		{"AddDialogOpt",	{"Nh薾 ph莕 thng u ru th祅h c玭g",29} },
		{"AddDialogOpt",	{"Nh薾 ph莕 thng an 駃",30} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng x誴 h筺g u Ru",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetPaiMingAward",	{nil} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng u ru x誴 h筺g 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng u ru x誴 h筺g 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng u ru x誴 h筺g 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng u ru x誴 h筺g t� 4-10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng u ru th祅h c玭g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_WinDrink,1,"Thi誹 Hi謕 ngi kh玭g c� ph莕 thng u ru th祅h c玭g  nh薾","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nWinDrinkExp, "Thi誹 Hi謕 ngi tham gia u ru nh薾 頲 kinh nghi謒  t n gi韎 h筺, kh玭g th� ti誴 t鬰 nh薾 nh鱪g ph莕 thng c� li猲 quan n u ru", "<", nNumber,"Чi Y課 Qu莕 Hi謕 n╩ 2011, nh薾 ph莕 thng u ru th祅h c玭g."} },
		{"ThisActivity:SetTask",	{TSK_WinDrink,0} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "nil",
	szName = "Nh薾 ph莕 thng an 駃",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_AnWei,1,"Thi誹 Hi謕, ngi kh玭g c� ph莕 thng an 駃  nh薾","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nAnWeiExp, "Thi誹 Hi謕 ngi tham gia u ru nh薾 頲 kinh nghi謒  t n gi韎 h筺, kh玭g th� ti誴 t鬰 nh薾 nh鱪g ph莕 thng c� li猲 quan n u ru", "<", nNumber,"Чi Y課 Qu莕 Hi謕 n╩ 2011, nh薾 ph莕 thng an 駃"} },
		{"ThisActivity:SetTask",	{TSK_AnWei,0} },
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "ServerStart",
	szName = "Khi m� sever ng t秈 n L錸g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddMulNpc",	{tbNpcs,"n L錸g",1592} },
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "ServerStart",
	szName = "Khi m� sever ng t秈 B髉 B� u B�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"u 玭g a", 1660, "\\settings\\maps\\dayanqunxia\\datouwawa.txt",176} },
	},
}
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "ServerStart",
	szName = "Khi m� sever ng t秈 V� Nam S�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"Nam S� ", 1661, "\\settings\\maps\\dayanqunxia\\wunanshi.txt",176} },
	},
}
tbConfig[34] = --一个细节
{
	nId = 34,
	szMessageType = "ServerStart",
	szName = "Khi m� sever ng t秈 V� B綾 S�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"B綾 S� ", 1662, "\\settings\\maps\\dayanqunxia\\wubeishi.txt",176} },
	},
}
