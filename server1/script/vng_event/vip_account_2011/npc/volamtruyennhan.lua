Include("\\script\\vng_event\\vip_account_2011\\npc\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
if not tbVNG_VipAcc2011_VLTN then
	tbVNG_VipAcc2011_VLTN = {}
end

tbVNG_VipAcc2011_VLTN.nStartDay = 20110123
tbVNG_VipAcc2011_VLTN.nEndDay = 20120630
tbVNG_VipAcc2011_VLTN.nExtPointID = 3
--cac bit标记名单中领取如意礼包的玩家
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Tieu = 2
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Trung = 3
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Dai = 4
--cac bit 标记领取如意礼包的玩家
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Tieu2 = 6
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Trung2 = 7
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Dai2 = 8
--bit 标记每周每人只能使用一种如意礼包
tbVNG_VipAcc2011_VLTN.tbTaskInfo =
	{
		nTaskID = 2754,
		nStartBit = 12,
		nBitCount = 1,
		nMaxValue = 1
	}

function tbVNG_VipAcc2011_VLTN:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end

function tbVNG_VipAcc2011_VLTN:addDialog(tbDialog)
	if (self:isActive() ~= 1) then 
		return
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu) == 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung) == 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai) == 1) then
		tinsert(tbDialog, "Nh薾 nh� � l� bao/#tbVNG_VipAcc2011_VLTN:main()");
		--tbDialog:AddOptEntry("Nh薾 nh� � l� bao", tbVNG_VipAcc2011_VLTN.main, {tbVNG_VipAcc2011_VLTN})
	end
end

function tbVNG_VipAcc2011_VLTN:main()
	local tbMainDialog = tbVNG_Vip_NpcHead:CreateDialog()
	tbMainDialog.szTitleMsg = "N╩ m韎 an khang!"
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu) == 1 and tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu2) == 0) then
	--	tbMainDialog:AddOptEntry("Nh薾 nh� � l� bao-小", tbVNG_VipAcc2011_VLTN.GetAward, {tbVNG_VipAcc2011_VLTN, "tieu"})
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung) == 1 and tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung2) == 0) then
	--	tbMainDialog:AddOptEntry("Nh薾 nh� � l� bao-中", tbVNG_VipAcc2011_VLTN.GetAward, {tbVNG_VipAcc2011_VLTN, "trung"})
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai) == 1 and tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai2) == 0) then
		tbMainDialog:AddOptEntry("Nh薾 nh� � l� bao-大", tbVNG_VipAcc2011_VLTN.GetAward, {tbVNG_VipAcc2011_VLTN, "dai"})
	end
	tbMainDialog:Show()
end

function tbVNG_VipAcc2011_VLTN:GetAward(strItemType)
	if (CalcFreeItemCellCount() < 10) then
		Talk(1, "", "в b秓 v� t礽 s秐, xin vui l遪g ch鮝 10 � tr鑞g trong h祅h trang r錳 m韎 s� d鬾g v藅 ph萴 n祔!")
		return
	end
	local tbAward = {}
	tbVNG_BitTask_Lib:setBitTask(self.tbTaskInfo, 0)
	if strItemType == "tieu" then
		if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu2) == 0 and tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu2, 1) == 1) then
			tbAward = {szName="Nh� � L� Bao(Ti觰)",tbProp={6,1,30092,1,0,0},nCount=1,nExpiredTime=10080,nBindState = -2}			
			tbVNG_Vip_NpcHead:GiveAward(tbAward, "[VNG][VIPAcc2011][Nh薾 nh� � l� bao t筰 NPC V� L﹎ Truy襫 Nh﹏]")
			return
		end
	end
	if strItemType == "trung" then
		if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung2) == 0 and tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_NYLB_Trung2, 1) == 1) then
			tbAward = {szName="Nh� � L� Bao(Trung)",tbProp={6,1,30093,1,0,0},nCount=1,nExpiredTime=10080,nBindState = -2}
			tbVNG_Vip_NpcHead:GiveAward(tbAward, "[VNG][VIPAcc2011][Nh薾 nh� � l� bao t筰 NPC V� L﹎ Truy襫 Nh﹏]")
			return
		end
	end
	if strItemType == "dai" then
		if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai2) == 0 and tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_NYLB_Dai2, 1) == 1) then
			tbAward = {szName="Nh� � L� Bao(Чi)",tbProp={6,1,30094,1,0,0},nCount=1,nExpiredTime=10080,nBindState = -2}
			tbVNG_Vip_NpcHead:GiveAward(tbAward, "[VNG][VIPAcc2011][Nh薾 nh� � l� bao t筰 NPC V� L﹎ Truy襫 Nh﹏]")
			return
		end
	end	
end