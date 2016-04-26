Include( "\\script\\missions\\leaguematch\\head.lua" )

--��Խ��״̬
function wlls_set_over(str_lgname, str_plname)
	local n_over = GetGlbValue(GLB_WLLS_SID)
	if (GetGlbValue(GLB_WLLS_PHASE) == 1) then	--��Ъ������һ������
		n_over = n_over + 1
	end
	LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER, n_over, "", "")
end

--�������
function wlls_leveupcheck()
	local str_plname = GetName();
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then	--��ս��
		return
	end
	
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_over = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER)
	if (n_over > 0) then	--����Խ��
		return
	end

	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_level = WLLS_TAB[n_mytype].match_type[n_mtype].level
	if (n_level == 1) then	--����ս�ӳ�Ա���ж��Ƿ�Խ��
		if (GetLevel() >= WLLS_LEVEL_SENIOR) then	--�Ѿ�Խ��
			wlls_set_over(str_lgname, str_plname)
			Msg2Player("Ŀǰ�ȼ��ѳ����μ�Ҫ��<color=yellow>������������<color> �����㻹���Բμ�<color=yellow>�˴�������������<color> . �¼��㽫���ܲμ�<color=yellow>���ִ��<color>.")
			return
		end
	end

	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_JOB)
	if (n_mytype == 3 and n_job == 0) then	--ʦͽ�������ж�ͽ���Ƿ�Խ��
		if (GetLevel() >= 90) then	--�Ѿ�Խ��
			wlls_set_over(str_lgname, str_plname)
			Msg2Player("��ĵȼ��ѳ��������涨<color=yellow>ʦͽ˫��<color>�����㻹���Բμӱ���<color=yellow>���Ƚ�<color>. ������Ҫ�����¶���")
			return
		end
	end
end