IncludeLib("RELAYLADDER")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\missions\\boss\\bigboss.lua") -- big boss

MISSION_MATCH			= 22		-- ����mission
TIMER_MATCH				= 41		-- ������ʼ��ʱ��
TIMER_BOARD				= 42		-- ͨ�涨ʱ��
TIMER_CLOSE				= 43		-- ����������ʱ��
INTERVAL_BOARD			= 1			-- ͨ����������ӣ���ÿ����ͨ��һ��
INTERVAL_MATCH			= 3600		-- ÿСʱ����һ�Σ��룩
TIME_SIGNUP				= 10
LIMIT_SIGNUP			= TIME_SIGNUP * 60		-- ����ʱ�����ޣ��룩��10����
LIMIT_FINISH 			= 30 * 60	-- ����ʱ�����ޣ��룩��30����
BOAT_POSX				= 1559		-- ��ұ����͵����۵�x����
BOAT_POSY				= 3226		-- ��ұ����͵����۵�y����
LIMIT_PLAYER_COUNT		= 8			-- ����������������
AWARD_COUNT				= 10		-- ȫ�����سɹ�֮����ԹϷ�10�����ر���

SEX_BOY					= 0			-- ����
SEX_GIRL				= 1			-- Ů��
SEX_RENYAO				= 2			-- ����

-- ���ص��� 2011.03.04
CHUANGGUAN30_MAP_ID		= 957
CHUANGGUAN30_TIME_LIMIT = 13*60		-- ǰ��ʮ�Ź���Ҫ������ɵ�ʱ��
CHUANGGUAN30_START_TIME = 10
CHUANGGUAN30_END_TIME	= 22
PLAYER_MAP_TASK			= 2852
COUNT_LIMIT 		= 1



-- NPC����к���
-- NPC�������еĺ��壺��������ID�����֡��ȼ������С��Ƿ�BOSS(0,1)��������λ��
NPC_ATTRIDX_PROCEED		= 1			-- NPC��������
NPC_ATTRIDX_ID			= 2			-- NPC��ID
NPC_ATTRIDX_NAME		= 3			-- NPC����
NPC_ATTRIDX_LEVEL		= 4			-- NPC�ȼ�
NPC_ATTRIDX_SERIES		= 5			-- NPC����
NPC_ATTRIDX_ISBOSS		= 6			-- �Ƿ�BOSS
NPC_ATTRIDX_COUNT		= 7			-- NPC����
NPC_ATTRIDX_POSITION	= 8			-- NPCλ��

USE_NAME_ALL_PLAYERS	= 1			-- ʹ��ȫ���������
USE_NAME_THE_TOPLIST	= 2			-- ʹ�����������

VARS_TEAM_NAME			= 1			-- ��������
-- ���±�����(VARS_PLAYER_NAME + 1)��(VARS_PLAYER_NAME + LIMIT_PLAYER_COUNT)�ֱ𱣴治ͬ��ҵ�����
VARS_PLAYER_NAME		= 2			-- �������
VARS_TEAMLEADER_FACTION = 11        -- �ӳ�����
VARS_TEAMLEADER_GENDER  = 12        -- �ӳ��Ա�

VARV_NPC_BATCH 			= 1			-- �ֵ�����
VARV_NPC_COUNT 			= 2			-- �ֵ�����
VARV_PLAYER_COUNT		= 3			-- ��ҵ�����
VARV_STATE 				= 4			-- mission״̬��1��ʾ������2��ʾ����
VARV_SIGNUP_WORLD		= 5			-- ������ͼ
VARV_SIGNUP_POSX		= 6			-- �����ص��X����
VARV_SIGNUP_POSY		= 7			-- �����ص��Y���� 
VARV_BOARD_TIMER		= 8			-- �������е�ʱ�䣨�룩
VARV_PLAYER_TOTAL_COUNT = 9		-- ����ܵ�����(�����Ƿ��Ѿ�����)
VARV_PLAYER_USE_INDEX	= 10		-- ʹ�õ����������
VARV_NPC_USE_INDEX		= 11		-- ʹ�õ��ĺ�ѡNPC����
VARV_MISSION_RESULT		= 12		-- ����������Ϊʤ��ͨ�أ���Ϊʧ��
VARV_PLAYER_SEX			= 13
-- ���±�����(VARV_PLAYER_SEX + 1)��(VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT)�ֱ𱣴治ͬ��ҵ��Ա𣬣�Ϊ���ԣ���ΪŮ�ԣ���Ϊ����
VARV_PLAYER_SERIES		= VARV_PLAYER_SEX + LIMIT_PLAYER_COUNT + 1		-- 22


VARV_XIAONIESHICHEN_BATCH = 31		-- С��߱�����ֵĹ�
VARV_BATCH_MODEL		= 32			-- ��ǰ���ص�ģʽ��0Ϊ����ģʽ��1Ϊ����֮���ģʽ


-- ���±�����(VARV_PLAYER_SERIES + 1)��(VARV_PLAYER_SERIES + LIMIT_PLAYER_COUNT)�ֱ𱣴治ͬ��ҵ�����

SCRIPT_NPC_DEATH 	= "\\script\\missions\\challengeoftime\\npc_death.lua"
SCRIPT_PLAYER_DEATH = "\\script\\missions\\challengeoftime\\player_death.lua"

-- ������ͼID
map_map = {
	464,
	465,
	466,
	467,
	468,
	469,
	470,
	471,
	472,
	473,
	474,
	475,
	476,
	477,
	478,
	479,
	
	480,
	481,
	482,
	483,
	484,
	485,
	486,
	487,
	488,
	489,
	490,
	491,
	492,
	493,
	494,
	495
};

-- ��Ӧ��ͼ�Ƿ�߼�����
map_isadvanced = {
	[464] = 0,
	[465] = 0,
	[466] = 0,
	[467] = 0,
	[468] = 0,
	[469] = 0,
	[470] = 0,
	[471] = 0,
	[472] = 0,
	[473] = 0,
	[474] = 0,
	[475] = 0,
	[476] = 0,
	[477] = 0,
	[478] = 0,
	[479] = 0,
	
	[480] = 1,
	[481] = 1,
	[482] = 1,
	[483] = 1,
	[484] = 1,
	[485] = 1,
	[486] = 1,
	[487] = 1,
	[488] = 1,
	[489] = 1,
	[490] = 1,
	[491] = 1,
	[492] = 1,
	[493] = 1,
	[494] = 1,
	[495] = 1
};


-- ����
map_series = {
	0,	-- ��
	1,	-- ľ
	2,	-- ˮ
	3,	-- ��
	4	-- ��
};

-- ��ѡNPC������
map_npcname_candidates = {
	"H�u  Kh�t Ki�m",
	"�i�u D�ch �ao",
	"Ki�u ��nh Thi�n",
	"Nh�m Th��ng Khung",
	"B� Hi�u Tr�n",
	"M�u Tu�t Nhung",
	"H�ng Ph� Nhai"
};

-- �㲥
function broadcast(msg)
	AddGlobalNews(msg);
end

-- ������߻ر�����
function kickout()
	local index = 0;
	local player = 0;
	local players = {}
	local i = 1
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			players[i] = player
			i = i + 1
		end
		if (index == 0) then
			break;
		end	
	end
	
	local world = GetMissionV(VARV_SIGNUP_WORLD);
	local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	local OldPlayerIndex = PlayerIndex;
	for i = 1, getn(players) do 
		PlayerIndex = players[i];
		
		DelMSPlayer(MISSION_MATCH,1);
		SetLogoutRV(0);
		NewWorld(world, pos_x, pos_y);
	end
	PlayerIndex = OldPlayerIndex;
end

-- ����ͨ�涨ʱ��
function start_board_timer()
	StartMissionTimer(MISSION_MATCH, TIMER_BOARD, INTERVAL_BOARD * 60 * 18);
end

-- �ر�ͨ�涨ʱ��
function close_board_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_BOARD);
end

-- ���������رն�ʱ��
function start_close_timer()
	-- 10���Ӻ�������������
	StartMissionTimer(MISSION_MATCH, TIMER_CLOSE, LIMIT_FINISH * 18);
end

-- �رձ����رն�ʱ��
function close_close_timer()
	-- 10���Ӻ�������������
	StopMissionTimer(MISSION_MATCH, TIMER_CLOSE);
end

-- ��������
function close_match()
	-- ������߳���ͼ
	kickout();
	
	-- �����ͼ
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- Ҳ�������
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- ��ȡ��Ҽ���
function get_player_map()
	-- ��Ҽ���
	local players = {};
		
	-- ����ÿ����Ա���������Ϣ���뼯��
	local index = 0;
	local player = 0;
	local player_count = 0;
	local old_index = PlayerIndex;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			player_count = player_count + 1;
			if (player_count > LIMIT_PLAYER_COUNT) then
				print(format("Mission player count exceed the limit %d!!!", LIMIT_PLAYER_COUNT));
				break;
			else
				-- DEBUG
				--print(format("player[%d]'s index:%d", player_count, player));
				PlayerIndex = player;
				players[player_count] = {
					GetName(),		-- �������
					GetSex(),		-- ����Ա�
					GetSeries()}; 	-- �������
				-- DEBUG
				--print(format("players[%d], index:%d, name:%s, sex:%d, series:%d",
				--	player_count,
				--	player,
				--	GetName(),
				--	GetSex(),
				--	GetSeries()));
			end
		end
		if (index == 0) then
			break;
		end	
	end
	PlayerIndex = old_index;
	
	-- DEBUG
	--print(format("Now, we have %d players", getn(players)));

	return players;
end

-- ��һ������ɾ��һ��Ԫ�أ������±�
function remove_element(map, index)
	local result = {};
	local count = 1;
	for i = 1, getn(map) do
		if (i ~= index) then
			result[count] = map[i];
			count = count + 1;
		end
	end
	return result;
end

-- ������������Ա𱣴���mission������
function save_player_info()
	local players = get_player_map();
	-- DEBUG
	--print(format("We got %d players", getn(players)));
	for index = 1,getn(players) do
		-- �������
		-- players = remove_element(players, random(1, getn(players)));
		SetMissionS(VARS_PLAYER_NAME + index, players[index][1]);	-- ����
		SetMissionV(VARV_PLAYER_SEX + index, players[index][2]);	-- �Ա�
		SetMissionV(VARV_PLAYER_SERIES + index, players[index][3]);	-- ����
		-- DEBUG
		--print(format("SetMissionS(%d, %s)", VARS_PLAYER_NAME + index, players[index][1]));	-- ����
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SEX + index, players[index][2]));	-- �Ա�
		--print(format("SetMissionV(%d, %d)", VARV_PLAYER_SERIES + index, players[index][3]));	-- ����
	end
	
	-- �������
	SetMissionV(VARV_PLAYER_TOTAL_COUNT, getn(players));
	SetMissionV(VARV_PLAYER_USE_INDEX, 0);
end

lo_range_id = {
	{994, 1001},
	{1002, 1005}
};

hi_range_id = {
	{1026, 1033},
	{1034, 1037}
};

-- �����Ա������ȡNPC��ID
function get_random_npc_id(sex)
	if (sex ~= 0 and sex ~= 1) then
		-- ��������ô����
		return nil;
	end

	local range_id = lo_range_id;
	if (advanced()) then
		range_id = hi_range_id;
	end
	return random(range_id[sex + 1][1], range_id[sex + 1][2]);
end

-- ���ļ��ж�ȡNPCλ��
function get_file_pos(file, line, column)
	x = GetTabFileData(file, line, column);
	y = GetTabFileData(file, line, column + 1);
	return x, y;
end

function func_npc_getid(item, index)
	-- ��ȡ��ǰʹ�õ��������
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	local player_sex = GetMissionV(VARV_PLAYER_SEX + player_use_index);	
		
	-- ��������Ŀ���㣬�������������NPC��ID
	local result = 0;
	if (player_use_index > player_all_count) then
		result = get_random_npc_id(0);
	else
		-- ����ʹ�õ����������ȡ��ǰ����Ա�
		result = get_random_npc_id(player_sex);
	end

	-- DEBUG
	--print(format("func_npc_getid():%d, player_use_index:%d, player_all_count:%d, player_sex:%d",
	--	result, player_use_index, player_all_count, player_sex));
	return result;
end

function func_npc_getname(item, index)
	-- ��ȡ��ǰʹ�õ��������
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- DEBUG
	--print(format("func_npc_getname(), player_use_index:%d, player_all_count:%d",
	--	player_use_index, player_all_count));
	
	-- ��������Ŀ���㣬������ʹ�ú�ѡNPC����
	local result = "";
	if (player_use_index > player_all_count) then
		local npc_use_index = GetMissionV(VARV_NPC_USE_INDEX) + 1;
		if (npc_use_index > getn(map_npcname_candidates)) then
			npc_use_index = 1;
		end
		SetMissionV(VARV_NPC_USE_INDEX, npc_use_index);
		-- DEBUG
		--print(format("func_npc_getname(), npc_use_index:%d", npc_use_index));
		result = map_npcname_candidates[npc_use_index];
	else
		-- ����ʹ�õ����������ȡ����
		result = GetMissionS(VARS_PLAYER_NAME + player_use_index);
	end
	
	-- DEBUG
	--print(format("func_npc_getname():%s", result));
	return result;
end

function func_ladder_getname(item, index)
	local map = item[NPC_ATTRIDX_NAME];
	if (type(map) ~= "table") then
		-- DEBUG
		--print("func_ladder_getname() fail!!!");
		return nil;
	end
	
	-- �����ȡ���а��������
	local name, data = Ladder_GetLadderInfo(map[2], random(1, 10));
	if (name ~= nil and name ~= "") then
		return name;
	end
	
	-- ���ʹ�ú�ѡNPC����
	local pos = random(1, getn(map_npcname_candidates));
	return map_npcname_candidates[pos];
end

-- NPCʹ��ȫ����ҵ�����
function func_npc_get_eachname(item, index)
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	if (index <= player_all_count) then
		return GetMissionS(VARS_PLAYER_NAME + index);
	else
		local count = getn(map_npcname_candidates);
		local pos = mod(index - player_all_count, count);
		if (pos == 0) then
			pos = count;
		end
		return map_npcname_candidates[pos];
	end
end

function func_npc_getseries(item, index)
	-- ��ȡ��ǰʹ�õ��������
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX) + 1;
	local player_all_count = GetMissionV(VARV_PLAYER_TOTAL_COUNT);
	
	-- ��������Ŀ���㣬�������������
	if (player_use_index > player_all_count) then
		local index = random(1, getn(map_series));
		return map_series[index];
	else
		-- ����ʹ�õ����������ȡ����
		return GetMissionV(VARV_PLAYER_SERIES + player_use_index);
	end
end

function func_npc_getpos(item, index)
	local pos = item[NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type ~= "function") then
		return nil;
	end
	
	local func = pos;
	local file = map_posfiles[item[NPC_ATTRIDX_COUNT]];
	local file_name = file[1];	-- �����ļ���
	local pos_count = file[2];	-- ����������
	
	local column = 2 * (random(1, pos_count) - 1) + 1;
	return get_file_pos(file_name, index + 1, column);
end

function func_npc_proceed(item)
	local player_use_index = GetMissionV(VARV_PLAYER_USE_INDEX);
	SetMissionV(VARV_PLAYER_USE_INDEX, player_use_index + 1);
end

-- ������Ʒ
function award_item(item, player_index)
	local old_index = PlayerIndex;
	PlayerIndex = player_index;
	
	local name = item[1];
	if (getn(item) == 2) then
		AddEventItem(item[2]);
	elseif (getn(item) == 3) then
		AddGoldItem(item[2], item[3]);
	elseif (getn(item) == 7) then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	Msg2Player("<#>B�n ��t ���c" .. name .. "!");
	
	PlayerIndex = old_index;
end

-- ���������Ʒ
function award_random_object(objects, player_index)
	local base = objects[1];		-- ��������ڵ�һ��λ��
	local sum = 0;
	local num = random(1, base);
	for i = 2, getn(objects) do		-- �����Ʒ�ӵڶ���λ�ÿ�ʼ
		local odds = objects[i][1];
		local item = objects[i][2];
		sum = sum + odds * base;
		if (num <= sum) then
			award_item(item, player_index);
			break;
		end
	end
end

