-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 战心尊者对话NPC
-- 文件名　：npc_zhanxin_zunzhe.lua
-- 创建者　：子非魚
-- 创建时间：2009-06-01 14:27:01

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\fucmain.lua");
Include("\\script\\tagnewplayer\\head.lua");
Include("\\script\\tagnewplayer\\dispose_item.lua");
Include("\\script\\thuhoiitem\\huyenvien\\funcmain_huyenvien.lua")
 -- бn b� PQCH -Created By - AnhHH - 20110919
Include("\\script\\vng_event\\den_bu_pqch\\den_bu_pqch.lua")
--бn b� event tr錸g c﹜ th竛g 6 2011 - Modified by DinhHQ - 20110713
Include("\\script\\vng_event\\den_bu_event_thang6\\main.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--Phong v﹏ l謓h b礽 - Modified by DinhHQ - 20110913
Include("\\script\\activitysys\\config\\1005\\activeingame.lua")
--бn b� tr鑞g kh秈 ho祅
Include("\\script\\vng_event\\denbutrongkhaihoan\\main.lua")
Include("\\script\\vng_event\\201203_huyenvulenh\\main.lua")
-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 202004212400
Include("\\script\\vng_event\\2012_vlnb\\main.lua")

function main() 
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))          
	local nMonth =tonumber(GetLocalDate("%d"))
	local IsDailyTSK = GetTask(Task_Daily_Quest)
	if (IsDailyTSK ~= nCurDate) then
		SetTask(Task_Daily_Quest, nCurDate)
		SetTask(Task_IsQuest, 0)
		SetTask(Task_IsFinishQuest, 0)
		SetTask(Task_lag_TskID, 0)
	end                                                                                     
	local tbOpt = {};                                                                                              
	local szTitle = format("- Ch祇 m鮪g b筺 n v韎 <color=yellow>V� L﹎ Truy襫 K�<color=yellow><enter>- <color=Red>C璾 Ni猲 Tng Ph飊g <color><enter>- Vi謙 ho� t鎛g h頿 By <color=Green>V� L﹎ Truy襫 K�<color>");   
	tinsert(tbOpt, 1, szTitle)  
	tbVngToolAward:AddDialog(tbOpt, "Chi課 T﹎ T玭 Gi�") 
	
	tbVnHuyenVu:AddDialog(tbOpt)
	--Phong v﹏ l謓h b礽 - Modified by DinhHQ - 20110913
	tbPVLBActive:AddDialog(tbOpt)
	--бn b� tr鑞g kh秈 ho祅
	tbVngDenBuTKH:AddDialog(tbOpt)
	-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 202004212400
	tbVngVLNB2012:AddDialog(tbOpt)
	if (nMonth == 1) then
		tinsert(tbOpt,  "Ta mu鑞 h駓 v藅 ph萴/DisposeItem")  
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "Ta mu鑞 tham gia/NWP_main",             
--	                	 "Ta mu鑞 h駓 v藅 ph萴/DisposeItem",
----	                	  "Ta tr� l筰 trang b� Huy襫 Vi猲/ThuHoiHuyenVien_main",                        
--	                     	 "K誸 th骳/OnCancel",                                                                                   
--	                }                
--                else
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "Ta mu鑞 tham gia/NWP_main",    
----	                	 "Ta tr� l筰 trang b� Huy襫 Vi猲/ThuHoiHuyenVien_main",                                            
--	                     	 "K誸 th骳/OnCancel",                                                                                   
--	                }                        
	end                                                                                              
        -- бn b� PQCH -Created By - AnhHH - 20110919
	--  if (DenBuPQCH2011:IsActive() == 1 and DenBuPQCH2011:CheckAccount() == 1) then
			tinsert(tbOpt, "Nh薾 ph莕 thng Ph� Qu� C萴 H筽/#DenBuPQCH2011:GetAward()")
	--  end
        
--        if tbVngEventThang6Reward:isActive() == 1 then
--        	tinsert(tbOpt, "Nh薾 ph莕 thng n b� event tr錸g c﹜/#tbVngEventThang6Reward:main()")
--        end       
	tinsert(tbOpt,  "K誸 th骳/OnCancel")
	CreateTaskSay(tbOpt);                                                                                                  
                                                                                                                               
        --if (tbBirthday0905:IsActDate() ~= 1) then                                                                            
                --Talk(1, "", "Ho箃 ng  k誸 th骳.");                                                                       
                --return^                                                                                                       
        --end                                                                                                                  
                                                                                                                              
        --CreateTaskSay({"<dec><npc>".."Зy l� lo筰 ti襪 n╪g tr阨 ban nh璶g r蕋 輙 ngi bi誸 b閏 ph竧 lo筰 ti襪 l鵦 n祔. Ta bi
                                        --"Ta mu鑞 nh薾 Nh﹏ gi� v� ch quy誸/tbBirthday0905_renzhewudi",                     
                                        --"T� ta c� th� kh琲 d藋 s鴆 m筺h ti襪 t祅g c馻 b秐 th﹏./OnCancel"});                 
end    

function OnCancel()
end


function tbBirthday0905_renzhewudi()
	do return end
	if (GetLevel() <= 79 and tbBirthday0905:IsActDate() == 1) then
		AddSkillState(512,20,1,60*60*18)--40跑速
		AddSkillState(527,5,1,60*60*18)--500血
		AddSkillState(313,5,1,60*60*18)--20全抗
		AddSkillState(314,12,1,60*60*18)--7回复血，5回复内
		AddSkillState(546,1,1,60*60*18)--御赐光环
		CreateTaskSay({"<dec><npc>".."Ta  kh琲 d藋 m閠 ch髏 s鴆 m筺h ti襪 t祅g trong b秐 th﹏ ngi r錳, gi� ngi c� th� 甶 h祅h hi謕. Khi n祇 c莕 ta gi髉  th� c� n g苝 ta?", " t� /OnCancel"})
		Msg2Player("Nh薾 頲 tr筺g th竔 Nh﹏ gi� v� ch quy誸");
	else
		CreateTaskSay({"<dec><npc>".."T� ngi  tr� n猲 m筺h m� r錳 c遪 c莕 ta gi髉 sao?", "Th藅 ng筰 qu�! T筰 h� n nh莔 ch� r錳./OnCancel"});
	end
end
