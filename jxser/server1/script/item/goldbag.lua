Include("\\script\\global\\login_head.lua")

function main(nItemIdx)
local nDate = tonumber(GetLocalDate("%d"))
if ( GetTask(DAY) ~= nDate ) then
	SetTask(DAY, nDate);
	SetTask(352,0);
	if (GetTask(352) <= 20) then
		local k = random(1,100)
		SetTask(352,GetTask(352) + 1)
		if (k >= 90) then
			local x = random(1,100)
				if (x >= 70) then
 					AddItem(6,1,125,1,1,1)
					AddGlobalNews("��i hi�p <color=green>"..GetName().."<color> m� t�i Ho�ng Kim , may m�n nh�n ���c <color=green>Qu� Hoa T�u<color> !")
					Msg2Player("M� c�m nang Ho�ng Kim, nh�n ���c  Qu� Hoa T�u ")
				elseif (x >=80)  then
 					AddItem(6,1,71,1,1,1)
					AddGlobalNews("��i hi�p <color=green>"..GetName().."<color> m� t�i Ho�ng Kim , may m�n nh�n ���c <color=green>Ti�n Th�o L�<color> !")
					Msg2Player("M� c�m nang Ho�ng Kim, nh�n ���c  Ti�n Th�o L� ")
				else
					local p = random(122,124)
					AddItem(6,1,p,1,1,1)
					AddGlobalNews("��i hi�p <color=green>"..GetName().."<color> m� t�i Ho�ng Kim , may m�n nh�n ���c <color=pink>Ph�c Duy�n L�<color> !")
					Msg2Player("M� c�m nang Ho�ng Kim, nh�n ���c  Ph�c Duy�n L�")
				end
		elseif (k >=50) then
			local m = random (5,45)
			n = GetLevel()
			AddOwnExp(n*m*30)
		else
			local m = random (5,45)
			n = GetLevel()
			Earn(n*m*5)
		end
	else
		Talk(1,"","<color=green>H�m nay �� m� �� 20 C�m nang Ho�ng Kim r�i, ng�y mai h�y m� ti�p<color>")
	end
	
else	--Sau khi da set ngay

if (GetTask(352) <= 20) then
	local k = random(1,100)
	SetTask(352,GetTask(352) + 1)
	if (k >= 90) then
		local x = random(1,100)
		if (x >= 70) then
 			AddItem(6,1,125,1,1,1)
			AddGlobalNews("��i hi�p <color=green>"..GetName().."<color> m� t�i Ho�ng Kim , may m�n nh�n ���c <color=green>Qu� Hoa T�u<color> !")
			Msg2Player("M� c�m nang Ho�ng Kim, nh�n ���c  Qu� Hoa T�u ")
		elseif (x >=80)  then
 			AddItem(6,1,71,1,1,1)
			AddGlobalNews("��i hi�p <color=green>"..GetName().."<color> m� t�i Ho�ng Kim , may m�n nh�n ���c <color=green>Ti�n Th�o L�<color> !")
			Msg2Player("M� c�m nang Ho�ng Kim, nh�n ���c  Ti�n Th�o L� ")
		else
			local p = random(122,124)
			AddItem(6,1,p,1,1,1)
			AddGlobalNews("��i hi�p <color=green>"..GetName().."<color> m� t�i Ho�ng Kim , may m�n nh�n ���c <color=pink>Ph�c Duy�n L�<color> !")
			Msg2Player("M� c�m nang Ho�ng Kim, nh�n ���c  Ph�c Duy�n L�")
		end
	elseif (k >=50) then
		local m = random (5,45)
		n = GetLevel()
		AddOwnExp(n*m*30)
	else
		local m = random (5,45)
		n = GetLevel()
		Earn(n*m*5)
	end
else
	Talk(1,"","<color=green>H�m nay �� m� �� 20 C�m nang Ho�ng Kim r�i, ng�y mai h�y m� ti�p<color>")
end

end
end 