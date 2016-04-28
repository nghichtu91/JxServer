-- 文件名　：hechengqizi.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-14 14:32:38

--10 M秐h c� 1 + 6 M秐h c� 2 + 3 M秐h c� 3 + 1 M秐h c� 4 + 3 万两	获得：1张L� C� Chi課 Th緉g
--被注：- 原料将会在玩家背包种自动扣除。

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="M秐h c� 1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="M秐h c� 2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="M秐h c� 3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="M秐h c� 4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="L� C� Chi課 Th緉g", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>从26-04-2008到24h00 18-05-2008, 打怪将搜集到旗的碎片，可以带旗的碎片到老夫这合成完整的L� C� Chi課 Th緉g.",
		format("我想合成L� C� Chi課 Th緉g/#%s:Compose()", self.szName),
		"Ta s� gh� l筰 sau/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("T骾 h祅h trang  y, h穣 d鋘 d裵 h祅h trang  b秓 m an to祅 cho v藅 ph萴.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("合成1面L� C� Chi課 Th緉g", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "礼官: 祝贺大侠已经合成完整的L� C� Chi課 Th緉g!", 0)
end