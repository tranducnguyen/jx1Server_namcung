QY_GOLDBOSS_APOS_INFO = {
					--{"C� B�ch", 566, 95, 0, {"Ph� Dung ��ng","S�n B�o ��ng","city"}}, -- ����,����,�ȼ�,����,{���ܳ��ֵĵ�ͼ}
					--{"Huy�n Gi�c ��i S�", 740, 95, 0, {"Nh�n Th�ch ��ng","Thanh kh� ��ng","city"}},
					--{"���ng Phi Y�n", 1366, 95, 1, {"Phong L�ng ��","Kho� Lang ��ng","city"}},
					--{"Lam Y Y", 582, 95, 1, {"V� L�ng ��ng","Phi Thi�n ��ng","city"}},
					--{"H� Linh Phi�u", 568, 95, 2, {"Tr��ng B�ch s�n B�c","V� Danh ��ng","city"}},
					--{"Y�n Hi�u Tr�i", 744, 95, 2, {"Sa M�c s�n  ��ng 1","Sa M�c s�n  ��ng 3","city"}},
					{"M�nh Th��ng L��ng", 583, 95, 3, {"Sa m�c ��a bi�u","Sa M�c s�n  ��ng 2","city"}},
					{"Gia Lu�t T� Ly", 563, 95, 3, {"L��ng Th�y ��ng","D��ng Trung ��ng","city"}},
					{"��o Thanh Ch�n Nh�n", 562, 95, 4, {"Tr��ng B�ch s�n Nam","M�c Cao Qu�t","city"}},
					{"Tuy�n C� T�", 747, 95, 4, {"T�y S�n ��o","Phi Thi�n ��ng","city"}},
}

QY_GOLDBOSS_DPOS_INFO = {
					{"Thanh Tuy�t S� Th�i", 743, 95, 341, 2, "Giang h� truy�n r�ng Thanh Tuy�t S� Th�i �� t�ng danh ch�n giang h�, xu�t hi�n � M�c B�c Th�o Nguy�n, v� l�m trung nguy�n s� c� m�t cu�c huy�t chi�n!", "\\settings\\maps\\������\\Į���Uԭ\\qingxiaoshitaiboss.txt"},
					{"Y�n Hi�u Tr�i", 744, 95, 336, 2, "`Nghe n�i th�y y�n s� gi� Y�n Hi�u Tr�i �� xu�t hi�n � Phong L�ng ��, v� l�m trung nguy�n s� c� c� m�t cu�c huy�t chi�n!", "\\settings\\maps\\��ԭ����\\����ɱ���\\yanxiaoqianboss.txt"},
					{"H� Nh�n Ng�", 745, 95, 321, 3, "Giang h� t��ng truy�n r�ng, H� Nh�n Ng� �� xu�t hi�n � Tr��ng B�ch S�n, v� l�m trung nguy�n s� c� c� m�t cu�c huy�t chi�n!", "\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"},
					{"Huy�n Gi�c ��i S�", 740, 95, 322, 0, "Giang h� truy�n r�ng Huy�n Gi�c ��i S� �� t�ng danh ch�n giang h�, xu�t hi�n � Tr��ng B�ch S�n, v� l�m trung nguy�n s� c� c� m�t cu�c huy�t chi�n!", "\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"},
					{"Tuy�n C� T�", 747, 95, 340, 4, "Giang h� truy�n r�ng Tuy�n C� T� �n c� �� l�u, ��t nhi�n xu�t hi�n � M�c Cao Qu�t, v� l�m trung nguy�n s� c� c� m�t cu�c huy�t chi�n!", "\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"},
					{"T� ��i Nh�c", 1367, 95, 342,4, "T�ng truy�n r�ng T� ��i Nh�c xu�t hi�n � Vi S�n ��o, v� l�m trung nguy�n s� c� c� m�t cu�c huy�t chi�n!", "\\settings\\maps\\������\\��ɽӴ\\big_goldboss.txt"},
}
Include("\\RelaySetting\\Task\\makegoldboss\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "BOSS HOANG KIM XUAT HIEN VAO 22:00" );
	TaskInterval( 1440 );
	TaskTime( 22, 0 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg("=====> Boss Hoang Kim Xuat Hien Vao Luc :  22:00" );
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		qy_makeboss_fixure(1)
		return 0;
	end;
	BigBoss.gold_boss_count = 0;
TAB_CITY_EMPTY = {}
	qy_makeboss_onlyone_pos()
	--qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
