-- 文件名　：lingjiang.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-14 14:34:01

-- 把Thi誸 Ng璾 Lang Nha B閕到各新手村的礼官NPC 出兑换奖励。
-- 奖励包括：一张Ng﹏ phi誹 chi課 b�+1个8玄晶+下面物品列表中的随机一个

Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_mieshanzei = {}

jiefang_0804_mieshanzei.szName = "jiefang_0804_mieshanzei"

jiefang_0804_mieshanzei.tbRecipe = 
{
	tbItemList = 
	{
		{szName="Thi誸 Ng璾 Lang Nha B閕", tbProp={6, 1, 1733}, nCount = 1},		
	},
	nMoney = 0,
	tbAwardItem = 
	{
		[1] = {szName="Ng﹏ phi誹 chi課 b�", tbProp={6, 1, 1732, 1, 0, 0}, nExpiredTime = 20090111},
		[2] = {szName="Huy襫 tinh kho竛g th筩h c蕄 8", tbProp={6, 1, 147, 8, 0, 0}},
		[3] = {
			{szName="чng S竧 B筩h Kim 猽 Long Gi韎", nQuality=1, tbProp={0, 143},nRate = 25},
			{szName="чng S竧 B筩h Ng鋍 C祅 Kh玭 B閕", nQuality=1, tbProp={0, 144},nRate = 25},
                     {szName="чng S竧 B筩h Kim T� Ph鬾g Gi韎", nQuality=1, tbProp={0, 145},nRate = 25},
			{szName="чng S竧 Ph� Th髖 Ng鋍 H筺g Khuy猲", nQuality=1, tbProp={0, 146},nRate = 25},
		}
	},
}

function jiefang_0804_mieshanzei:main()
	local tbSay = 
	{
		"<dec><npc>今日，一批山贼常常到村镇去骚扰百姓，情况日益严重，各位大侠出力赶走山贼. 有机会捡到<color=yellow>Thi誸 Ng璾 Lang Nha B閕<color> 在山贼身上, 此外老夫还有厚礼相赠.",
		format("我捡到Thi誸 Ng璾 Lang Nha B閕/#%s:Compose()", self.szName),
		"K誸 th骳 i tho筰/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_mieshanzei:Compose()
	local szMsg = "Чi hi謕 xin h穣 nhanh ch鉵g tham gia i ng� ti猽 di謙 s琻 t芻?"
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose(szMsg, tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "Чi hi謕  c� th祅h t輈h r蕋 xu蕋 s綾 trong vi謈 nh 畊鎖 s琻 t芻, xin h穣 nh薾 l蕐 ph莕 thng n祔?", 0)
end
