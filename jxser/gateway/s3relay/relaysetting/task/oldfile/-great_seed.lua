Include("\\script\\gb_taskfuncs.lua")
greatseed_configtab = {
	{340,3,100,"\\settings\\maps\\great_night\\Ī�߿�.txt","Ī�߿�"},			--Ī�߿�
	{336,3,100,"\\settings\\maps\\great_night\\�����.txt","�����"},			--�����
	
	{322,2,100,"\\settings\\maps\\great_night\\����ɽ��´.txt","����ɽ��´"},	-- ����ɽ��´
	{321,2,100,"\\settings\\maps\\great_night\\����ɽ��.txt","����ɽ��"},		-- ����ɽ��
	{225,2,30,"\\settings\\maps\\great_night\\ɳĮɽ��1.txt","ɳĮɽ��1"},		-- ����ɽ��
	{226,2,30,"\\settings\\maps\\great_night\\ɳĮɽ��2.txt","ɳĮɽ��2"},		-- ����ɽ��
	{227,2,40,"\\settings\\maps\\great_night\\ɳĮɽ��3.txt","ɳĮɽ��3"},		-- ����ɽ��
	
	{182,1,25,"\\settings\\maps\\great_night\\�������Թ�.txt","������"},	-- ����ɽ��
	{167,1,25,"\\settings\\maps\\great_night\\���ɽ.txt","�i���ɽ"},			-- ����ɽ��
	{200,1,25,"\\settings\\maps\\great_night\\�������Թ�.txt","�������Թ�"},	-- ����ɽ��
	{92,1,25,"\\settings\\maps\\great_night\\���ɽ.txt","���ɽ"},				-- ����ɽ��

--	{341, 4, 1, "\\settings\\maps\\great_night\\Į����ԭ.txt","Į����ԭ"},		-- Į����ԭ
--	{333, 4, 1, "\\settings\\maps\\great_night\\��ɽ��.txt","��ɽ��"},			-- ��ɽ��
--	{319, 4, 1, "\\settings\\maps\\great_night\\�����.txt","�����"},			-- �����
	{959, 4, 3, "\\settings\\maps\\great_night\\˫����.txt","ս����"},			-- ˫����
--	{181, 4, 1, "\\settings\\maps\\great_night\\��ˮ��.txt","��ˮ��"},			-- ��ˮ��
};

tblantern_area = {2, 21, 167, 193}

function TaskShedule()
	--���÷�������
	TaskName("�Ի͹�")
	
	-- 12��00�ֿ�ʼ
	TaskTime(12	, 00);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(5)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg("#NAME?");
end

function TaskContent()
	--��19:30��20:01���м���ܴ���
	local START_TIME = 1200;
	local END_TIME = 1230;
	
	if righttime_add() ~= 1 then--���ʱ�䲻��
		gb_SetTask("���ƻ", 1, 0)
		gb_SetTask("�Ի͹�", 12, 0);	--12�ű��������洢NPC�����
		return
	end;
	
	OutputMsg("#NAME?")
	--����������ڻ�ʼ����������
	local nNowTime = tonumber(date("%H%M"))
	
	--����������������ʱ��ÿ��׼ʱ��ʼ�ʱ����һ��ʱ
	if nNowTime >= 1200 and nNowTime < 1205 then	--	
		--NPC��� = NPC��˳�� +  ����(4)��������֤�����NPC�Ƿ����ڿɱ�ժȡ�Ĺ�ʵ
		gb_SetTask("�Ի͹�", 12, 0);	--12�ű��������洢NPC�����
	end
	--------------------
	--
	--------------------
	--����ǵڼ���5���ӣ����ڼ�����
	--ִ�е�ʱ��������ε���ż��ȷ����ˢ���ӻ��ǹ�ʵ
	local nBatch = floor(mod(nNowTime,100)/5) + 1
	--
	local nMapCount = getn(greatseed_configtab);
	-----
	--
	-----
	for i = 1, nMapCount do
		local strExecute = format("dw Global_GreatSeedExecute(%d, %d, %d, [[%s]], [[%s]],%d)", greatseed_configtab[i][1], greatseed_configtab[i][2], greatseed_configtab[i][3], greatseed_configtab[i][4],greatseed_configtab[i][5],nBatch);
		GlobalExecute(strExecute);
		local szMsg = "";
		if (mod(nBatch,2) == 1) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "�Ի͹�"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "�Ի͹�"
		elseif (mod(nBatch,2) == 0) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "�Ի͹�"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "�Ի͹�"
		end; 
		szMsg = format("Ŀǰ<%s> �ѳ�����%s, 5 ���Ӻ󽫽�������λ����׼��ժ��",
					szMsg,
					greatseed_configtab[i][5]);
		
		GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg));
	end;
end
function CreateLantern(nDate)
	if (gb_GetTask("���ƻ2") == 0 or gb_GetTask("���ƻ2") ~= nDate) then
		lantern_area = tblantern_area[ random( getn(tblantern_area) ) ]
		gb_SetTask("���ƻ1", lantern_area)
		gb_SetTask("���ƻ2", nDate)
	end
	GlobalExecute("dw GN_Create_Lanterns()")
end

-- LLG_ALLINONE_TODO_20070802
--
function righttime_add()
	local nTime = tonumber(date("%H%M"));
	if (nTime >= 1200 and nTime < 1230)  then
		return 1;
	end;
	return 0;
end

function goldenseedmap()	--�����һ�λƽ����ӳ��ֵĵ�ͼ��1����2���ݣ�
	local goldcity = random(1, 2);
	gb_SetTask("�Ի͹�", 1, goldcity);
	local RowIndex = random(2, 41)
	gb_SetTask("�Ի͹�", 2, RowIndex);
	OutputMsg("�Իͳ���"..goldcity);
	OutputMsg("goldenseedmap();"..RowIndex);
	return goldcity;
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
