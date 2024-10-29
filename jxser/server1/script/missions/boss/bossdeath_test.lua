IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")

KILLBOSSEXPAWARD = 10000000
KILLBOSSNEAREXPAWARD = 8000000
--Renew boss award - Modified by DinhHQ - 20120319
local tbVnNewItemDropAward = {
	{{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=60},},
	{{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=60},},
	{{szName="T� Th�y Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Lam Th�y Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	{{szName="L�c Th�y Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Tinh H�ng B�o Th�ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=50},},		
}

function OnDeath( nNpcIndex )
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbVnNewItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)));	
end;

