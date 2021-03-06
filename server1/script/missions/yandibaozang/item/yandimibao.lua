Include("\\script\\lib\\awardtemplet.lua")

--当使用各种宝箱时，每天使用经验值的上限为5000万- Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ch骳 m鮪g cao th� <color=yellow>%s<color=green>  nh薾 頲 <color=yellow><%s><color=green> t� <color=yellow><Vi猰 д B� B秓><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbYdbz_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}

tbYdbz_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="觤 kinh nghi謒 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "Vi猰 д B� B秓")
					end,
					nRate = 52,
		},
		{szName="觤 kinh nghi謒 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "Vi猰 д B� B秓")
					end,
					nRate = 30,
		},
		{szName="觤 kinh nghi謒 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "Vi猰 д B� B秓")
					end,
					nRate = 10,
		},
		{szName="觤 kinh nghi謒 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "Vi猰 д B� B秓")
					end,
					nRate = 5,
		},
		{szName="觤 kinh nghi謒 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "Vi猰 д B� B秓")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="у Ph� Kim � Kh玦",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},
		{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},
		{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2349,1,0,0},nCount=1,nRate=2},
		{szName="у Ph� Kim � H� Gi韎",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},		
		{szName="B秓 Rng Kim � H筺g Li猲",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B秓 Rng Kim � H筺g Li猲",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B秓 Rng Kim � H筺g Li猲",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B秓 Rng Kim � H筺g Li猲",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B秓 Rng Kim � V� Kh�",tbProp={6,1,2801,1,0,0},nCount=1, nRate=0.04},		
		{szName="Ch譨 Kh鉧 Nh� �",tbProp={6,1,2311,1,0,0},nCount=1,nRate=10},
		{szName="Ch譨 Kh鉧 Nh� �",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},
		{szName="M閏 Nh﹏ L謓h",tbProp={6,1,30105,1,0,0},nCount=2,nRate=3},
		{szName="Ho祅 H錸 Кn",tbProp={6,1,2837,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
		{szName="觤 kinh nghi謒 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "Vi猰 д B� B秓")
					end,
					nRate = 30,
		},
		{szName="觤 kinh nghi謒 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "Vi猰 д B� B秓")
					end,
					nRate = 25,
		},
		{szName="觤 kinh nghi謒 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "Vi猰 д B� B秓")
					end,
					nRate = 10,
		},
		{szName="觤 kinh nghi謒 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "Vi猰 д B� B秓")
					end,
					nRate = 5,
		},
		{szName="觤 kinh nghi謒 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "Vi猰 д B� B秓")
					end,
					nRate = 3,
		},
		{szName="觤 kinh nghi謒 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "Vi猰 д B� B秓")
					end,
					nRate = 2,
		},
		{szName="觤 kinh nghi謒 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "Vi猰 д B� B秓")
					end,
					nRate = 1,
		},
		{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="T� M穘g Chi B秓 (N鉵)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},		
		{szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3211},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
		{szName="Ho祅g Kim 蕁 (Nhc h鉧)",tbProp={0,3221},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
		{szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.08},
		{szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.04},
		{szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.01},
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	local tbKey1 = tbYdbz_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbYdbz_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("需要有黄金钥匙或者如意钥匙才能打开Vi猰 д B� B秓", 1, "сng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 nh� �/#VnYdbzBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("S� d鬾g Ch譨 kh鉧 v祅g/#VnYdbzBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "сng/Oncancel")
		Say("S� d鬾g ch譨 kh鉧  m� rng:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnYdbzBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbYdbz_Key_Require[strKeyType]
	local tbAward = tbYdbz_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("需要有黄金钥匙或者如意钥匙才能打开Vi猰 д B� B秓", 1, "сng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2805, -1) ~= 1 then
		Say("找不到Vi猰 д B� B秓", 1, "сng/no")
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"YDBZ", "use yandimibao"})	
end
