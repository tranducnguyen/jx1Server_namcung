--�������� ���踮 �ӻ����ϰ�Ի�
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("B�n ti�m tuy nh� nh�ng th� g� c�ng c�. Kh�ch quan mu�n mua g�?", getn(Buttons), Buttons);
end;


function yes()
Sale(20); 		--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;

