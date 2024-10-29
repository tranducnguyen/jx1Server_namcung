-------------------------------------------------------------------------
-- FileName		:	messenger_flyrukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ��֮�����
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua"); 	--��������������ݱ�����
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- Խ������Ƭ���ջ
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B�t ��u nhi�m v� /fly_starttask",
	  	"R�i kh�i khu v�c/fly_movecity",
	  	"L�t n�a quay l�i /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, " nhi�m v� t�i b�n �� Phong K�/birthday0905_fly");
	end
	 Describe(DescLink_YiGuan..": �� b�t ��u t�nh th�i gian qua �i, c� g�ng l�n! B�y gi� b�n mu�n l�m g�?",getn(tbDialog), unpack(tbDialog))
end

function fly_starttask()
	if ( nt_getTask(1201) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
		nt_setTask(1201,20)
		DisabledUseTownP(1)			--���ûسǷ�				--1������	--0������
		SetFightState(1);			--��ս��״̬				--1����	--0���ر�
		SetLogoutRV(1);				--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
		SetPunish(0);				--�ر������ͷ�					--1���������ͷ�		--0��û�������ͷ�
		SetCreateTeam(1);			--�������					--1���������		--0�����������
		ForbidChangePK(1);   		--���ܸ���pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
		SetPKFlag(0);               --����Ϊ����ģʽ            
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1559,3113);
		Msg2Player("�� b�t ��u t�nh th�i gian l�m nhުm v� ")
	elseif ( nt_getTask(1201) == 20 ) then
		Describe(DescLink_YiGuan.."B�n �� ho�n th�nh nhi�m v�, kh�ng c�n ti�p nh�n l�i!",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		Describe(DescLink_YiGuan..": Ng��i �� ho�n th�nh nhi�m v�, sao c�n mu�n ti�p nh�n l�i nhi�m v�? Mau r�i kh�i ��y �i!",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1201) == 0 ) then
		Describe(DescLink_YiGuan..": Ng��i �� ho�n th�nh nhi�m v� T�n s� r�i! L�m �n bi�n cho khu�t m�t!",1,"K�t th�c ��i tho�i/no")
	end
end

function fly_movecity()
	local name = GetName()
	if ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("Phong K� D�ch tr�m cung t�ng"..name.."��i nh�n ��n"..citygo[i][4].."D�ch tr�m!")
			end
		end	
	elseif ( nt_getTask(1201) == 10 ) or ( nt_getTask(1201) == 0 ) then
		SetLogoutRV(0);
		NewWorld(37,1601,3001)
	end
end

function birthday0905_fly()
	tbBirthday0905.tbTask:reset_task();
	Say("D�ch quan: T� ng�y 19/06/2009 ��n 24h ng�y 19/07/2009 , n�u ��i hi�p c� th� v��t qua ���c m�t trong nh�ng th� th�ch sau ��y th� ��i hi�p s� nh�n ���c m�t trong b�n t�n v�t v� c�ng qu� gi� l� �B� V��ng Th��ng�. ��i hi�p c� b�ng l�ng tham gia th� th�ch kh�ng?", 8, 
		"Nh�n nhi�m v� Ti�u di�t 500 Kim Qu�c gian t�./#birthday0905_settask_message(1)",
		"Nh�n nhi�m v� Ti�u di�t 6 H� B�o K�./#birthday0905_settask_message(2)",
		"Nh�n nhi�m v� Ti�p x�c 100 t�a ��./#birthday0905_settask_message(3)",
		"Ta �� ho�n th�nh nhi�m v� Ti�u di�t 500 Kim Qu�c gian t�./#birthday0905_gettask_message(1)",
		"Ta �� ho�n th�nh nhi�m v� Ti�u di�t 6 H� B�o K�./#birthday0905_gettask_message(2)",
		"Ta �� ho�n th�nh nhi�m v� Ti�p x�c 100 t�a ��./#birthday0905_gettask_message(3)",
		"Ta mu�n h�y nhi�m v� hi�n t�i/birthday0905_cancel_message",
		"Ta c� chuy�n g�p, s� quay l�i sau./no");
end

function no()
	
end