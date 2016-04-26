Include("\\script\\vng_event\\20110225_8_thang_3\\item\\item_head.lua")
tbVNGWD2011_GiftBox = {}
tbVNGWD2011_GiftBox.nTaskLimitUse = 2748
tbVNGWD2011_GiftBox.nMaxExp = 3e9	
function main(itemidx)
	if (tbVNGWD2011_ItemHead:isExpired(itemidx) == 1 or tbVNG_WomenDay2011:IsActive() ~= 1) then
		Msg2Player("��Ʒ��ʹ���ڣ��Զ���ʧ.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNGWD2011_GiftBox:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end		
end

function tbVNGWD2011_GiftBox:UseItem()
	if tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 0, "�㲻������ʹ����Ʒ��Ҫ��150���������ѳ�ֵ "
	end
	
	if tbVNGWD2011_ItemHead:checkBag(10) ~= 1 then
		return 0, "Ϊ�����Ʋ���������10��װ����λ����ʹ�ø���Ʒ!"
	end		
	local nTaskVal = GetTask(self.nTaskLimitUse)
	if nTaskVal >= (self.nMaxExp/1e6) then
		return 0, "������ʹ�������Ʒ��������ʹ��"
	end
	SetTask(self.nTaskLimitUse, nTaskVal + 15)	
	self:AddExtraAwardDialog()
	local tbExpAward =  {szName = "����ֵ", nExp=15000000}
	local tbItemAward = 
		{
			{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="������",tbProp={6,1,2352,1,0,0},nCount=1,nRate=0.2},
			{szName="��Գ��",tbProp={6,1,2351,1,0,0},nCount=1,nRate=2},
			{szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
			{szName="���������",tbProp={6,1,2520,1,0,0},nCount=2,nRate=14},
			{szName="���������",tbProp={6,1,2517,1,0,0},nCount=2,nRate=14},
			{szName="�س��� (��)",tbProp={6,1,1083,1,0,0},nCount=1,nRate=4},
			{szName="���з�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},
			{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=2,nRate=14.5},
			{szName="�ν��б���",tbProp={6,1,30083,1,0,0},nCount=2,nRate=5,nExpiredTime=10080},
			{szName="�ν��б����",tbProp={6,1,30084,1,0,0},nCount=1,nRate=4,nExpiredTime=10080},
			{szName="Į��������",tbProp={6,1,1448,1,0,0},nCount=2,nRate=12},
			{szName="������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=7},
			{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nCount=1,nRate=7},
			{szName="�׾���",tbProp={6,1,74,1,0,0},nCount=1,nRate=5},
			{szName="��Ч�׾���",tbProp={6,1,1157,1,0,0},nCount=1,nRate=3},
			{szName="һ��Ǭ����",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
			{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=4},
		}
	if tbExpAward and tbItemAward then
		tbAwardTemplet:GiveAwardByList(tbExpAward, "[VNG][8thang3][3��8��ʹ����о��齱��]")
		tbAwardTemplet:GiveAwardByList(tbItemAward, "[VNG][8thang3][3��8��ʹ�����Ttem����]")
	end
	return 1
end

function tbVNGWD2011_GiftBox:AddExtraAwardDialog()
	local nItemUsed = GetTask(self.nTaskLimitUse) / 15
	local tbTSK, tbTSK_FLAG = {}
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (nItemUsed >= 50 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (nItemUsed >= 100 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (nItemUsed >= 150 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (nItemUsed >= 200 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
end