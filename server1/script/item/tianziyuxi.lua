-- ��������
-- ZhiDong
IL("LEAGUE")
IL("SETTING")
IncludeLib("ITEM")
IncludeLib("TASKSYS");
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\global\\login_head.lua")

-- ����
if not tbItemTianZiYuXi then
	tbItemTianZiYuXi = tbBaseClass:new();
end

-- ��ʼ��
function tbItemTianZiYuXi:init()
	self.ParamID_Blank_1			= 1    -- �հױ��λ
	self.ParamID_Blank_2			= 2    -- �հױ��λ
	self.ParamID_OverdueDate		= 3	   -- ��¼�����Ĺ�������
	self.ParamID_UsingDate			= 4	   -- ��¼�ϴ�ʹ������������
	self.ParamID_TotalCount		 	= 5	   -- ��¼�ܹ�������ʹ�õĴ���
	self.ParamID_DayCount			= 6	   -- ��¼���컹����ʹ�õĴ���
	self.nMaxUseTotalCount			= 12   -- ���������ʹ���ܴ���
	self.nMaxUseDayCount			= 2	   -- ������ÿ�����ʹ�ô���
	self.nMinMsgLen					= 4	   -- ��������С����
	self.nMaxMsgLen					= 80   -- ��������󳤶�
	self.nDetailType				= 1    -- ��Ʒ����
	self.nParticualType				= 2059 -- ��Ʒ����
	self.TempTask_HasYuXi			= 252  -- ��ʱ�����������¼�Ƿ�ӵ������
	self.szDescLink					= "<link=image[0,0]:\\spr\\item\\tianziyuxi.spr><link>"
	self.szMsg						= self.szDescLink.."�������������ұ���"
	self.tbForbidWord 				= {"<item=", "<link=", "<pic=", "<color=", "<bclr=", "<enter"}
end
tbItemTianZiYuXi:init();

-- ��������ʹ�ú���
function tbItemTianZiYuXi:DeBug(nItemIndex)
	
--	self:GiveCallBack(nItemIndex);
	 
	local nBlank_1		= GetItemParam(nItemIndex, self.ParamID_Blank_1);		-- �հױ��λ
	local nBlank_2		= GetItemParam(nItemIndex, self.ParamID_Blank_2);		-- �հױ��λ
	local nOverdueDate	= GetItemParam(nItemIndex, self.ParamID_OverdueDate);	-- �����Ĺ�������
	local nUsingDate	= GetItemParam(nItemIndex, self.ParamID_UsingDate);		-- �ϴ�ʹ������������
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount);	-- �ܹ�������ʹ�õĴ���
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount);		-- ���컹����ʹ�õĴ���
	
	Msg2Player("^^^^^^^^^^^^^^^^^^^^^");
	Msg2Player("nItemIndex: "..nItemIndex);
	Msg2Player("nBlank_1: "..nBlank_1);
	Msg2Player("nBlank_2: "..nBlank_2);
	Msg2Player("nOverdueDate: "..nOverdueDate);
	Msg2Player("nUsingDate:	  "..nUsingDate);
	Msg2Player("nTotalCount:  "..nTotalCount);
	Msg2Player("nDayCount:    "..nDayCount);
	Msg2Player("^^^^^^^^^^^^^^^^^^^^^");
end

-- ʹ������
function tbItemTianZiYuXi:OnUse(nItemIndex)
	
	-- ���Ժ���
--	self:DeBug(nItemIndex);	
	
	local tbOpt 		= {}	
	local nDate 		= floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����
	local nHour 		= tonumber(GetLocalDate("%H"));							-- ��ǰСʱ
	local nOverdueDate	= GetItemParam(nItemIndex, self.ParamID_OverdueDate);	-- �����Ĺ�������
	local nUsingDate	= GetItemParam(nItemIndex, self.ParamID_UsingDate);		-- �ϴ�ʹ������������
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount);	-- �ܹ�������ʹ�õĴ���
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount);		-- ���컹����ʹ�õĴ���
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		Say("����ʹ������.")
		return 1;
	end
	
	-- ��������
	if nDate > nOverdueDate or (nDate == nOverdueDate and nHour >= 21) then
		return 0;
	end
	
	-- �µ�һ�죬����ʹ������
	if nDate ~= nUsingDate then
		nUsingDate = nDate;
		nDayCount  = self.nMaxUseDayCount;
		SetSpecItemParam(nItemIndex, self.ParamID_UsingDate, nUsingDate);
		SetSpecItemParam(nItemIndex, self.ParamID_DayCount,  nDayCount);
	end
	
	-- �ܴ�����������
	if nTotalCount <= 0 then
		tinsert(tbOpt, "�����ѻ��ǣ����ǲ����ٷ�������֮����/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return 1;
	end
	
	-- ���������������
	if nDayCount <= 0 then
		tinsert(tbOpt, "�������й�â�����ǣ���Ȼû��ʲô��Ӧ/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return 1;
	end
	
	-- ����ʹ��
	AskClientForString("SendMsg2AllServer", "", self.nMinMsgLen, self.nMaxMsgLen, "��������ʾ����?");
	return 1;
end

-- ������Ϣ
function tbItemTianZiYuXi:SendMsg2AllServer(szMsg)
	
	local tbOpt			= {}	
	local nItemIndex 	= FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	
	if (ST_CheckTextFilter(szMsg) ~= 1) then
		tinsert(tbOpt, "گ����Щ�ʲ��ף�����������./OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return
	end
	
	for i = 1, getn(self.tbForbidWord) do
		local bp = strfind(szMsg, self.tbForbidWord[i])
		if (bp ~= nil) then
			tinsert(tbOpt, "گ����Щ�ʲ��ף�����������./OnCancel")
			Describe(self.szMsg, getn(tbOpt), tbOpt);
			return
		end
	end
	
	if (nItemIndex <= 0) then
		tinsert(tbOpt, "ӵ�������������ܴ���گ��/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return
	end

	-- ����ʹ�ô���
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount) - 1;	-- �ܹ�������ʹ�õĴ���
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount) - 1;		-- ���컹����ʹ�õĴ���
	SetSpecItemParam(nItemIndex, self.ParamID_TotalCount, nTotalCount);
	SetSpecItemParam(nItemIndex, self.ParamID_DayCount, nDayCount);
	Msg2Player(format("���������컹��ʹ�� %d �Σ��ܹ�����ʹ��%d ��", nDayCount, nTotalCount));
	
	-- ������Ϣ
	AddLocalNews(format("�Ѹ�����: %s", szMsg));
	AddLocalNews(format("�Ѹ�����: %s", szMsg));
	AddLocalNews(format("�Ѹ�����: %s", szMsg));
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", format("�Ѹ�����:%s", szMsg), "", "");
	tinsert(tbOpt, "����ͻȻ����һ��������������./OnCancel")
	Describe(self.szMsg, getn(tbOpt), tbOpt);
	return
end

-- ���߹���
function tbItemTianZiYuXi:LoginMsg()
	
	local nItemIndex = FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	if (nItemIndex <= 0) then
		return
	end
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- ���Ϊӵ������
	local szMsg = format("�����ഫ��%s��������������.", GetName());
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		return 
	end	
	
	AddLocalNews(szMsg);
end

-- �л���ͼ����
function tbItemTianZiYuXi:ChangeMapMsg()
	
	-- ���ǰ����ս��ͼ
	if IsTongWarMap(SubWorld) ~= 1 then
		return
	end

	-- ��������Ƿ�ӵ������
	if	GetTaskTemp(self.TempTask_HasYuXi) ~= 1 then
		return
	end
	
	-- ����������
	if (GetCamp() == 0 or GetCurCamp == 0) then
		return 
	end	
	
	-- ʵ�ʼ���Ƿ�ӵ������
	local nItemIndex = FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	if (nItemIndex <= 0) then
		SetTaskTemp(self.TempTask_HasYuXi, 0);	-- ���Ϊû������
		return
	end
	
	local szMsg = format("�����ഫ: %s �������� %s.", GetName(), SubWorldName(SubWorld));
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "");
	
end

-- ��������
function tbItemTianZiYuXi:PickUp( nItemIndex, nPlayerIndex )
	
	local oldPlyIdx = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- ���Ϊӵ������
	NW_OwnSeal(GetName());					-- ��¼������ӵ����
	
	
	local szMsg = format("�����ഫ�� %s �񵽴�������", GetName());
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "");
	
	PlayerIndex = oldPlyIdx;
	return 1;
end

-- ��������ʱ�Ļص�������������������Ӧ�ĳ�ʼֵ
function tbItemTianZiYuXi:GiveCallBack(nItemIndex)
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- ���Ϊӵ������
	NW_OwnSeal(GetName());					-- ��¼������ӵ����
	
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����
	local nWeek = tonumber(GetLocalDate("%w"));							-- ��ǰ����
	local nHour = tonumber(GetLocalDate("%H"));							-- ��ǰСʱ
	
	-- ������
	if nWeek == 0 then
		nWeek = 7;
	end
	
	-- ����һ ��Ϊ�ϵ�һ��
	if nWeek == 1 and nHour < 21 then
		nWeek = 8;
	end
	
 	local nEndDate = floor(FormatTime2Number((8 - nWeek) * 24 * 60 *60 + GetCurServerTime())/10000);	-- ��������
	
	SetSpecItemParam(nItemIndex, self.ParamID_Blank_1, 0 );
	SetSpecItemParam(nItemIndex, self.ParamID_Blank_2, 0 );
	SetSpecItemParam(nItemIndex, self.ParamID_OverdueDate, nEndDate );
	SetSpecItemParam(nItemIndex, self.ParamID_UsingDate, nDate);
	SetSpecItemParam(nItemIndex, self.ParamID_TotalCount, self.nMaxUseTotalCount);
	SetSpecItemParam(nItemIndex, self.ParamID_DayCount, self.nMaxUseDayCount);
	
	local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
	ITEM_SetExpiredTime(nItemIndex, nExpiredDate, 120000);
	SyncItem(nItemIndex)
end




function OnCancel()	
	
end

function main(nItemIndex)
	return tbItemTianZiYuXi:OnUse(nItemIndex);
end

function IsPickable( nItemIndex, nPlayerIndex )
	
	local oldPlyIdx = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("�����ռ䲻�㣬��������������ʰȡ��")
		PlayerIndex = oldPlyIdx;
		return 0;
	end
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		Say("��������ʰȡ������")
		PlayerIndex = oldPlyIdx;
		return 0;
	end
	
	PlayerIndex = oldPlyIdx;
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	return tbItemTianZiYuXi:PickUp( nItemIndex, nPlayerIndex );
end

function SendMsg2AllServer(szMsg)
	return tbItemTianZiYuXi:SendMsg2AllServer(szMsg);
end

function LoginMsg(bExchangeIn)
	
	-- ��������ľͲ�������ʾ��
	if (bExchangeIn == 1) then
		return
	end
	
	tbItemTianZiYuXi:LoginMsg();
	return
end

function YuXiChangeMapMsg()
	return tbItemTianZiYuXi:ChangeMapMsg();
end


if login_add then login_add(LoginMsg, 2) end