Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\activitysys\\config\\17\\head.lua")

function pActivity:Jiluxiaohao_yesou()
	AddStatData("baoxiangxiaohao_kaiyesouxiangzi", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_chengzhan()
	AddStatData("baoxiangxiaohao_kaichengzhanlibao", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_zhizun()
	AddStatData("baoxiangxiaohao_kaizhizunmibao", 1)	--数据埋点第一期
end

function pActivity:Jiluxiaohao_shuizexiangzi()
	AddStatData("baoxiangxiaohao_kaishuizeixiangzi", 1)	--数据埋点第一期
end

--襲 ch豱h ph莕 thng r琲 ra t� boss thu� t芻 i u l躰h - Modified By DinhHQ - 20120523
function pActivity:VnFFBigBossDrop(nNpcIndex)
	tbVnFFBigBossDrop = {
		[1]={{szName="у Ph� Kim � Kh玦",tbProp={6,1,2982,1,0,0},nCount=1,nRate=1},},
		[2]={{szName="у Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=1},},
		[3]={{szName="у Ph� Kim � H礽",tbProp={6,1,2984,1,0,0},nCount=1,nRate=1},},
		[4]={{szName="у Ph� Kim � Y猽 Цi",tbProp={6,1,2985,1,0,0},nCount=1,nRate=1},},
		[5]={{szName="у Ph� Kim � H� Uy觧",tbProp={6,1,2986,1,0,0},nCount=1,nRate=1},},
		[6]={{szName="у Ph� Kim � H筺g Li猲",tbProp={6,1,2987,1,0,0},nCount=1,nRate=1},},
		[7]={{szName="у Ph� Kim � B閕",tbProp={6,1,2988,1,0,0},nCount=1,nRate=1},},
		[8]={{szName="у Ph� Kim � Thng Gi韎",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},},
		[9]={{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},},
		[10]={{szName="у Ph� Kim � Kh� Gi韎",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.5},},
		[11]={{szName="Kim � L謓h",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},},
		[12]={{szName="B秓 Rng Kim � Kh玦",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.5},},
		[13]={{szName="B秓 Rng Kim � Thng Gi韎",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.3},},
		[14]={{szName="B秓 Rng Kim � H礽",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.5},},
		[15]={{szName="B秓 Rng Kim � Y猽 Цi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.5},},
		[16]={{szName="B秓 Rng Kim � H� Uy觧",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.5},},
		[17]={{szName="у Ph� B筩h H� Kh玦",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.15},},
		[18]={{szName="у Ph� B筩h H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.15},},
		[19]={{szName="у Ph� B筩h H� H礽",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.15},},
		[20]={{szName="у Ph� B筩h H� Y猽 Цi",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.15},},
		[21]={{szName="у Ph� B筩h H� H� Uy觧",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.15},},
		[22]={{szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.15},},
		[23]={{szName="у Ph� B筩h H� B閕",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.15},},
		[24]={{szName="у Ph� B筩h H� Thng Gi韎",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.08},},
		[25]={{szName="B筩h H� у Ph� H� Gi韎",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.08},},
		[26]={{szName="у Ph� B筩h H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.05},},
		[27]={{szName="B筩h H� L謓h",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},},
		[28]={{szName="Long Huy誸 Ho祅",tbProp={6,1,2117,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},},
		[29]={{szName="S竧 Th� Gi秐 l� h閜",tbProp={6,1,2339,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		[30]={{szName="Чi l鵦 ho祅 l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=8,nExpiredTime=20160},},
		[31]={{szName="Thi猲 Long L謓h",tbProp={6,1,2256,1,0,0},nCount=1,nRate=7.5},},
	}	
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVnFFBigBossDrop, "Ph莕 thng ti猽 di謙 Th駓 T芻 Чi u L躰h", 1)
end

function pActivity:VnUsePirateBox(nItemIdx)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\17\\vnshuizeibaoxiang.lua", "VnPirateBox_main", nItemIdx)
	return nil
end