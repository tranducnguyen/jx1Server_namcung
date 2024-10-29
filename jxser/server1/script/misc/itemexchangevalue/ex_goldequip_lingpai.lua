-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - �һ�Тװ�����ƣ������ȣ�
-- �ļ�������ex_goldequip_lingpai.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2010-06-22 11:02:54

-- ======================================================


IncludeLib("ITEM")
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_head.lua")	-- �һ�Тװ�����ƣ������ȣ�
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua");

function exchange_lingpai2goldequip()
	local aryDescribe =
	{
		"<dec><npc>Ng��i mu�n ��i trang b� n�o?",
		format("Trang b� Thanh C�u /#take_xp_equip_1(1, %d)", 905),
		format("Trang b� V�n L�c/#take_xp_equip_1(2, %d)", 1135),
		format("Trang b� Th��ng Lang/#take_xp_equip_1(3, %d)", 1365),
		format("Trang b� Huy�n Vi�n/#take_xp_equip_1(4, %d)", 1595),
		format("Trang b� T� M�ng/#take_xp_equip_1(5, %d)", 1825),
		format("Trang b� Kim � /#take_xp_equip_1(6, %d)", 2055),
		format("Trang b� B�ch H�/#take_xp_equip_1(7, %d)", 2285),
		format("Trang bi X�ch L�n/#take_xp_equip_1(8, %d)", 2515),
		--format("Trang b� Ng� ��/#take_xp_equip_91(9, %d)", 1),
		--format("Trang b� M� H�/#take_xp_equip_101(10, %d)", 194),
		format("Trang b� Vi�m ��/#take_xp_equip_111(11, %d)", 422),
		"Kh�ng ��i n�a./no",
	};
	
	CreateTaskSay(aryDescribe);
end

----------------------------Т������� �� �׻�---------------------------------
function take_xp_equip_91(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "H�nh nh� ��i hi�p qu�n mang l�nh b�i th� ph�i.")
		return
	end
	
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i l�y h� ph�i trang b� n�o:", 
						format("Thi�u L�m quy�n/#take_xp_equip_92(%d,%d, 1)", n_g, n_d),
						format("Thi�u L�m c�n/#take_xp_equip_92(%d,%d, 2)", n_g, n_d),
						format("Thi�u L�m �ao/#take_xp_equip_92(%d,%d, 3)", n_g, n_d),
						format("Thi�n V��ng ch�y/#take_xp_equip_92(%d,%d, 4)", n_g, n_d),
						format("Thi�n V��ng th��ng/#take_xp_equip_92(%d,%d, 5)", n_g, n_d),
						format("Thi�n V��ng �ao/#take_xp_equip_92(%d,%d, 6)", n_g, n_d),
						format("Nga Mi ki�m/#take_xp_equip_92(%d,%d, 7)", n_g, n_d),
						format("Nga Mi ch��ng/#take_xp_equip_92(%d,%d, 8)", n_g, n_d),
						format("Nga Mi ph� tr� /#take_xp_equip_92(%d,%d, 9)", n_g, n_d),
						format("Th�y Y�n �ao/#take_xp_equip_92(%d,%d, 10)", n_g, n_d),
						format("Th�y Y�n ki�m/#take_xp_equip_92(%d,%d, 11)", n_g, n_d),
						format("Ng� ��c ch��ng/#take_xp_equip_92(%d,%d, 12)", n_g, n_d),
						format("Trang sau.../#take_xp_equip_911(%d,%d)", n_g, n_d),
						"Tho�t/no"});
end

function take_xp_equip_911(n_g, n_d)
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i l�y h� ph�i trang b� n�o:", 
						format("Ng� ��c �ao/#take_xp_equip_92(%d,%d, 13)", n_g, n_d),
						format("Ng� ��c b�a/#take_xp_equip_92(%d,%d, 14)", n_g, n_d),
						format("���ng M�n phi �ao/#take_xp_equip_92(%d,%d, 15)", n_g, n_d),
						format("���ng M�n n� /#take_xp_equip_92(%d,%d, 16)", n_g, n_d),
						format("���ng M�n phi ti�u/#take_xp_equip_92(%d,%d, 17)", n_g, n_d),
						format("���ng M�n b�y/#take_xp_equip_92(%d,%d, 18)", n_g, n_d),
						format("C�i Bang ch��ng/#take_xp_equip_92(%d,%d, 19)", n_g, n_d),
						format("C�i Bang b�ng/#take_xp_equip_92(%d,%d, 20)", n_g, n_d),
						format("Chi�n Nh�n/#take_xp_equip_92(%d,%d, 21)", n_g, n_d),
						format("Thi�n Nh�n b�a/#take_xp_equip_92(%d,%d, 22)", n_g, n_d),
						format("Ma Nh�n/#take_xp_equip_92(%d,%d, 23)", n_g, n_d),
						format("Trang sau.../#take_xp_equip_912(%d,%d)", n_g, n_d),
						"Tho�t/no"});
end

function take_xp_equip_912(n_g, n_d)
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i l�y h� ph�i trang b� n�o:", 
						format("V� �ang ch��ng/#take_xp_equip_92(%d,%d, 24)", n_g, n_d),
						format("V� �ang ki�m/#take_xp_equip_92(%d,%d, 25)", n_g, n_d),
						format("C�n L�n �ao/#take_xp_equip_92(%d,%d, 26)", n_g, n_d),
						format("C�n L�n ki�m/#take_xp_equip_92(%d,%d, 27)", n_g, n_d),
						format("C�n L�n b�a/#take_xp_equip_92(%d,%d, 28)", n_g, n_d),
						format("Tr� v�.../#take_xp_equip_91(%d,%d)", n_g, n_d),
						"Tho�t/no"});
end

function take_xp_equip_92(n_g, n_d, n_p)
	local n_count = 5;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>��i hi�p mu�n ��i trang b� m�n ph�i n�o:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "Ch� m�t ch�t./no");
	CreateTaskSay(aryDescribe);
end

-----------��

function take_xp_equip_101(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "H�nh nh� ��i hi�p qu�n mang l�nh th� ph�i.")
		return
	end
	
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i l�y h� ph�i trang b� n�o:", 
						format("Trang b� ��i M� H� /#take_xp_equip_102(%d,%d, 1)", n_g, n_d),
						"Tho�t/no"});
end

function take_xp_equip_102(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc> ��i hi�p mu�n thay cho m�t c�i �� h� ph�i ��ch trang b� :",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "Ch� m�t ch�t tr� l�i /no");
	CreateTaskSay(aryDescribe);
end

---------�׵�װ��
function take_xp_equip_111(n_g, n_d)
	
if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then 
Talk(1, "","H�nh nh� ��i hi�p qu�n mang l�nh b�i th� ph�i. ?") 
return 
end 
	
	CreateTaskSay({"<dec><npc>��i hi�p mu�n trang b� g�:", 
						format("Trang b� To�i Nh�n/#take_xp_equip_112(%d,%d, 1)", n_g, n_d),
						format("Trang b� Ph�c Hi/#take_xp_equip_112(%d,%d, 2)", n_g, n_d),
						format("Trang B� N� Oa/#take_xp_equip_112(%d,%d, 3)", n_g, n_d),
						format("Trang b� Ch�c Dung/#take_xp_equip_112(%d,%d, 4)", n_g, n_d),
						format("Trang b� Th�n N�ng/#take_xp_equip_112(%d,%d, 5)", n_g, n_d),
						"K�t th�c ��i tho�i /no"});
end

function take_xp_equip_112(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>��i hi�p mu�n thay h� ph�i trang b�:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "K�t th�c ��i tho�i /no");
	CreateTaskSay(aryDescribe);
end
--------------------------------------------------------------------------------

function take_xp_equip_1(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "H�nh nh� ��i hi�p qu�n mang l�nh b�i th� ph�i.")
		return
	end
	
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i l�y h� ph�i trang b� n�o:", 
						format("Thi�u L�m quy�n/#take_xp_equip_2(%d,%d, 1)", n_g, n_d),
						format("Thi�u L�m c�n/#take_xp_equip_2(%d,%d, 2)", n_g, n_d),
						format("Thi�u L�m �ao/#take_xp_equip_2(%d,%d, 3)", n_g, n_d),
						format("Thi�n V��ng ch�y/#take_xp_equip_2(%d,%d, 4)", n_g, n_d),
						format("Thi�n V��ng th��ng/#take_xp_equip_2(%d,%d, 5)", n_g, n_d),
						format("Thi�n V��ng �ao/#take_xp_equip_2(%d,%d, 6)", n_g, n_d),
						format("Nga Mi ki�m/#take_xp_equip_2(%d,%d, 7)", n_g, n_d),
						format("Nga Mi ch��ng/#take_xp_equip_2(%d,%d, 8)", n_g, n_d),
						format("Th�y Y�n �ao /#take_xp_equip_2(%d,%d, 9)", n_g, n_d),
						format("Th�y Y�n song �ao/#take_xp_equip_2(%d,%d, 10)", n_g, n_d),
						format("Ng� ��c ch��ng/#take_xp_equip_2(%d,%d, 11)", n_g, n_d),
						format("Ng� ��c �ao/#take_xp_equip_2(%d,%d, 12)", n_g, n_d),
						format("Trang sau.../#take_xp_equip_11(%d,%d)", n_g, n_d),
						"Tho�t/no"});
end

function take_xp_equip_11(n_g, n_d)
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i l�y h� ph�i trang b� n�o:", 
						format("���ng M�n phi �ao/#take_xp_equip_2(%d,%d, 13)", n_g, n_d),
						format("���ng M�n t� ti�n/#take_xp_equip_2(%d,%d, 14)", n_g, n_d),
						format("���ng M�n phi ti�u/#take_xp_equip_2(%d,%d, 15)", n_g, n_d),
						format("C�i Bang ch��ng/#take_xp_equip_2(%d,%d, 16)", n_g, n_d),
						format("C�i Bang b�ng/#take_xp_equip_2(%d,%d, 17)", n_g, n_d),
						format("Chi�n Nh�n/#take_xp_equip_2(%d,%d, 18)", n_g, n_d),
						format("Ma Nh�n/#take_xp_equip_2(%d,%d, 19)", n_g, n_d),
						format("V� �ang kh�/#take_xp_equip_2(%d,%d, 20)", n_g, n_d),
						format("V� �ang ki�m/#take_xp_equip_2(%d,%d, 21)", n_g, n_d),
						format("C�n L�n �ao/#take_xp_equip_2(%d,%d, 22)", n_g, n_d),
						format("C�n L�n ki�m/#take_xp_equip_2(%d,%d, 23)", n_g, n_d),
						format("Tr� v�.../#take_xp_equip_1(%d,%d)", n_g, n_d),
						"Tho�t/no"});
end


function take_xp_equip_2(n_g, n_d, n_p)
	local n_count = 10;
	
--	if (n_g == 5) then		
--		n_count = 5;
--	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>��i hi�p mu�n ��i l�y h� ph�i trang b� n�o:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "Kh�ng ��i n�a./no");
	CreateTaskSay(aryDescribe);
end

function take_xp_equip_3(n_g, n_d, n_p, n_x)
	if (CountFreeRoomByWH(2,4,1) < 1) then
		Talk(1, "", "Kh�ng �� ch� tr�ng, xin s�a sang l�i h�nh trang");
		return
	end
	
	local nLingpaiIdx = GetNextItemIndexInRoom(0, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1, 3);
	local n_bindstate = GetItemBindState(nLingpaiIdx);
	local n_expiredtime = ITEM_GetExpiredTime(nLingpaiIdx);
	
	if (ConsumeItem(3,1, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) ~= 1) then
		Talk(1, "", "H�nh nh� ��i hi�p qu�n mang l�nh b�i th� ph�i.")
		return
	end
	
	local nItemIdx = AddGoldItem(0, tbGoldEquip_Lingpai[n_g][n_x][2]);
	
--	Խ�ϰ汾û�д�����
--	if (n_expiredtime ~= 0 ) then
--		ITEM_SetExpiredTime(nItemIdx,86400)
--		SyncItem(nItemIdx)
--	end
	
	if (n_bindstate ~= 0) then
		
		if (n_bindstate == -2) then
			n_new_bindtime = take_xp_equip_calc_binditem(tbLingpai_BindTime[n_g].nBindState);
		else
			n_new_bindtime = n_bindstate;
		end
		
		SetItemBindState(nItemIdx, n_new_bindtime);
	end
	
	Msg2Player("��t ���c "..GetItemName(nItemIdx));
	
	local szLog = format("%s\t%s\t%u",tbLingpai[n_g].szName, GetItemName(nItemIdx), ITEM_GetItemRandSeed(nItemIdx))
	
	_WritePlayerLog("Token Exchange Equip", szLog)
end

TIME_2000_1_1 = 946656000;		-- 2000��1Ԣ1�� ϵ���� 1970��1Ԣ1�յ�����

function take_xp_equip_calc_binditem(nLingpaiBindTime)
	if (nLingpaiBindTime == -2) then
		return -2;
	end
	local n_new_bindtime = nLingpaiBindTime - 7*24 + floor((GetCurServerTime() - TIME_2000_1_1) / 3600);
	return n_new_bindtime;
end

