-- ��ZingPlay��ý�Ʒ
-- ZingPlay���

-- COMMON ���� --
ZingPlay_Start_Date	= 20081018;		-- ���ʼʱ��
ZingPlay_End_Date	= 20081107;		-- ���ʹ������


-- TSK ������� --
TSK_ZINGPLAY_VERSION	= 2563;		-- ��¼���ʼʱ��
TSK_ZINGPLAY_MAXEXP		= 2564;		-- ��¼��õľ���ֵ

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	
	local n_cur_date = GetTask(TSK_ZINGPLAY_VERSION);
	
	if (n_cur_date ~= ZingPlay_Start_Date) then
		SetTask(TSK_ZINGPLAY_VERSION, ZingPlay_Start_Date);
		SetTask(TSK_ZINGPLAY_MAXEXP, 0);
	end
	
	local n_max_exp = 200000000;
	local n_one_exp = 20000000;
	
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		local n_cur_exp = GetTask(TSK_ZINGPLAY_MAXEXP);
		
		if (n_cur_exp >= n_max_exp) then
			Say(format("������zingplay������ѻ��%d���飬���ԣ����ܼ���ʹ��zingplay�����.", n_max_exp), 0);
			return 1;
		end
		
		SetTask(TSK_ZINGPLAY_MAXEXP, n_cur_exp + n_one_exp);
		AddOwnExp(n_one_exp);
		
		local sz_msg = format("ʹ��zingplay������%d ����", n_one_exp);
		
		Msg2Player(sz_msg);
		
		WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
				GetLocalDate("%Y-%m-%d_%X"),
				GetName(),
				GetAccount(),
				sz_msg	));
	else
		
		Say("��ѽ���������ʹ�ø���Ʒ��.");
		return 0;
	end
end