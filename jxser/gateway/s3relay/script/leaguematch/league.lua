Include( "\\script\\leaguematch\\head.lua" )

--�ṩGameServer���õĽ���ս�Ӻ���
function wlls_create(szParam)
	_M("�� wlls_create �������Ϊ:"..szParam);
	
	--��ִ������
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	n_type = tonumber(aryParam[2])
	n_mtype = tonumber(aryParam[3])
	leaguename = aryParam[4]

	--�����ظ������Ա
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin l�i b�n �� tham gia nh�m kh�c kh�ng th� t�o m�t nh�m cho ri�ng m�nh!")
		return 0
	end

	--����ս�����ظ�
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if(not FALSE(n_lid)) then
		wlls_say(rolename, "Xin l�i t�n nh�m [<color=yellow>"..leaguename.."<color>] �� ���c s� d�ng!")
		return 0
	end
	
	--����ս��
	if(wlls_relay_createleague(leaguename) == 1) then
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_MTYPE, n_mtype)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_STYPE, n_type)
		--��ӵ�ǰrolename��ս��
		if(wlls_relay_addmember(leaguename, rolename) == 1) then
			wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_JOB, 1)
			wlls_say(rolename, "B�n �� t�o nh�m thi ��u [<color=yellow>"..leaguename.."<color>] th�nh c�ng!", nil, 1)
			wlls_rest_hint(rolename, 1, n_type)
			return 1
		end
		wlls_say(rolename, "Xin vui l�ng li�n h� qu�n l� !")
	end

	OutputMsg("create league "..leaguename.." error!!!")
	return 0
end

--�ṩGameServer���õļ����Ա����
function wlls_add(szParam)
	_M("�� wlls_add �������Ϊ:"..szParam);

	--��ִ������
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	leaguename = aryParam[2]
	cpname = aryParam[3]
	
	--�����ظ������Ա
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin l�i b�n �� tham gia nh�m kh�c kh�ng th� gia nh�p v�o nh�m n�y !!")
		wlls_say(cpname, "C�c th�nh vi�n nh�m kh�c kh�ng th� gia nh�p nh�m c�a  <color=yellow>"..rolename.."<color> !", 0)
		return 0
	end
	
	--��ֹ����ս����������
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "Xin l�i nh�m b�n t�m kh�ng t�n t�i ho�c �� gi�i t�n!")
		wlls_say(cpname, "Nh�m b�n g�p v�n ��! Kh�ng c�n th�nh vi�n trong nh�m.", 0)
		return 0
	end
	_, _, membercount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (membercount >= n_maxmem) then
		wlls_say(rolename, "Xin l�i nh�m c�a b�n ph�i c� �� th�nh vi�n m�i c� th� tham gia !!")
		wlls_say(cpname, "Nh�m c�a b�n �� �� ng��i kh�ng th� th�m th�nh vi�n m�i!!", 0)
		return 0
	end

	--����ս��
	if(wlls_relay_addmember(leaguename, rolename) == 1) then
		wlls_say(rolename, "Xin ch�c m�ng b�n �� gia nh�p th�nh c�ng nh�m [<color=yellow>"..leaguename.."<color>]", nil, 1)
		wlls_say(cpname, "<color=yellow>"..rolename.."<color> gia nh�p nh�m th�nh c�ng!", 0)
		wlls_rest_hint(cpname, membercount+1, n_type)
		return 1
	end

	OutputMsg("wlls_add error!", rolename, leaguename)
	return 0
end

--�ṩGameServer���õ�ɾ����Ա���������գ�
function wlls_leave(rolename)
	_M("�� wlls_leave �������Ϊ:"..rolename);
	
	--ȷ���Ѿ������˶���
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "B�n kh�ng c� nh�m!")
		return 0
	end

	local leaguename, _, membercount = LG_GetLeagueInfo(n_lid)
	local str = "[<color=yellow>"..leaguename.."<color>] �� r�i kh�i ��i! "
	local removelg = 0

	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	if (membercount > 1) then
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, leaguename, rolename, WLLS_LGMTASK_JOB)
		if (n_job == 1) then	--�ӳ��˳�
			for i = 0, LG_GetMemberCount(n_lid)-1 do
				local name = LG_GetMemberInfo(n_lid, i)
				if (name ~= rolename) then
					if (n_type == 3) then	--ʦͽ����ȡ��ͽ�ܱ����ʸ�
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_OVER, 1)
					else	--�����������ƽ��ӳ�
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_JOB, 1)
						str = str .. "��i tr��ng c�a b�n �� ���c chuy�n giao cho ��ng ��i: <color=yellow>" .. name.."<color>"
						break
					end
				end
			end
			if (n_type == 3) then	--ʦͽ����ȡ��ͽ�ܱ����ʸ�
				str = str .. "Th�nh vi�n nh�m b�n �� b� xo� kh�i cu�c thi !."
			end
		end
	else
		str = str .. "��Ķ��ѽ�ɢ!"
		removelg = 1
	end
	
	--ɾ����Ա
	if(LGM_ApplyRemoveMember(WLLS_LGTYPE, leaguename, rolename, "", "", removelg) == 1) then
		wlls_say(rolename, str, 1, 1)
		return 1
	end

	OutputMsg("wlls_leave error!", rolename, leaguename)
	return 0
end

--����ս�ӣ����գ�
function wlls_relay_createleague(leaguename)
	local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
	LG_SetLeagueInfo(nNewLeagueID, WLLS_LGTYPE, leaguename)	--����������Ϣ(���͡�����)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end

--�����Ա�����գ�
function wlls_relay_addmember(leaguename, rolename)
	local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
	--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
	LGM_SetMemberInfo(nMemberID, rolename, 0, WLLS_LGTYPE, leaguename) 
	local ret = LGM_ApplyAddMember(nMemberID, "", "") 
	LGM_FreeMemberObj(nMemberID)
	
	if (ret == 1) then	--��¼����ս�ӵ�����
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		--�����ڼ���ģ���Ϊ��һ�����������
		if (GetGblInt(RLGLB_WLLS_PHASE) > 1) then n_sid = n_sid - 1 end
		wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_ADDSID, n_sid)
	end

	return ret
end

--���Ѷӳ������Լ�����ٶ�Ա
function wlls_rest_hint(n_plname, n_count, n_type)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (n_count < n_maxmem) then
		wlls_say(n_plname, "Nh�m [<color=yellow>"..leaguename.."<color>] c� <color=yellow>"..n_count.."<color> th�nh vi�n.C�n th�m <color=yellow>"..(n_maxmem-n_count).."<color> ng��i", 1)
	else
		wlls_say(n_plname, "Nh�m [<color=yellow>"..leaguename.."<color>] c� ��  <color=yellow>"..n_maxmem.."<color> th�nh vi�n", 1)
	end
end

--��ָ����ɫ������ҷ���Ϣ
function wlls_say(rolename, msg, b_msg, b_sync)
	_M("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
	GlobalExecute("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
end

