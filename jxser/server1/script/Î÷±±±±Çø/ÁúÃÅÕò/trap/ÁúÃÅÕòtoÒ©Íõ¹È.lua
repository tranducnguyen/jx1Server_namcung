--西北北区 龙门镇to药王谷
--TrapID：西北北区 5

function main(sel)
	if (GetLevel() >= 5) then						--等级达到十级
		SetFightState(1);
		NewWorld(140, 2429, 3731);
		AddTermini(183);
	else
		Talk(1,"","Ph輆 trc nguy hi觤! Xin h穣 quay v� r蘮 luy謓 th猰!")
	end
end;