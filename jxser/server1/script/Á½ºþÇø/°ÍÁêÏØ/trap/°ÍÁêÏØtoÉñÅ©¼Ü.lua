--两湖区 巴陵县to神农架
--TrapID：两湖区 83
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)
if (GetLevel() >= 5) then						--等级达到十级
	SetFightState(1);
	NewWorld(74, 2040 ,3259)
else
	Talk(1,"","Ph輆 trc nguy hi觤! Xin h穣 quay v� r蘮 luy謓 th猰!")
	SetPos(1338, 3353)						--走出Trap点
end

AddTermini(46)
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
end;
