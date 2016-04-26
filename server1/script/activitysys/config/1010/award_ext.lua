Include("\\script\\lib\\log.lua")
IncludeLib("ITEM")

_LogBachHo = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local szCode = ""
	if GetItemCmd then
		szCode = GetItemCmd(nItemIdx) or ""
	end
	%tbLog:PlayerAwardLog("LogDoPhoBachHo", "ʹ����Ʒ���",strItemName,szCode,0)
end

tbAward_Ext = {
	["award1500"] = {
		  {szName = "������е-��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}},
	},
	["award200"] = {
			{szName = "�i����ֵ", nExp=100000000,nRate=42},
			{szName = "�i����ֵ", nExp=200000000,nRate=25},
			{szName = "�i����ֵ", nExp=300000000,nRate=19},
			{szName = "�i����ֵ", nExp=500000000,nRate=9.9},
			{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nRate=0.5,CallBack = _LogBachHo},
			{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nRate=0.5,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nRate=0.5,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nRate=0.5,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nRate=0.5,CallBack = _LogBachHo},
			{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nRate=0.5,CallBack = _LogBachHo},
			{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nRate=0.5,CallBack = _LogBachHo},
			{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nRate=0.3,CallBack = _LogBachHo},
			{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nRate=0.3,CallBack = _LogBachHo},
			{szName="�׻���еͼ��",tbProp={6,1,3182,1,0,0},nRate=0.2,CallBack = _LogBachHo},
			{szName="�׻�����",tbProp={6,1,3183,1,0,0},nRate=0.1},
	},
	["awardspecial"] = { 
			{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
			{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1},
			{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻���еͼ��",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.0003,CallBack = _LogBachHo},
			{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=2},
			{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=2},
			{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},
			{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},
			{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},
			{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=2},
			{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=2},
			{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},
			{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},
			{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},
			{szName = "�i����ֵ", nExp=20000000,nRate=50.495},
			{szName = "�i����ֵ", nExp=50000000,nRate=18},
			{szName = "�i����ֵ", nExp=100000000,nRate=5},
			{szName="���ڿ�����( ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.2},
			{szName="�����±��� ( ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2},
			{szName="����Ь���� (ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.2},
			{szName="������������( ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.2},
			{szName="���ڻ�����( ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.2},
			{szName="������������( ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.2},
			{szName="�����屦��(ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.2},
			{szName="�����Ͻ䱦��(ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.1},
			{szName="�����½䱦��(ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.1},
			{szName="������е����(ѡ����ϵ)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1},
			{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=3.3},
			{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=2},
			{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=1},
			{szName="�׻���",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.0002,CallBack = _LogBachHo},

		},
	["awardnomal"] ={ --Server�ɼ�����
			{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1},
			{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.3},
			{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.3},
			{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3},
			{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3},
			{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.2},
			{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.3},
			{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.3},
			{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
			{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
			{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},
			{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.4},
			{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
			{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1},
			{szName="���ڿ�����( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.004},
			{szName="�����±��� ( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.004},
			{szName="����Ь����( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.004},
			{szName="������������ ( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.004},
			{szName="���ڻ�����( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.004},
			{szName="������������( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.004},
			{szName="�����屦��( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.004},
			{szName="�����Ͻ䱦��( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.002},
			{szName="�����½䱦��( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.002},
			{szName="������е����( ѡ������)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.001},
			{szName="���ʯ",tbProp={6,1,2710,1,0,0},nCount=1,nRate=1},
			{szName="V��¹ʯ",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.5},
			{szName="����ʯ",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.3},
			{szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
			{szName="�������",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
			{szName="������",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
			{szName="�������",tbProp={6,1,30214,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="���״����",tbProp={6,1,30215,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="Ӣ����",tbProp={6,1,1604,1,0,0},nCount=1,nRate=0.2,nExpiredTime=20160},
			{szName="���굤",tbProp={6,1,2837,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="��ңɢ",tbProp={6,1,2831,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
			{szName="����������",tbProp={6,1,3005,1,0,0},nCount=1,nRate=0.1},
			{szName="��������",tbProp={6,1,2623,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
			{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=15},
			{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻���ͼ��",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.0005,CallBack = _LogBachHo},
			{szName="�׻���еͼ��",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.0003,CallBack = _LogBachHo},
			{szName="�������",tbProp={6,1,30216,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="��������",tbProp={6,1,30217,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
			{szName="ս�����",tbProp={6,1,30218,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
			{szName="ս�������",tbProp={6,1,30219,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
			{szName="150�����ؼ� (19��)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.1},
			{szName="150�����ؼ� (20��)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.1},
			{szName = "�i����ֵ", nExp=5000000,nRate=46.0122},
			{szName = "�i����ֵ", nExp=10000000,nRate=10},
			{szName = "�i����ֵ", nExp=15000000,nRate=6.5},
			{szName = "�i����ֵ", nExp=20000000,nRate=0.5},
			{szName = "�i����ֵ", nExp=50000000,nRate=0.05},
	},
}	