--�������� ���踮 ҩ���ϰ�Ի�
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )
Include("\\script\\config\\cfg_features.lua")

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("Thu�c c�a b�n ti�m to�n l� th� th��ng h�ng, c� b�nh tr� b�nh, kh�ng b�nh c��ng th�n, c� mu�n mua m�t �t kh�ng? ",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(12) 		--�������׿�
end;

if TEACHERSWITCH then
	tinsert(OPTIONS, "Gi�p ta c�t d��c t�u/brew")
end
tinsert(OPTIONS, "Giao d�ch/yes")
if CFG_HONNGUYENLINHLO == 1 then
	tinsert(OPTIONS, "Ta mu�n ch� t�o H�n Nguy�n Linh L�/refine")
end
tinsert(OPTIONS, "Kh�ng giao d�ch/Cancel")
