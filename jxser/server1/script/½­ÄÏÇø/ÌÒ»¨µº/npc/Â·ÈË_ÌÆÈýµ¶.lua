-- 江南区 桃花岛 唐门 路人_唐三刀.lua
-- by: Dan_deng(2004-05-15)
-- 为唐门弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 2) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","唐三刀：当年我离开唐门来到这岛上，见此处清幽秀雅，是个修炼的好地方，便住了下来，谁知道一晃就是二十年。得知三弟还好，我也安心了，这些年我习武不辍,对本门的刀剑与暗器之法做了些改动，就此传授于你吧。")
--	elseif (Uworld137 == 22) then		-- 已经更新过技能
--		Talk(1,"","唐三刀：我已将毕生技艺传授与你，江湖之大，好好地去闯荡，干出一番轰轰烈烈的事业来！")
--	else										-- 非天王的
		Talk(1,"","Kh玭g bi誸 l� Л阯g Tam  � nh� c� 頲 m筺h kh醗 kh玭g. Huynh trng r蕋 l� lo l緉g! ")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(2)
	if (GetTask(123) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(249) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	add_tm(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,22)
	Talk(1,"UpdateSkill","Ta  truy襫 th� h誸 tuy謙 k� v� ngh� cho ngi r錳 Giang H� r閚g l韓,nh璶g kh玭g ph秈 kh玭g c� t d鬾g v�. Ngi h穣 mang nh鱪g tuy謙 h鋍 c馻 m譶h  ph竧 huy")
end
