-- Ǯׯ����.lua		������ı�׼�ļ�
-- By Dan_Deng(2003-12-31)
-- Update: Dan_Deng(2004-01-06) ����Ʊ�����Ƴ����ٰ�Ǯׯ����
Include("\\script\\global\\head_qianzhuang.lua") -- Ǯׯͷ�ļ�
IncludeForRegionVer("\\script\\global\\", "gamebank_proc.lua")

function main_proc()
	dofile("script/global/Ǯׯ����.lua");
	if (GetSex() == 0) then
		Say("�ng ch� ti�n trang:  V� thi�u hi�p kia c�n l�o phu gi�p g� ? ",3,"��y c� b�n bao l� x� kh�ng ? /buy_sele","Ta mu�n ��i nguy�n b�o th�nh ti�n ��ng./change_ingot_to_coin","Ta ch� gh� qua th�i./no")
	else
		Say("�ng ch� ti�n trang:  V� c� n��ng kia c�n l�o phu gi�p g� ? ",3,"��y c� b�n bao l� x� kh�ng ? /buy_sele","Ta mu�n ��i nguy�n b�o th�nh ti�n ��ng./change_ingot_to_coin","Ta ch� gh� qua th�i./no")
	end
end
------------ ���� ---------------------
function buy_sele()
	Say("���c ���c, ch� n�y ��ng l� c� b�n bao l� x�, ti�u h�ng bao 10v, ��i h�ng bao 100v.\n��c bi�t c� <color=green>H�ng bao nh� � v� H�ng bao m�ng th�<color> c� th� c� nhi�u <color=green>Ti�n V�n<color> v� <color=yellow>Ti�n ��ng<color>. \nNg�i mu�n mua lo�i n�o ? ",5,"Ti�u h�ng bao/buy1","��i h�ng bao /buy2","H�ng bao nh� � /buy3","H�ng bao m�ng th� /hesui_hongbao","Kh�ng mua n�a./no")
	--Say("���c ���c, ch� n�y ��ng l� c� b�n bao l� x�, ti�u h�ng bao 1v, ��i h�ng bao 10v, ng��i mu�n mua lo�i n�o ? ",3,"Mua ti�u h�ng bao/buy1","Mua ��i h�ng bao/buy2","Kh�ng mua n�a./no")
end

function buy1()
	if (GetCash() >= 100000) then
		Pay(100000)
		AddItem(6,1,14,1,0,0,0)
		Talk(1,"","�ng ch� ti�n trang: ��y l� Ti�u h�ng bao c�a ng��i, xin h�y c�m l�y!")
	else
		Talk(1,"","�ng ch� ti�n trang: H�y d�! Ng�i kh�ng c� �� ti�n r�i!")
	end
end

function buy2()
	if (GetCash() >= 1000000) then
		Pay(1000000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","�ng ch� ti�n trang: ��y l� ��i h�ng bao c�a ng��i, xin h�y c�m l�y!")
	else
		Talk(1,"","�ng ch� ti�n trang: H�y d�! Ng�i kh�ng c� �� ti�n r�i!")
	end
end

function buy3()
	if (GetCash() >= 10000000) then
		Pay(10000000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","�ng ch� ti�n trang: ��y l� ��i h�ng bao c�a ng��i, xin h�y c�m l�y!")
	else
		Talk(1,"","�ng ch� ti�n trang: H�y d�! Ng�i kh�ng c� �� ti�n r�i!")
	end
end

function no()
end

function hesui_hongbao()	--�Զ���ͭǮ
	AskClientForNumber("Package_Hesui", 1, 100, "Xin m�i ��a v�o ti�n ��ng ");
end
function Package_Hesui(nMoney)
	if (CalcEquiproomItemCount(4, 417, 1, 1) < nMoney) then
		Talk(1,"","�ng ch� ti�n trang: Ng�i kh�ng mang �� "..nMoney.." ti�n ��ng.")
	else
		ConsumeEquiproomItem(nMoney, 4, 417, 1, -1)
		local nItem = AddItem(6,1,1052,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		SyncItem(nItem)
		Talk(1,"","�ng ch� ti�n trang: ��y l� h�ng bao c�a ng��i, xin h�y c�m l�y!")
	end
end


function ruyi_hongbao()		--�Զ����Ǯ
	AskClientForNumber("Package_Ruyi", 1, 10000000, "Xin m�i ��a v�o bao ti�n l� x� ");
end
function Package_Ruyi(nMoney)
	if (GetCash() < nMoney) then
		Talk(1,"","�ng ch� ti�n trang: ng�i kh�ng mang �� "..nMoney.." ")
	else
		Pay(nMoney)
		local nItem = AddItem(6,1,1051,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		local nM1 = floor(nMoney / 1000000)
		local nM2 = floor(mod(nMoney, 1000000))
		local nM3 = mod(nMoney, 1000)
		SetSpecItemParam(nItem, 2, nM1)
		SetSpecItemParam(nItem, 3, nM2)
		SetSpecItemParam(nItem, 4, nM3)
		SyncItem(nItem)
		Talk(1,"","�ng ch� ti�n trang: ��y l� h�ng bao c�a ng��i, xin h�y c�m l�y!")
	end
end
