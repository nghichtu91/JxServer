Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelRepairScale = {}
aLevelRepairLevel = {}
aLevelEnhanceAdd = {}
aLevelContributionCoef = {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\tiangong_level_data.txt", "tiangongLevelData")
	if b1~=1 then
		print("тc t謕 config Thi猲 c玭g phng th蕋 b筰!")
		return
	end
	local nRowCount = TabFile_GetRowCount("tiangongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("tiangongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "OUTPUT_COEF"))
		aLevelRepairScale[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_SCALE"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "CONTRIBUTION_COEF"))
		aLevelRepairLevel[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_LEVEL"))
		aLevelEnhanceAdd[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "ENHANCE_ADD"))
	end
	--TabFile_UnLoad("tiangongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "T鎛g qu秐 Thi猲 c玭g phng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"S鯽 th玭g thng/#repair_ok1".."("..nTongID..","..nWorkshopID..")",
		"s鯽 gia c�/#repair_ok2".."("..nTongID..","..nWorkshopID..")",
		"Nh薾 頲 t骾  ngh�/#use_xiulibao("..nTongID..","..nWorkshopID..")",
		"Kh玭g c莕 u/cancel"
	}
	Say("<#>T鎛g qu秐 Thi猲 c玭g phng:正如好马需配好鞍，好的兵甲神器自然也需巧夺天工之手来维护！", getn(aryszContent), aryszContent);
	return 1;
end

--------------------------------------------------------------------------------------------
VALUE_XIULIBAO_CONTRIBUTION = 50	--紫金镐需要的个人贡献度
function use_xiulibao(nTongID, nWorkshopID)
	Say("T鎛g qu秐 Thi猲 c玭g phng:出来行走江湖，装备总是会经常坏吧？现在你只要买一个修理包，无需回城，在你想修理装备的时候只要使用修理包便可以像在店里一样修理装备了。当然你修理装备时所耗的材料钱也还是要付的。一个修理包可以使用一个星期的时间，而只需要花费<color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color> 甶觤 c鑞g hi課  i, ngi c� ng � kh玭g?", 3,
	"фi 1 t骾  ngh�/#tg_sure2xiulibao("..nTongID..","..nWorkshopID..")",
	"T骾  ngh� l� g�?/tg_helpxiulibao",
	"Ta bi誸 r錳/cancel")
end

function tg_helpxiulibao()
	Say("T鎛g qu秐 Thi猲 c玭g phng:修理包可以让你随时随地的修理装备，只要右键甶觤击使用便可以像在店子里一样修理装备；但要注意的是你依然要付修理费。一个修理包可以使用一个星期，时间从你购买开始计算，所以一次买很多的话也是没有用的，一个星期只要买一个就好了。", 0)
end

function tg_sure2xiulibao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>Th藅 ng ti誧, Thi猲 c玭g phng 產ng t筸 ng鮪g ho箃 ng. Ng﹏ s竎h chi課 b� c莕 t╪g  chi ph� b秓 tr� h祅g tu莕, th� 12h m c飊g ng祔 T竎 phng m韎 ho箃 ng tr� l筰.", 0)
		Msg2Player("T竎 phng 產ng t筸 ng鮪g ho箃 ng.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>Ngi ch璦 gia nh藀 bang, t譵 n ta c� vi謈 g�?", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--获得使用等级
	if (nUseLevel < 4) then
		Say("<#>Ъng c蕄 s� d鬾g Thi猲 c玭g phng ch璦  c蕄 4, kh玭g th� nh薾 頲 bang v藅.", 0)
		Msg2Player("Ъng c蕄 s� d鬾g t竎 phng ch璦  c蕄 4, kh玭g th� s� d鬾g ch鴆 n╪g n祔.kh玭g th� s� d鬾g ch鴆 n╪g n祔")
		return
	end
	if (GetContribution() < VALUE_XIULIBAO_CONTRIBUTION or AddContribution(-VALUE_XIULIBAO_CONTRIBUTION) ~= 1)then
		Say("Th藅 ng ti誧, 甶觤 c鑞g hi課 kh玭g  <color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color> 甶觤, kh玭g th� i l蕐 bang v藅.", 0)
		Msg2Player("觤 c鑞g hi課 c� nh﹏ kh玭g , kh玭g th� s� d鬾g ch鴆 n╪g n祔.")
		return 0
	end
	local nItemIndex = AddItem(6,1,1084,1,1,0);
	local nTime = GetCurServerTime() + 7 * 24 * 60 * 60;
	local nDate = FormatTime2Number(nTime);
	local nYear = floor(nDate/100000000);
	local nMMDD = floor( mod(nDate, 100000000) / 10000 );
	local nHour = floor( mod(nDate, 10000) / 100 );
	SetSpecItemParam(nItemIndex, 1, nTime);
	SetSpecItemParam(nItemIndex, 2, nYear);
	SetSpecItemParam(nItemIndex, 3, nMMDD);
	SetSpecItemParam(nItemIndex, 4, nHour);
	SyncItem(nItemIndex);
	Msg2Player("фi 頲 1 T骾  ngh�, th阨 gian s� d鬾g c遪 l筰 l� 7 ng祔.")
	Say("фi 頲 1 T骾  ngh�, th阨 gian s� d鬾g c遪 l筰 l� 7 ng祔.", 0)
end
--------
function MAINTAIN_R(nTongID, nWorkshopID) --日常天工
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --初始化日产出价值量
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
		return 0
	end
	return 1
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function repair_ok1(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function repair_ok2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:今天太忙了，不能给你强化修理，请明天再来吧！", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 2)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..","..nWorkshopID..","..nUse..")")
end

function CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>T鎛g qu秐 Thi猲 c玭g phng:目前等级的天工坊尚不能修理这种装备。", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>T鎛g qu秐 Thi猲 c玭g phng:目前等级的天工坊尚不能修理这种装备。", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:白金装备不能修理.", 0)
		return
	end
		
	-- 黄金装备修理价格公式调整为:100*(装备等级^2)/每甶觤耐久度	
	if (quality == 1)then
		local nItemLevel = GetItemLevel(nItemIdx);
		--每耐久度的价格
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur * aLevelRepairScale[nLevel]/100;
		local nCostlyPrice = nCheapPrice * 3; -- 简修的三倍
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("T鎛g qu秐 Thi猲 c玭g phng:<#>", 3, "S鯽 k�: "..nCostlyPrice.." lng, ti猽 hao 甶觤 c鑞g hi課:  "..(nCostContribution*3).."甶觤/#Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..(nCostContribution*3)..")", 
		"S鯽 n gi秐: "..nCheapPrice.." lng, ti猽 hao 甶觤 c鑞g hi課:  "..nCostContribution.." 甶觤,  b襫 gi秏 "..nLostDur.."甶觤/#Cheap_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCheapPrice..","..nCostContribution..")", "Kh玭g c莕 u/cancel")
		return	
	end
	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>T鎛g qu秐 Thi猲 c玭g phng:修理此装备需花费:"..nCostlyPrice.." lng, ti猽 hao 甶觤 c鑞g hi課:  <color=yellow>"..nCostContribution.."<color> 甶觤, ngi ng � kh玭g?", 2, "S鯽 ch鱝/#TG_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..nCostContribution..")", "Kh玭g c莕 u/cancel")
end

function EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nCurDur = GetCurDurability(nItemIdx)
	local nFixDur = nMaxDur - nCurDur
	_dbgMsg("Gi� tr� lng c遪 l筰"..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0)then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:今天实在忙累了，不能再给你强化修理，请明天再来吧！", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>T鎛g qu秐 Thi猲 c玭g phng:目前等级的天工坊尚不能修理这种装备。", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>T鎛g qu秐 Thi猲 c玭g phng:目前等级的天工坊尚不能修理这种装备。", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:白金装备不能修理.", 0)
		return
	end
	
	local nDurPrice = GetRepairDurPrice(nItemIdx);
	--强化修理加成的价值
	if (nPrice < 0)then
		nPrice = 0
	end
	local nDstDur = floor(nMaxDur * (1+aLevelEnhanceAdd[nLevel]/100))
	if (nDstDur > 255) then
		nDstDur = 255;
	end
	if (nCurDur > nMaxDur)then
		nFixDur = floor(nDstDur - nCurDur)
	else
		nFixDur = floor(nDstDur - nMaxDur)
	end
	if (nFixDur <= 0)then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:此装备已不需再强化了！", 0)
		return
	end	
	local nEnhancePrice = nDurPrice * nFixDur * 1.5
	nPrice = nPrice + nEnhancePrice
	-- 黄金装备修理价格公式调整为:100*(装备等级^2)/每甶觤耐久度	
	if (quality == 1)then
		nFixDur = nMaxDur - nCurDur
		if (nFixDur < 0)then
			nFixDur = 0
		end
--		if (GetOrgMaxDurability(nItemIdx) ~= nMaxDur)then
--			Say("<#>T鎛g qu秐 Thi猲 c玭g phng:最大耐久度有损失的装备不能强化修理！")
--			return
--		end
		local nItemLevel = GetItemLevel(nItemIdx);
		--每耐久度的价格
		local nDurPrice = 100 * nItemLevel * nItemLevel
		--普通修理应需价格
		local nCheapPrice = nDurPrice * nFixDur;
		--强化修理
		if (nCurDur > nMaxDur)then
			nFixDur = floor(nDstDur - nCurDur)
		else
			nFixDur = floor(nDstDur - nMaxDur)
		end	
		if (nFixDur <= 0)then
			Say("<#>T鎛g qu秐 Thi猲 c玭g phng:此装备已不需再强化了！", 0)
			return
		end	
		--加上强化所需价格
		local nEnhancePrice = nDurPrice * nFixDur * 1.5
		--强化修理都按精修的价格算	
		nEnhancePrice = nEnhancePrice*3	
		--总价
		nCheapPrice = nCheapPrice *3 + nEnhancePrice
		--打折后
		local nPayPrice = floor(nCheapPrice * aLevelRepairScale[nLevel]/100)
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:强化修理此装备需花费:"..nPayPrice.." lng, ti猽 hao 甶觤 c鑞g hi課:  <color=yellow>"..nCostContribution..
		"<color> 甶觤, sau khi gia c�,  b襫 c馻 trang b� l� "..nDstDur, 2, "S鯽 ch鱝/#EH_Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nPayPrice..
				","..nCostContribution..","..nEnhancePrice..")", "Kh玭g c莕 u/cancel")
		return	
	end	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>T鎛g qu秐 Thi猲 c玭g phng:强化修理此装备需花费:"..nCostlyPrice.." lng, ti猽 hao 甶觤 c鑞g hi課:  <color=yellow>"..nCostContribution.."<color> 甶觤, sau khi gia c�,  b襫 c馻 trang b� l� "..nDstDur, 2, "S鯽 ch鱝/#Enhance_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..
			","..nCostContribution..","..nEnhancePrice..")", "Kh玭g c莕 u/cancel")
end

function RepairCallBack(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	elseif (nUse == 2)then
		EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	end
end

function TG_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	if (GetCash() < nCostPrice) then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的银两不足，备齐银子再来吧！", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的贡献度不足，要使用帮会设施，当然要对帮会有贡献才行！", 0)
		return
	end
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
	--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
end

function Enhance_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	if (GetCash() < nCostPrice) then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的银两不足，备齐银子再来吧！", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的贡献度不足，要使用帮会设施，当然要对帮会有贡献才行！", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	EH_SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx) * (1+aLevelEnhanceAdd[nLevel]/100))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
end
--精修
function Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的贡献度不足，要使用帮会设施，当然要对帮会有贡献才行！", 0)
		return
	end
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("修复装备！")
		SetCurDurability(nItemIdx, nCurMaxDur)
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d鬾g ("..nCostPrice..") lng, ("..nCostContribution..") 甶觤 c鑞g hi課, s鯽 k� trang b� Ho祅g Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的银两不足，备齐银子再来吧！", 0)
		return
	end
end
--简修
function Cheap_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的贡献度不足，要使用帮会设施，当然要对帮会有贡献才行！", 0)
		return
	end
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		AddContribution(-nCostContribution)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d鬾g ("..nCostPrice..") lng, "..nCostContribution.." 甶觤 c鑞g hi課, s鯽 n gi秐 trang b� Ho祅g Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nFixMaxDur..") ,  b襫 l韓 nh蕋 gi秏 xu鑞g, "..nLostDur.."甶觤");
	else
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的银两不足，备齐银子再来吧！", 0)
		return
	end
end
--强化精修
function EH_Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的贡献度不足，要使用帮会设施，当然要对帮会有贡献才行！", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("修复装备！")
		EH_SetCurDurability(nItemIdx, nCurMaxDur* (1+aLevelEnhanceAdd[nLevel]/100))
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d鬾g ("..nCostPrice..") lng, ("..nCostContribution..")甶觤贡献度，强化精修黄金装备(ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>T鎛g qu秐 Thi猲 c玭g phng:你的银两不足，备齐银子再来吧！", 0)
		return
	end
end

function cancel()
end

else
-----------------如果是客户端---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh玭g c� bang h閕"	
	end
	local bOpen	--是否开启
	local bPause --是否暂停
	local nCurLevel --当前等级
	local nUseLevel --当前使用等级
	local nOpenFund --当前开启消耗
	local nMaintainFund --当前维护消耗
	local nScale  --当前维修装备打折数
	local dAdvanceRepairCount	--当前每日强化修理总量提高
	local nAdvanceEnhance --当前强化修理耐久度超过上限的百分比
	local szRepairKind --当前可维修的装备品种
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelRepairScale[nUseLevel] / 10)
			dAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])
			nAdvanceEnhance = aLevelEnhanceAdd[nUseLevel]
			if(aLevelRepairLevel[nUseLevel] == 1) then
				szRepairKind = "<color=white>Trang b� tr緉g<color>, <color=water>trang b� xanh<color>"
			elseif(aLevelRepairLevel[nUseLevel] == 2) then
				szRepairKind = "<color=white>Trang b� tr緉g<color>, <color=water>trang b� xanh<color>、<color=Violet>紫装<color>"
			else
				szRepairKind = "<color=white>Trang b� tr緉g<color>, <color=water>trang b� xanh<color>、<color=Violet>紫装<color>、<color=gold>黄金装备<color>"
			end
		else
			nScale = "--"
			dAdvanceRepairCount = "--"
			nAdvanceEnhance = "--"
			szRepairKind = "--"
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextAdvanceRepairCount,nNextAdvanceEnhance,szNextRepairKind
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then		
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		nNextScale = format("%.1f",aLevelRepairScale[nUseLevel + 1] / 10) --下级维修装备打折数
		dNextAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --下级每日强化修理总量提高
		nNextAdvanceEnhance = aLevelEnhanceAdd[nUseLevel + 1]
		if(aLevelRepairLevel[nUseLevel + 1] == 1) then
			szNextRepairKind = "<color=white>Trang b� tr緉g<color>, <color=water>trang b� xanh<color>"
		elseif(aLevelRepairLevel[nUseLevel + 1] == 2) then
			szNextRepairKind = "<color=white>Trang b� tr緉g<color>, <color=water>trang b� xanh<color>、<color=Violet>紫装<color>"
		else
			szNextRepairKind = "<color=white>Trang b� tr緉g<color>, <color=water>trang b� xanh<color>、<color=Violet>紫装<color>、<color=gold>黄金装备<color>"
		end
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextAdvanceRepairCount = "--"
		szNextRepairKind = "<color=Violet>--<color>"
		nNextAdvanceEnhance = "--"
	end
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T筸 ng鮪g" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>сng c鯽" end
		local szMsg = "作坊状态:"..state.."<color>\n"..
			"作坊等级:<color=gold>"..nCurLevel.."<color>\n"..
			"当前使用等级:<color=gold>"..nUseLevel.."<color>\n"..
			"可维修的装备种类:"..szRepairKind.."\n"..
			"维修装备优惠度:<color=gold>"..nScale.."<color> ph莕 tr╩\n"..
			"强化修理耐久度超过上限:<color=gold>"..nAdvanceEnhance.."%<color>\n"..
			"每天强化修理总量提高:<color=gold>"..dAdvanceRepairCount.."<color> l莕\n"..		
			"每日维护消耗战备基金:<color=gold>"..nMaintainFund.." v筺<color>\n"..
			"开启所需建设基金:<color=gold>"..nOpenFund.." v筺<color>\n"..
			"升级所需建设基金:<color=gold>"..nUpgradeCostFund.." v筺<color>\n"..
			"<color=green>Ъng c蕄 s� d鬾g k� ti誴 <color>\n"..
			"<color=water>可维修的装备种类:"..szNextRepairKind.."\n"..
			"维修装备优惠度:<color=Violet>"..nNextScale.."<color> ph莕 tr╩\n"..
			"强化修理耐久度超过上限:<color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"每天强化修理总量提高:<color=Violet>"..dNextAdvanceRepairCount.."<color> l莕\n"..	
			"每日维护消耗战备基金:<color=Violet>"..nNextMaintainFund.." v筺<color>\n"..
			"开启所需建设基金:<color=Violet>"..nNextOpenFund.." v筺<color>\n"
		return szMsg
	else
		local szMsg = "作坊状态:<color=water>未建立<color>\n"..
			"建立所需建设基金:<color=gold>"..nUpgradeCostFund.." v筺<color>\n"..
			"<color=green>Ъng c蕄 k� ti誴 <color>\n"..
			"<color=water>可维修的装备种类:"..szNextRepairKind.."\n"..
			"维修装备优惠度:<color=Violet>"..nNextScale.."<color> ph莕 tr╩\n"..
			"强化修理耐久度超过上限:<color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"每天强化修理总量提高:<color=Violet>"..dNextAdvanceRepairCount.."<color> l莕\n"..	
			"每日维护消耗战备基金:<color=Violet>"..nNextMaintainFund.." v筺<color>\n"..
			"开启所需建设基金:<color=Violet>"..nNextOpenFund.." v筺<color>\n"
		return szMsg
	end
end

end