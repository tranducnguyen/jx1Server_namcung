-- script viet hoa By http://tranhba.com  ====================== v�n ki�n tin t�c ====================== 

-- script viet hoa By http://tranhba.com  ki�m hi�p t�nh duy�n in t� n�t b�n m�t 150 c�p ��i th�a b� t�ch 
-- script viet hoa By http://tranhba.com  b�n ph�i ki�n �i�m k�ch s� d�ng , nh�ng t�ng l�n 150 c�p �� thu�n th�c k� n�ng ��n 20 c�p . 

-- script viet hoa By http://tranhba.com  Edited by t� kh�ng ph�i l� ng� 
-- script viet hoa By http://tranhba.com  2010/06/29 15:21 

-- script viet hoa By http://tranhba.com  ====================================================== 


Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx) 
local n_fac = GetLastFactionNumber(); 
if (n_fac < 0) then 
Talk(1, "","Gi�ng nh� quy�n s�ch n�y mi�u t� ch�nh l� c�c m�n ph�i cao c�p v� c�ng , ng��i kh�ng bi�t b�n h� huy�n c� "); 
return 1; 
end 

local tb_90skill = { 
[0] = {1055, 1056, 1057}, 
[1] = {1058, 1059, 1060}, 
[2] = {1069, 1070, 1071}, 
[3] = {1066, 1067}, 
[4] = {1061, 1062, 1114}, 
[5] = {1063, 1065}, 
[6] = {1073, 1074}, 
[7] = {1075, 1076}, 
[8] = {1078, 1079}, 
[9] = {1080, 1081}, 
}; 

local tb_Desc = {}; 
for i = 1, getn(tb_90skill[n_fac]) do 
local skill = HaveMagic(tb_90skill[n_fac][i]); 
if (skill ~= -1 and skill ~= 20) then 
tinsert(tb_Desc, format("Th�ng c�p ".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i])); 
end 
end 

if (getn(tb_Desc) == 0) then 
Talk(1, "","K� n�ng ��t t�i cao c�p nh�t ho�c l� c�n ch�a h�c ."); 
return 1; 
end 

tinsert(tb_Desc, 1, " l�a ch�n c�n th�ng c�p ��ch k� n�ng :"); 
tinsert(tb_Desc,"K�t th�c ��i tho�i /OnCancel"); 
CreateTaskSay(tb_Desc); 
return 1; 
end 

function upgrade_skilllevel(n_skillid) 
if (HaveMagic(n_skillid) == -1 or HaveMagic(n_skillid) >= 20) then 
return 
end 

if (ConsumeItem(3, 1, 6, 1, 3562, -1) == 1) then 
AddMagic(n_skillid, 20); 
WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d", 
" ��i th�nh b� t�ch 150", 
GetLocalDate("%Y-%m-%d %X"), 
GetAccount(), 
GetName(), 
n_skillid )); 
end 
end 


function OnCancel() 
end 
