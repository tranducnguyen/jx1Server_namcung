--      t�m PK t�nh gi� kh� .lua 
--      Update: Dan_Deng(2003-11-27) 
--      Timer: 9 

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer() 
local Uworld96 = GetTask(96) 
local PK_value = GetPK(); 
local nMapId = GetWorldPos(); 
StopTimer(); 

if (nMapId == 208) then --      ch� c� � ph�ng giam trung m�i cho ph�p gi�m PK tr� gi� 
if (PK_value > 1) then --      ch�a gi�t xong PK tr� gi� 
Msg2Player("Th�ng qua t�nh t�m h�i c�i , t�i c�a ng��i nghi�t gi�m b�t . ") 
SetPK(PK_value - 1) 
			SetTask(96,100 + (PK_value - 1));
SetTimer(12 * CTime * FramePerSec, 9) --      l�n n�a b�t ��u t�nh gi� #12 c� canh gi� ==120 ph�t # 
else --      gi�t xong PK li�u 
Msg2Player(" � kh�c s�u t�nh l�i t� th�n t�i sau , ng��i r�t c�c r�a s�ch t�i l�i c�a m�nh . ") 
SetPK(0) 
SetTask(96,100) 
end 
end 
end; 
