-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南 - B綾 u Ti猲 Кn
-- 文件名　：item_beidouxiandan.lua
-- 创建者　：子非魚
-- 创建时间：2009-02-26 13:30:12

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua");	-- 转生头文件
Include("\\script\\task\\task_addplayerexp.lua");			-- 加叠加经验

function main(nItemIndex)
	local nphase = GetTask(TSK_ZHUANSHENG_XIANDAN);
	
	if (nphase == 1) then
		if (ST_IsTransLife() == 1) then
			local n_itemexp = GetItemParam(nItemIndex, 1);
			if (n_itemexp > 0 and n_itemexp <= 19900) then
				tl_addPlayerExp(n_itemexp*10000000);
				
				SetTask(TSK_ZHUANSHENG_XIANDAN, 2);
				
				Msg2Player(format("Thu 頲 %d ng祅 v筺 kinh nghi謒.", n_itemexp));
				WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tUsed,LEVEL:%d,FACTION:%d,AddExp:%d0000000",
						"B綾 u Ti猲 Кn",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), n_itemexp));
			else
				return 1;
			end
		else
			Say("还未重生就不能使用B綾 u Ti猲 Кn.", 0);
			return 1;
		end
	else
		Say("该B綾 u Ti猲 Кn不是大侠的，所以不能使用.", 0);
		return 1;
	end
end

function GetDesc(nItemIndex)
	local n_itemexp = GetItemParam(nItemIndex, 1);
	return format("Trong Ti猲 Кn c� : %d ng祅 v筺 kinh nghi謒.", n_itemexp);
end
