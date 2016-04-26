if (not __FESTIVAL_HEAD__) then
	__FESTIVAL_HEAD__ = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\springfestival\festival_file_npc_head.lua]]);
	Include("\\script\\lib\\gb_taskfuncs.lua") --
	Include("\\script\\lib\\common.lua")
	--��ֵ����
	--DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>ʥ�����ˣ�<link>"	
	
	FE_PREPAREMISSIONID = 30;
	FE_MISSIONID = 31;
	
	FE_FRAME = 18;	--ÿ��18֡
	FE_REFRASHTIME = 15 * FE_FRAME; -- ÿ15����ˢһ�ι�
	FE_VANISHTIME = 10 * FE_FRAME;	--ʥ������ͣ��10����
	FE_RUNINTERVER = 30 * FE_FRAME; --30��һ�Σ����Թ�����Ϸ
	FE_MAXPLAYTIMES = 5; --ÿ�����һ����5��
	FE_LEVELLIMIT = 50; --��Ҳμ���Ҫ����С����
	
	FE_PREPARETIME = 57; --׼������ʱ��
	FE_FAIRY_SMALLTIMERID = 58;	--ˢ�ּ�ʱ��
	FE_REPORT_SMALLTIMERID = 59;	--RunMission�õļ�ʱ����
	FE_INTERVER = 5 * FE_FRAME;	--5���Ӵ���ˢ�ֺ�����ִ�����
	
	--GLBֵ
	GLB_FE_PHASE = 849; --���ڻ��ʱ��
	--===============�͹����==================
	FE_NPCID = 361;	--ˢ���ֵ�NCP index
	FE_MAPID = {584, 585};	--ʥ�����ͼId
	
	FE_SMALLMAPCOUNT = 19;	--һ����12��С��ͼ
	FE_MOUSECOUNT_MIN = 10;	--һ��С��ͼһ������ˢ������Ŀ
	FE_MOUSECOUNT_MAX = 10;	--һ��С��ͼһ�����ˢ������Ŀ
	FE_MAXPLAYERCOUNT = 10;	--ÿ����Ϸ���10���ˣ�
	FE_NIANSHOU_XUANYUN = 10;   --����ÿ������10�ξͱ�ѣ��
	FE_ALL_MAXPLAYERCOUNT = 100; --һ�����120�ˣ�
	--=========================================
	
	--=========�������===============
	TK_FE_LEAVERMAPID = 1123;	--�洢�������mapid
	TK_FE_LEAVERPOSX = 1124;	--�洢�뿪��Ϸ��x�����
	TK_FE_LEAVERPOSY = 1125;	--�洢�뿪��Ϸ��y�����
	
	TK_FE_DAYKEY = 1126;	--��¼����һ��
	TK_FE_PLAYTIMES = 1127; --��¼һ������Ĵ���
	
	TK_FE_COUNT_ONETIME = 1128;	--��¼һ�����˶��ٸ�
	
	TK_FE_RANK = 1129;		--��¼һ����������
	
	TK_FE_GROUPID = 1130;	--��¼��ҵ�Group��
	TK_FE_EXP_BEISHU = 1131; -- ��þ���ı���
	TK_FE_EXP_TIME = 1132;  -- ���˫����ʱ��
	
	TK_FE_ATTACKED_TIMES = 1133;    --��¼���ޱ������Ĵ���
	TK_FE_ATTACKED_INTERVER = 1134;     --��ͨ���ʹ�õ��߼��
	
	--================================
	
	--MS���֣�
	MS_FE_STATE = 1;
	MS_FE_TIMERSTATE = 2; --������¼���ڽ���Ľ���ˢ�ֺ�����֣�0������֣�1��ˢ����
	MS_FE_NEWSVALUE = 3; --
	MS_FE_BEGINGMAPID = 10; --��¼��ʼ�ĵ�ͼ��ID
	MS_FE_PREPARENEWSVALUE = 5; --׼������ʱ����
	MS_FE_GAMECOUNT = 6;    --  ��¼һ����ʼ����Ϸ�ĸ���
	--�������֣�
	FESTIVAL_SHREWMOUSE = "�����";
	FE_ANIMALNAME = "����";
	FE_MOUSENAME = "ʧ��С��"; --ʥ�����������
	FE_GIFTNAME = "���µ�����";       --����NPC������
	FE_SIGNNPCNAME = "<color=yellow>���Ų���<color>:";    --����ʥ�����˵�����
	FE_MAPPOINTFLORDER = "springfestival2006";
	FE_NIGHT_BEGINTIME = 1900;
	FE_NIGHT_ENDTIME = 2300;
	FE_NOON_BEGINTIME = 1200;
	FE_NOON_ENDTIME = 1400;
	FE_DARK_BEGINTIME = 100;
	FE_DARK_ENDTIME = 300;
	FESTIVAL_OK = 1;    --����״̬�϶���ʾ
	FESTIVAL_NO = 0;    --����״̬�񶨱�ʾ
	FESTIVAL_ENTERSPEED = 16; --������Ϸ����ҵ��ٶ�
	FESTIVAL_LEAVERSPEED = -1; --�뿪��Ϸ����ҵ��ٶ�
	
	--����ʥ������
	function festival_putfairy()
		local nNPCCount;
		local PosTab;	--���ڼ�¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(FE_MAPID[2])
		local scriptfile = [[\script\missions\springfestival\npcs\festival_shrewmouse.lua]];
		
		local nBeginID = GetMissionV(MS_FE_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(MS_FE_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > FE_SMALLMAPCOUNT) then
		        j = mod(i, FE_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
			nNPCCount = random(FE_MOUSECOUNT_MIN, FE_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\"..FE_MAPPOINTFLORDER.."\\elf_%d.txt", j);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, FE_NPCID, FE_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--���ʥ������
	function festival_clearfairy(szNPCName)
	    if ("string" ~= type(szNPCName)) then
	        return
	    end;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(FE_MAPID[2]);
		ClearMapNpcWithName(FE_MAPID[2], szNPCName);     --�����е��������
		SubWorld = OldWorld;
	end;
	
	
	--���뵽��Ϸ��
	function festival_joingame()
		local nNowTime = tonumber(date("%y%m%d"));
		if (GetTask(TK_FE_DAYKEY) ~= nNowTime) then
			SetTask(TK_FE_DAYKEY, nNowTime);
			SetTask(TK_FE_PLAYTIMES, 0);
		end;

		--���м���
		local nTimes = GetTask(TK_FE_PLAYTIMES);
		if (nTimes >= FE_MAXPLAYTIMES) then
			Talk(1, "", FE_SIGNNPCNAME.."����������5���ˣ�Ҫ����Ϣһ�°�!");
			return
		end;
		
		if (GetLevel() < FE_LEVELLIMIT) then
			Talk(1, "", FE_SIGNNPCNAME.."��ĵȼ����ͣ��Ҳ�������Σ�գ��ȵ�50����������.");
			return
		end;
		
		
		if (gb_GetTask(FESTIVAL_SHREWMOUSE, 1) ~= 1) then
			local nNowTime = tonumber(GetLocalDate("%H%M"));
			local bOn = 0;
			if ((nNowTime >= FE_NIGHT_BEGINTIME and nNowTime <= FE_NIGHT_ENDTIME) or 
              (nNowTime >= FE_NOON_BEGINTIME and nNowTime <= FE_NOON_ENDTIME) or 
              (nNowTime >= FE_DARK_BEGINTIME and nNowTime <= FE_DARK_ENDTIME)) then
				    bOn = 1;
			end;
			if (bOn == 0) then
				Talk(1, "", FE_SIGNNPCNAME.."������׼���Ը����޵ļƻ��������12:00 ��14:00, ����19:00 �� 23:00, ��ҹ1:00 ��3:00, ��ʱҪ��Ŷ!");
				return
			else
				Talk(1, "", FE_SIGNNPCNAME.."��Ҳ��ȥ����ﰡ����·�����Ѿ����ˣ���0 ��, 15 ��, 30 ��, 45�� ������.");
				return
			end;
		end;
		
		local ww, xx, yy = GetWorldPos();
		SetTask(TK_FE_LEAVERMAPID, ww);
		SetTask(TK_FE_LEAVERPOSX, xx);
		SetTask(TK_FE_LEAVERPOSY, yy);
		local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\player.txt]];
		local nPosX, nPosY;
		nPosX, nPosY = getadatabetween(szFile, 2, 15);
		NewWorld(FE_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--��Ϸ����
	function festival_gameover(nMapID, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapID);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(nMissionID, idx, 0);
			if (pidx > 0) then
				tabPlayer[i] = pidx;
			end;
			
			if (0 == idx) then
				break;
			end;
			
		end;
		
		local nLoop = getn(tabPlayer);
		for i = 1, nLoop do
			PlayerIndex = tabPlayer[i];
			festival_setplayerleaverstate();
			NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--����Լ���״̬
	function festival_get_exptimes()
		local exp_time = GetTask(TK_FE_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_FE_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 and nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function festival_setplayertoprepare()	--��ҽ���׼����ʱ�����״̬����
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);

		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200, 1);
		--����ս��״̬
		SetFightState(FESTIVAL_NO);
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(FESTIVAL_OK);
		--�������ͷ�
		SetPunish(FESTIVAL_NO);
		--�ر���ӹ���
		SetCreateTeam(FESTIVAL_NO);
		
		--��ֹ�⻷
		ForbitAura(FESTIVAL_OK)
		--���ó�ɱ
		ForbidEnmity(FESTIVAL_OK)
		--��PK���� 

		--��ʼӦ�ö�����PK
		SetPKFlag(FESTIVAL_NO)
		--��ֹ����;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		DisabledUseTownP(FESTIVAL_OK);	--��ֹʹ�ûس̣�
	end;
	
	function festival_setplayerleaverstate()	--����뿪��Ϸʱ�����״̬����
		ForbitSkill(FESTIVAL_NO);
		SetMoveSpeed(FESTIVAL_LEAVERSPEED);
		
		RestoreOwnFeature();    --�������˱��ԭ������
		local i;
		for i = 1035, 1048 do
            ConsumeItem( -1, 1000, 6, 1, i, 1 );
        end;
		
		--��ֹ�⻷
		ForbitAura(FESTIVAL_NO)
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,0);
		--����ս��״̬
		SetFightState(FESTIVAL_NO);
		--�������ͷ�
		SetPunish(FESTIVAL_OK);
		--�ر���ӹ���
		SetCreateTeam(FESTIVAL_NO);
		--��PK���� 
		
		--���ó�ɱ
		ForbidEnmity( FESTIVAL_NO )
		--��ʼӦ�ö�����PK
		SetPKFlag(FESTIVAL_NO)
		--��ֹ����;
		DisabledStall(FESTIVAL_NO);
		ForbitTrade(FESTIVAL_NO);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(FESTIVAL_NO);
		DisabledUseTownP(FESTIVAL_NO);	--��ֹʹ�ûس̣�
	end;
	
	function festival_setplayertogame()	--��ҽ�����Ϸ��ʱ�����״̬����
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,1);
		
		SetTask(TK_FE_PLAYTIMES, GetTask(TK_FE_PLAYTIMES) + 1);
		--����ս��״̬
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(FESTIVAL_OK);
		
		--��ֹ�⻷
		ForbitAura(FESTIVAL_OK)
		SetFightState(FESTIVAL_OK);
		--�������ͷ�
		SetPunish(FESTIVAL_NO);
		--�ر���ӹ���
		SetCreateTeam(FESTIVAL_NO);
		--��PK���� 

		--���ó�ɱ
		ForbidEnmity( FESTIVAL_OK )
		--��ʼӦ�ö�����PK
		SetPKFlag(FESTIVAL_OK)
		--��ֹ����;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		SetCurCamp(1);	--������ʱ��Ӫ
		DisabledUseTownP(FESTIVAL_OK);	--��ֹʹ�ûس̣�
	end;

	--����һ������ڵ�ǰ��ҵ�ѡ��
	function festival_make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--��������Ƿ�������Ϸ�У��ɹ�����PlayerIndex���򷵻�nil
	function festival_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--����Ƿ��ڵ�ǰ������
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(FE_MISSIONID, nPlIdx)	--����Ƿ���ָ��Mission��
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	--�������Ƿ���Ա�ʹ��
	function itemuseplacecheck(nType)   --nType :1�����������ߣ�2��������ר�õ��ߣ�3������ͨ���רҵ����
	    local ww, xx, yy = GetWorldPos();
	    if (FE_MAPID[2] ~= ww) then
    	    Talk(1, "", "����Ʒֻ���ڴ����.");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) <= FE_SMALLMAPCOUNT and 2 == nType) then
    	    Talk(1, "", "ֻ�д����Ҳ���ʹ�ø����");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT and 3 == nType) then
    	    Talk(1, "", "ֻ��һ����Ҳ���ʹ�ø���Ʒ.");
	        return 0;
	    end;
	    
	    return 1
	end;
	--�ҵ�������Ӫ�����ޡ���>��ң���ҡ���>����
	function festival_getgroupid(nGroupId)
	    if (nGroupId < 1) then
	        return nil
	    end;
	    
	    if (nGroupId > FE_SMALLMAPCOUNT) then
	        return nGroupId - FE_SMALLMAPCOUNT;
	    else
	        return nGroupId + FE_SMALLMAPCOUNT;
	    end;
	end;
	
	function festival_go_other_place()  --���������ʼ��
	    local nBeginMapID = GetMissionV(MS_FE_BEGINGMAPID);
    	local nGroupId = GetTask(TK_FE_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, FE_SMALLMAPCOUNT) + 1;
    	local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\elf_]]..nMapId..[[.txt]];
    	local PosX, PosY = getadata(szFile);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_go_back(nBeginMapID)  --���������ʼ��
    	local nGroupId = GetTask(TK_FE_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, FE_SMALLMAPCOUNT) + 1;
    	local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\player.txt]];
		local PosX, PosY = getadatabetween(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_checkinterver()
	    local gametime = GetGameTime();
	    if (GetTask(TK_FE_ATTACKED_INTERVER) > gametime) then
	        return 0;
	    else
	        SetTask(TK_FE_ATTACKED_INTERVER, gametime + 2);
	        return 1;
	    end;
	end;
end;