-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   ��֮��ؿ��ĳ��ڴ��Ի�npc����֮�ｫ����
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --����ͬ�����������ɵĿ����ж�
Include("\\script\\activitysys\\g_activity.lua")			--�������
Include("\\script\\activitysys\\playerfunlib.lua")		--�������

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	
	if ( messenger_middletime() == 10  ) then
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_BaiYi..":"..name..", Kh�ng ph�i b�n �� v��t qua th� th�ch c�a Phong K� sao? Mu�n xu�t quan �?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_BaiYi..": T�n S� L�nh - M�c"..name..", Kh�ng ph�i b�n �� v��t qua th� th�ch c�a Phong K� sao? Mu�n xu�t quan �?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_BaiYi..": T�n s� l�nh - ��ng"..name.."��i nh�n! C� ph�i ng��i �� v��t qua th� th�ch c�a Phong K� sao? Mu�n xu�t quan �?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_BaiYi..": T�n s� l�nh - B�c"..name.."��i nh�n! C� ph�i ng��i �� v��t qua th� th�ch c�a Phong K� sao? Mu�n xu�t quan �?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_BaiYi..": T�n s� l�nh - V�ng"..name.."��i nh�n! C� ph�i ng��i �� v��t qua th� th�ch c�a Phong K� sao? Mu�n xu�t quan �?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_BaiYi..": Ng� T� l�nh b�i - V�ng"..name.."��i nh�n! Ta ch�a th�y qua Ng� T� Kim b�i, h�m nay coi nh� ���c m� mang t�m nh�n! �ng th�t l�i h�i!  Ng��i �� v��t qua th� th�ch c�a Phong K�, mu�n xu�t quan �?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --��֮������������������Ϊ�������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1211,0)	
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_06:doTaskEntity()  --ͬ���������
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..":Xin l�i!  B�n ch�a qua �i, trong b�n �� Phong K� �t nh�t b�n ph�i x�c ��nh �t nh�t <color=red>5 t�a ��<color> m�i c� th� qua �i.",1,"K�t th�c ��i tho�i/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_BaiYi..": C� ph�i b�n mu�n r�i kh�i, n�u ch�a ho�n th�nh nhi�m v� m� r�i kh�i, b�n c�ng c� th� ��n D�ch Quan giao tr� nhi�m v� v� nh�n ph�n th��ng nh�ng ph�n th��ng s� gi�m xu�ng r�t nhi�u.",2,"��ng! Ta mu�n r�i kh�i/f_fallmessengertask","�� ta ngh� l�i xem sao/no")

end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --��֮������������������Ϊ���������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
