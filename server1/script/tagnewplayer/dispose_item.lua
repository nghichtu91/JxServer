function DisposeItem()
	GiveItemUI("H駓 v藅 ph萴", "H駓 v藅 ph萴时，大侠要小心!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "M鏸 l莕 ch� c� th� h駓 頲 m閠 v藅 ph萴!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState ~= -2) then
		Talk(1, "", "V藅 ph萴 c莕 h駓 ph秈 l� v藅 ph萴 kh鉧 v躰h vi詎!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "Чi hi謕 c� th� s緋 x誴 l筰 rng ch鴄  r錳!");
	Msg2Player("大侠刚刚H駓 v藅 ph萴成功")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." H駓 item ABHKLB "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
end

function OnCancel()

end

