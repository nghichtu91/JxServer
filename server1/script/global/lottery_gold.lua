-- 幸运彩票
-- Fanghao Wu
-- 2004.11.13

LOTTERY_GOLD_TYPENAME = "lottery_gold";	-- 彩票名，对应\settings\lotterys.txt的LOTTERY_NAME
EXTPOINT_LOTTERY_GOLD = 3;				-- 领取彩票判断的扩展点的编号
MONTH_CARD_EXTPOINT_COST = 2;			-- 充一张月卡等价的扩展点数
WEEK_CARD_EXTPOINT_COST = 1;			-- 充一张周卡等价的扩展点数
MONTH_CARD_LOTTERY_ID_COUNT = 10;		-- 月卡换取的彩票包含的号码数
WEEK_CARD_LOTTERY_ID_COUNT = 5;			-- 周卡换取的彩票包含的号码数


--	奖品设置格式为：	 {
--						" ph莕 thng mi猽 t� ",
--						{
--							{ 候选奖品1名称, { 候选奖品1参数 }, 候选奖品1个数, 候选奖品1抽中概数 },
--							...
--						}
--					 }
--	Th� 1期 （2004.11.22 - 2004.11.28）--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							" an bang chi b╪g tinh th筩h gi﹜ chuy襫 1 con ",
--							{ { " an bang chi b╪g tinh th筩h gi﹜ chuy襫 ", { 4, 2549, 0, 164 }, 1, 1 }, }
--						};
--	SECOND_PRIZE_AWARD = {
--							" v� l﹎ b� t辌h 1 v鑞 ",
--							{ { " v� l﹎ b� t辌h ", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							" ti猲 th秓 l� 10 c� ",
--							{ { " ti猲 th秓 l� ", { 6, 1, 71, 1, 0, 0, 0 }, 10, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							" ti猲 th秓 l� 2个",
--							{ { " ti猲 th秓 l� ", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 }, }
--						 };
--	Th� 2期 （2004.11.28 - 2004.12.05）--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							" nh nc h� li謙 ho祅g kim trang b� ng蓇 nhi猲 1 m鉵 ",
--							{
--								{ " nh qu鑓 chi l鬭 m醤g xanh trng sam ", { 0, 159 }, 1, 1 },
--								{ " nh qu鑓 chi � sa ph竧 quan ", { 0, 160 }, 1, 1 },
--								{ " nh qu鑓 chi x輈h quy猲 m襪 ngoa ", { 0, 161 }, 1, 1 },
--								{ " nh qu鑓 chi t� ng h� c� tay ", { 0, 162 }, 1, 1 },
--								{ " nh qu鑓 chi ng﹏ t祄 產i l璶g ", { 0, 163 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							" v� l﹎ b� t辌h 1 v鑞 ",
--							{
--								{ " v� l﹎ b� t辌h ", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--							}
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							" th駓 tinh ho芻  th緈 b秓 th筩h 1 c� ",
--							{
--								{ " lan th駓 tinh ", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " t� th駓 tinh ", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " nc bi誧 tinh ", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "  th緈 b秓 th筩h ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							" ti猲 th秓 l� 2个",
--							{
--								{ " ti猲 th秓 l� ", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };
--	Th� 3期 （2004.12.05 - 2004.12.12）--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							" k� nghi謕 chi s蕀 nh chui long s髇g 1 甧m ",
--							{
--								{ " k� nghi謕 chi s蕀 nh chui long s髇g ", { 0, 21 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							" nh qu鑓 an bang ho祅g kim trang b� 1 m鉵 ",
--							{
--								{ " nh qu鑓 chi l鬭 m醤g xanh trng sam ", { 0, 159 }, 1, 10 },
--								{ " nh qu鑓 chi � sa ph竧 quan ", { 0, 160 }, 1, 8 },
--								{ " nh qu鑓 chi x輈h quy猲 m襪 ngoa ", { 0, 161 }, 1, 14 },
--								{ " nh qu鑓 chi t� ng h� c� tay ", { 0, 162 }, 1, 12 },
--								{ " nh qu鑓 chi ng﹏ t祄 產i l璶g ", { 0, 163 }, 1, 14 },
--								{ " an bang chi b╪g tinh th筩h gi﹜ chuy襫 ", { 0, 164 }, 1, 8 },
--								{ " an bang chi hoa c骳 th筩h chi誧 nh蒼 ", { 0, 165 }, 1, 12 },
--								{ " an bang chi 甶襫 ho祅g th筩h ng鋍 b閕 ", { 0, 166 }, 1, 12 },
--								{ " an bang chi m竨 g� th筩h chi誧 nh蒼 ", { 0, 167 }, 1, 10 },
--							}
--					 };
--	OTHER_PRIZE_AWARD1 = {
--							" th駓 tinh ho芻  th緈 b秓 th筩h 1 c� ",
--							{
--								{ " lan th駓 tinh ", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " t� th駓 tinh ", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ " nc bi誧 tinh ", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "  th緈 b秓 th筩h ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--								" ti猲 th秓 l� 2个",
--							{
--								{ " ti猲 th秓 l� ", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };


--	Th� 5期 （2004.12.27 - 2005.01.02）--------------------------------------------------------
--FIRST_PRIZE_AWARD = {
--						" c竎 m玭 ph竔 i ho祅g kim trang b� ng蓇 nhi猲 m閠 m鉵 ",
--						{
--							{ " ma ho祅g chi theo nh� ra h� h筺g v遪g ", { 0, 107 }, 1, 1 },
--							{ " c飊g phong chi ba thanh ph� ", { 0, 122 }, 1, 1 },
--							{ " v� y觤 chi t緈 gi鑞g ng鋍 tr� ", { 0, 39 }, 1, 1 },
--							{ " ng s竧 chi b筩h ng鋍 c祅 kh玭 b閕 ", { 0, 144 }, 1, 1 },
--							{ " c飊g th� chi h祅g long c竔 y ", { 0, 92 }, 1, 1 },
--							{ " u l玭g chi m鵦 chu m襪 l� ", { 0, 60 }, 1, 1 },
--						}
--					};
--SECOND_PRIZE_AWARD = {
--						" v� l﹎ b� t辌h 1 v鑞 ",
--						{
--							{ " v� l﹎ b� t辌h ", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--						}
--					 };
--OTHER_PRIZE_AWARD1 = {
--						" th駓 tinh ho芻  th緈 b秓 th筩h 1 c� ",
--						{
--							{ " lan th駓 tinh ", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ " t� th駓 tinh ", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ " nc bi誧 tinh ", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "  th緈 b秓 th筩h ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--						}			
--					 };
--OTHER_PRIZE_AWARD2 = {
--						" ti猲 th秓 l� 3个",
--						{
--							{ " ti猲 th秓 l� ", { 6, 1, 71, 1, 0, 0, 0 }, 3, 1 },
--						}
--					 };
					 

--Th� 6期(2005.01.02 - 2005.01.09)
FIRST_PRIZE_AWARD = {
						" an bang chi b╪g tinh th筩h gi﹜ chuy襫 1 con ",
						{ 
							{ " an bang chi b╪g tinh th筩h gi﹜ chuy襫 ", { 0, 164 }, 1, 1 }, 
						}
					};
SECOND_PRIZE_AWARD = {
						" T葃 T駓 Kinh 1 v鑞 ",
						{
							{ " T葃 T駓 Kinh ", { 6, 1, 22, 1, 0, 0, 0 }, 1, 1 },
						}
					 };
OTHER_PRIZE_AWARD1 = {
						" r� r祅g c﹗ ho祅 3 c� ",
						{
							{ " r� r祅g c﹗ ho祅 ", { 6, 1, 130, 1, 0, 0, 0 }, 3, 1 },
						}			
					 };
OTHER_PRIZE_AWARD2 = {
						" r� r祅g c﹗ ho祅 1个",
						{
							{ " r� r祅g c﹗ ho祅 ", { 6, 1, 130, 1, 0, 0, 0 }, 1, 1 },
						}
					 };

-- 幸运彩票菜单项
function onLotteryGold()
	Say( " l� quan  ng礽 kh醗 , v� h錳 b竜 ng礽 i v韎 ch髇g ta l鵦 m筺h 駈g h� , v鈔g ki誱 t� 2004 n╩ 11 th竛g 22 ng祔 kh雐 y ra may m緉 v� s� ho箃 ng . th玭g qua m鏸 ch� nh藅 ch khai tng , ng礽 甧m t 頲 ch髇g ta a ra ch c竎 lo筰 phong ph� ph莕 thng . n誹 nh� ng礽 kh玭g h� r� r祅g a phng , c� th� t� duy謙 v鑞 th鵦 n trung li猲 quan t韎 may m緉 v� s� ch gi秈 th輈h c苙 k� . ", 5, "Nh薾 l蕐 may m緉 v� s� /onLotteryGold_Gain", "May m緉 v� s� i tng /onLotteryGold_Prize", "Tu莕 tra trung tng d穣 s� /onLotteryGold_QueryPrize", " li猲 quan t韎 may m緉 v� s� /onLotteryGold_About", "Ta ch糿g qua l� t韎 甶 d筼 m閠 ch髏 /onCancel" );
end

-- 非扬州的礼官的对话
function onLotteryGoldEx()
	Say( " l� quan  ng礽 kh醗 , v� h錳 b竜 ng礽 i v韎 ch髇g ta l鵦 m筺h 駈g h� , v鈔g ki誱 t� 2004 n╩ 11 th竛g 22 ng祔 kh雐 y ra may m緉 v� s� ho箃 ng . th玭g qua m鏸 ch� nh藅 ch khai tng , ng礽 甧m t 頲 ch髇g ta a ra ch c竎 lo筰 phong ph� ph莕 thng , n祔 ho箃 ng ch� gi韎 h筺 � � <color=red> Dng Ch﹗ <color> ch l� quan ch� ti課 h祅h . ",0);
end

-- 领取幸运彩票
function onLotteryGold_Gain()

	Say( " l� quan  v鑞 k� v� s� ch� m閠 ch髏 ph竧 頲 , ph竧 頲 th阨 gian xin/m阨 ng礽 nhi襲 h琻 ch� � . ", 1, "Ta bi誸 , c竚 琻 /main" );
	do return end
	
	local nWeekDay = tonumber( date( "%w" ) );
	local nHour = tonumber( date( "%H" ) );
	if( nWeekDay == 0 and nHour >= 8 and nHour < 11 ) then
		Say( " l� quan  r蕋 xin l鏸 , m鏸 tu莕 ng祔 800 t韎 1100 trong l骳 s� sung t筽 kh玭g c竎h n祇 i l蕐 v� s� , ho箃 ng t� l� xin/m阨 tra x衪 � li猲 quan t韎 may m緉 v� s� � , 產 t� h頿 t竎 . ", 1, "Ta bi誸 , c竚 琻 /onLotteryGold" );
		do return end
	end
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	local szSayContent = "";
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		szSayContent = "<> l� quan  ng礽 c� th� nh薾 l蕐 ";
		if( nMonthCardCount > 0 ) then
			szSayContent = szSayContent.." <color=yellow>"..nMonthCardCount.."<><color> t� 10 ng蓇 nhi猲 d穣 s� ch b�/v� phi誹 ";
		end
		if( nWeekCardCount > 0 ) then
			if( nMonthCardCount > 0 ) then
				szSayContent = szSayContent.."<> c飊g ";
			end
			szSayContent = szSayContent.." <color=yellow>"..nWeekCardCount.."<><color> t� 5 ng蓇 nhi猲 d穣 s� ch b�/v� phi誹 ";
		end
		szSayContent = szSayContent.."<> , xin/m阨 s鯽 sang l筰 h秓 ng礽 ch t骾 甧o l璶g , b秓 m c� y  kh玭g gian  a v� s� , kh玭g n猲  cho ngi kh竎 lm ti謓 nghi nga . ";
		if( nMonthCardCount + nWeekCardCount > 10 ) then
			Say( szSayContent, 4, "T骾 甧o l璶g tr鑞g kh玭g kia , ta to祅 b� v� s� m閠 kh鑙 l躰h 甶 /onLotteryGold_Gain_All", "T骾 甧o l璶g kh玭g gian kh玭g ph秈 l� r蕋  , ta trc ch� d蒼 10 t� v� s� 甶 /onLotteryGold_Gain_10", "T骾 甧o l璶g kh玭g gian kh玭g ph秈 l� r蕋  , ta trc ch� d蒼 1 t� v� s� 甶 /onLotteryGold_Gain_1", "Ta n鱝 s鯽 sang m閠 ch髏 t骾 甧o l璶g 甶 /onCancel" );
		else
			Say( szSayContent, 3, "T骾 甧o l璶g tr鑞g kh玭g kia , ta to祅 b� v� s� m閠 kh鑙 l躰h 甶 /onLotteryGold_Gain_All", "T骾 甧o l璶g kh玭g gian kh玭g ph秈 l� r蕋  , ta trc ch� d蒼 1 t� v� s� 甶 /onLotteryGold_Gain_1", "Ta n鱝 s鯽 sang m閠 ch髏 t骾 甧o l璶g 甶 /onCancel" );
		end
	else
		Say( " l� quan  th藅 xin l鏸 , ng礽 v鑞 chu ch璦 sung t筽 ho芻 l� ng礽  nh薾 l蕐 v鑞 k� ch may m緉 v� s� , c竔 n祔 h筺g mua ho箃 ng l� nh籱 v祇 sung t筽 d鬾g h� ch c bi謙 tng thng nga , ng礽 c� th� s� may m緉 t 頲 ho祅g kim trang b� , ng礽 c萵 th薾 suy ngh� m閠 ch髏 sao . ", 0 );
	end
end

-- 领取幸运彩票-确认领取全部彩票
function onLotteryGold_Gain_All()
	onLotteryGold_Gain_Count( 0 );
end

-- 领取幸运彩票-确认领取10张彩票
function onLotteryGold_Gain_10()
	onLotteryGold_Gain_Count( 10 );
end

-- 领取幸运彩票-确认领取1张彩票
function onLotteryGold_Gain_1()
	onLotteryGold_Gain_Count( 1 );
end

-- 领取幸运彩票-确认领取指定数目的彩票（0表示领取全部）
function onLotteryGold_Gain_Count( nLotteryCount )
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		if( nLotteryCount == 0 ) then
			nLotteryCount = nMonthCardCount + nWeekCardCount;
		end
		for i = 1, nMonthCardCount do
			if( i > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, MONTH_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nMonthLotteryCount = nMonthLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, MONTH_CARD_EXTPOINT_COST );
			end
		end
		for i = 1, nWeekCardCount do
			if( ( nMonthLotteryCount + i ) > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, WEEK_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nWeekLotteryCount = nWeekLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, WEEK_CARD_EXTPOINT_COST );
			end
		end
		
		if( ( nMonthLotteryCount + nWeekLotteryCount ) > 0 ) then
			szSayContent = "<> l� quan  ng礽  nh薾 l蕐 ";
			if( nMonthLotteryCount > 0 ) then
				szSayContent = szSayContent.." <color=yellow>"..nMonthLotteryCount.."<><color> t� 10 ng蓇 nhi猲 d穣 s� ch b�/v� phi誹 ";
			end
			if( nWeekLotteryCount > 0 ) then
				if( nMonthLotteryCount > 0 ) then
					szSayContent = szSayContent.."<> c飊g ";
				end
				szSayContent = szSayContent.." <color=yellow>"..nWeekLotteryCount.."<><color> t� 5 ng蓇 nhi猲 d穣 s� ch b�/v� phi誹 ";
			end
			szSayContent = szSayContent.."<> , xin/m阨 � B綾 Kinh th阨 gian v鑞 ch� nh藅 s竛g s韒 1100 khi n ch� nh藅 s竛g s韒 1100 gi鱝 t韎 i tng 甶 . ";
			if( ( nMonthLotteryCount + nWeekLotteryCount ) < ( nMonthCardCount + nWeekCardCount ) ) then
				szSayContent = szSayContent.."<> ng礽 c遪 c� m蕐 t� v� s� � ta y m� , ch� qu猲 � v鑞 ch� nh藅 800 t韎 trc d蒼 甶 nga . ";
			end
			Say( szSayContent, 0 );
			
			Msg2Player( "<>您获得了"..(nMonthLotteryCount+nWeekLotteryCount).."<>张幸运彩票" );
			WriteLog( format( "[%s] %s(%s) nh薾 l蕐 %d t� 10 d穣 s� v� s� %d t� 5 d穣 s� v� s� \r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nMonthLotteryCount, nWeekLotteryCount ) );
		else
			Say( " l� quan  may m緉 v� s� t筸 th阨 kh玭g c竎h n祇 nh薾 l蕐 , xin h藆 th� l筰 , c竚 琻 . ", 0 );
		end
	end
end

-- 幸运彩票兑奖
function onLotteryGold_Prize()

	Say(" l� quan  thng ng th阨 v� s� kh玭g c� ph竧 頲 nga , c� th� ph竧 頲 th阨 gian k輓h xin ng礽 � l﹗ � . ",0)
	do return end
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	if( nPrizeIssueID > 0 ) then
		Say( "<><color=yellow> th� "..format( "%03d", nPrizeIssueID ).."<> k� may m緉 v� s� ph莕 thng <color>\n nh蕋 ng tng "..FIRST_PRIZE_AWARD[1].."<>\n nh� ng tng "..SECOND_PRIZE_AWARD[1].."<>\n k� ni謒 tng [ i b�/v� phi誹 ]"..OTHER_PRIZE_AWARD1[1].."<> [ ti觰 b�/v� phi誹 ]"..OTHER_PRIZE_AWARD2[1].."<>\n<color=red> ch�  b雐 v� ph莕 thng s� lng kh� nhi襲 , � i tng trc xin ch� � s鯽 sang l筰 t骾 甧o l璶g , b秓 m c� y  kh玭g gian  a ph莕 thng .  ngh� kh玭g mu鑞 m閠 l莕 i qu� nhi襲 v� s� . <color>", 2, "Kh玭g th祅h v蕁  , t骾 甧o l璶g c� y  kh玭g gian /onLotteryGold_Prize_Check", "Ta n鱝 s鯽 sang m閠 ch髏 t骾 甧o l璶g 甶 /onCancel"  );
	else
		Say( "May m緉 v� s� ch璦 khai tng , xin/m阨 v韎 v鑞 ch� nh藅 bu鎖 s竛g 1100 sau tr� l筰 甶 , c竚 琻 . ", 1, "Ta bi誸 , c竚 琻 /onLotteryGold" );		
	end
end

-- 幸运彩票兑奖-彩票兑奖界面
function onLotteryGold_Prize_Check()
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	GiveItemUI( "Th� "..format( "%03d", nPrizeIssueID ).." k� may m緉 v� s� i tng ", " l� quan  xin/m阨 甧m t韎 i tng th阨 gian v� s� th� v祇 gi韎 n祔 m苩 trung , ch髇g ta 甧m 甧m ng礽 t 頲 ch ph莕 thng t� ng b� v祇 ng礽 ch v藅 ph萴 lan . n誹 v� s�  qua k� , th� kh玭g ph竝 i . <color=white> ch�  b雐 v� ph莕 thng s� lng kh� nhi襲 , kh玭g mu鑞 m閠 l莕 i qu� nhi襲 v� s� ,  ng鮝 t骾 甧o l璶g kh玭g gian ch璦  , ph莕 thng r琲 xu鑞g . <color>", "onLotteryGold_Prize_Confirm", "onCancel" );
end

-- 幸运彩票兑奖-彩票兑奖界面“确定”回调函数
function onLotteryGold_Prize_Confirm( nCount )
	local nLotteryItemIndex, nLotteryIDCount, nPrize1Count, nPrize2Count, nPrize1TotalCount, nPrize2TotalCount, nOtherPrizeTotalCount;
	local nLotteryItemCount = 0;
	local nPrize1TotalCount = 0;
	local nPrize2TotalCount = 0;
	local nOtherPrizeTotalCount = 0;
	local szHeOrShe;
	
	if( GetSex() == 1 ) then
		szHeOrShe = " n祅g ";
	else
		szHeOrShe = " h緉 ";
	end
	
	for i = 1, nCount do
		local nLotteryItemIndex = GetGiveItemUnit( i );
		local nLotteryIssueID = GetItemParam( nLotteryItemIndex, 1 );
		local nLotteryIDCount, nPrize1Count, nPrize2Count = Lottery_CheckPrize( LOTTERY_GOLD_TYPENAME, nLotteryItemIndex );
		local nRandAwardIdx;
		
		if( nLotteryIDCount > 0 ) then
			nLotteryItemCount = nLotteryItemCount + 1;
			if( RemoveItemByIndex( nLotteryItemIndex ) == 1 ) then
				if( nPrize1Count > 0 or nPrize2Count > 0 ) then
					for j = 1, nPrize1Count do
						local aryProbability = {};
						for k = 1, getn( FIRST_PRIZE_AWARD[2] ) do
							aryProbability[k] = FIRST_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( FIRST_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) 领取了Th� %d期的一等奖奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3], FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<>您获得了"..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<> c� "..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( "<> c tin t鴆 t鑤 , "..GetName().."<#>在扬州的礼官处所领取的Th� "..format("%03d", nLotteryIssueID).."<> k� may m緉 v� s� trung ph秈 nh蕋 ng tng , t 頲 "..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1]..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<> m鉵 ,  cho ch髇g ta trung t﹎ ch骳 ph骳 "..szHeOrShe.."<> . ch髇g ta mong i s� tham d� c馻 ng礽 , c竚 琻 . ");
					end
					for j = 1, nPrize2Count do
						local aryProbability = {};
						for k = 1, getn( SECOND_PRIZE_AWARD[2] ) do
							aryProbability[k] = SECOND_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( SECOND_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) 领取了Th� %d期的二等奖奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<>您获得了"..SECOND_PRIZE_AWARD[2][nRandAwardIdx][3].."<> c� "..SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( format( "特好消息，%s在扬州的礼官处所领取的Th� %03d期幸运彩票中得二等奖，获得%s%d个，让我们衷心祝福%s。我们期待您的参与，谢谢。", GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][1], SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], szHeOrShe ) );
					end
					nPrize1TotalCount = nPrize1TotalCount + nPrize1Count;
					nPrize2TotalCount = nPrize2TotalCount + nPrize2Count;
				else
					if( nLotteryIDCount == 10 ) then
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD1[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD1[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD1[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) 领取了Th� %d期的三等奖大套票奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] ) );
						Msg2Player( "<>您获得了"..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3].."<> c� "..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] );
					else
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD2[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD2[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD2[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) 领取了Th� %d期的三等奖小套票奖品 %d个%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] ) );
						Msg2Player( "<>您获得了"..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3].."<> c� "..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] );
					end
					nOtherPrizeTotalCount = nOtherPrizeTotalCount + 1;
				end
			end
		end
	end
	if( nLotteryItemCount > 0 ) then
		local szPrizeResultContent = " l� quan  ch骳 m鮪g ng礽  � ng礽 i ch v� s� trung b緉 tr髇g li評 <color=yellow>"
		if( nPrize1TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<> nh蕋 ng tng "..nPrize1TotalCount.."<> c� ";
		end
		if( nPrize2TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<> nh� ng tng "..nPrize2TotalCount.."<> c� ";
		end
		if( nOtherPrizeTotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<> k� ni謒 tng "..nOtherPrizeTotalCount.."<> c� ";
		end
		szPrizeResultContent = szPrizeResultContent.."<color>"
		Say( szPrizeResultContent, 0 );
	else
		Say( "Xin/m阨 ki觤 tra ng礽  a ch輓h l� h鱱 hi謚 i tng k� b猲 trong ch may m緉 v� s� ", 3, "M韎 v鮝 r錳 l莔 , ta l莕 n鱝  甶 /onLotteryGold_Prize", "Ta mu鑞 nh譶 m閠 ch髏 trung tng v� s� d穣 s� /onLotteryGold_QueryPrize", "Ta kh玭g c� mu鑞 i ch v� s� , l莕 sau tr� l筰 甶 /onCancel" );
	end
end

-- 查询上期中奖号码
function onLotteryGold_QueryPrize()
	

	Say(" l� quan  thng ng th阨 v� s� kh玭g c� ph竧 頲 nga , c� th� ph竧 頲 th阨 gian k輓h xin ng礽 � l﹗ � . ",0)
	do return end
	
	local szResultPrize1, szResultPrize2;
	local nPrizeIssueID, nPrize1Count, nPrize2Count;
	local aryaryszPrize1ID = {};
	local aryaryszPrize2ID = {};
	
	nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	nPrize1Count = getn( aryaryszPrize1ID );
	nPrize2Count = getn( aryaryszPrize2ID );
	if( nPrizeIssueID > 0 ) then
		for i = 1, nPrize1Count do
			if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
				aryaryszPrize1ID[i] = " ( v� 輈h ) ";
			end
		end
		for i = 1, nPrize2Count do
			if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
				aryaryszPrize2ID[i] = " ( v� 輈h ) ";
			end
		end
		szResultPrize1 = "<#>上期(<color=red>Th� "..format( "%03d", nPrizeIssueID ).."<><color>) k� may m緉 v� s� trung th秈 tin t鴆 \n";
		szResultPrize1 = szResultPrize1.."<><color=yellow> nh蕋 ng tng <color> may m緉 d穣 s� \n<color=yellow>";
		for i = 1, nPrize1Count do
			szResultPrize1 = szResultPrize1..aryaryszPrize1ID[i].." ";
		end
		szResultPrize2 = "<#>上期(<color=red>Th� "..format( "%03d", nPrizeIssueID ).."<><color>) k� may m緉 v� s� trung th秈 tin t鴆 \n";
		szResultPrize2 = szResultPrize2.."<><color=yellow> nh� ng tng <color> may m緉 d穣 s� \n<color=yellow>";
		for i = 1, nPrize2Count do
			szResultPrize2 = szResultPrize2..aryaryszPrize2ID[i].." ";
			if( mod( i, 7 ) == 0 ) then
				szResultPrize2 = szResultPrize2.."\n";
			end
		end
		Talk( 2, "onLoteryGold", szResultPrize1, szResultPrize2 );
	else
		Say( "May m緉 v� s� ch璦 khai tng , xin/m阨 v韎 <color=yellow> v鑞 ch� nh藅 1100<color> sau tr� l筰 tu莕 tra , c竚 琻 . ", 1, "Ta bi誸 , c竚 琻 /onLotteryGold" );
	end
end

-- 关于幸运彩票
function onLotteryGold_About()
	Talk( 3, "", " l� quan  may m緉 v� s� n莥 y b�/v� phi誹 phng th鴆 t苙g cho ng礽 , m鏸 sung tr� gi� m閠 t� 30 nguy猲 sung tr� gi� t筽 t 頲 1 t� b�/v� phi誹 , phi誹 b猲 trong bao h祄 <color=yellow>10<color> c� ng蓇 nhi猲 d穣 s� . m鏸 sung tr� gi� m閠 t� 10 nguy猲 sung tr� gi� t筽 t 頲 1 t� b�/v� phi誹 , phi誹 b猲 trong bao h祄 <color=yellow>5<color> c� ng蓇 nhi猲 d穣 s� . ", " l� quan  cho ph衟 sung t筽 nh薾 l蕐 v� s� ch th阨 gian l�  m鏸 k� v� s� � n猲 v� s� ph竧 頲 <color=yellow> ch� nh藅 s竛g s韒 1100 t韎 cu鑙 tu莕 ng祔 s竛g s韒 800<color> nh薾 l蕐 . <color=red> m� m鏸 tu莕 ng祔 ch s竛g s韒 800 t韎 1100, s� sung ch t筽 kh玭g th� nh薾 l蕐 v� s� . <color>", " l� quan  � ch� nh藅 s竛g s韒 1100 ch髇g ta 甧m th玭g b竜 khi k� trung tng d穣 s� , ng礽 � t 頲 v� s� sau nh璶g c╪ c� phi誹 m苩 ch i tng th阨 gian c飊g m譶h ch ng蓇 nhi猲 d穣 s� t韎 i ph莕 thng . " );
end

-- 本期彩票开奖并启动新一期彩票（SystemTask每天定时调用）
function onLotteryGold_UpdateIssue()
	
	do return end;
	
	local nLotteryLatestIssueID = Lottery_UpdateIssue( LOTTERY_GOLD_TYPENAME );
	if( nLotteryLatestIssueID > 0 ) then
		local nPrizeIssueID, nPrize1Count, nPrize2Count;
		local aryszPrize1ID = {};
		local aryszPrize2ID = {};
		
		nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
		nPrize1Count = getn( aryaryszPrize1ID );
		nPrize2Count = getn( aryaryszPrize2ID );
		if( nPrizeIssueID > 0 ) then
			for i = 1, nPrize1Count do
				if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
					aryaryszPrize1ID[i] = " ( v� 輈h ) ";
				end
			end
			for i = 1, nPrize2Count do
				if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
					aryaryszPrize2ID[i] = " ( v� 輈h ) ";
				end
			end
			local szNewsContent = "<#>号外！号外！Th� "..format( "%03d", nPrizeIssueID ).."<> k� may m緉 v� s� khai tng n鱝/r錳  nh蕋 ng tng may m緉 m� s� l� ";
			for i = 1, nPrize1Count do
				szNewsContent = szNewsContent..aryaryszPrize1ID[i].." ";
			end
			szNewsContent = szNewsContent.."<> , nh� ng tng may m緉 m� s� l� ";
			for i = 1, nPrize2Count do
				szNewsContent = szNewsContent..aryaryszPrize2ID[i].." ";
			end
			szNewsContent = szNewsContent.."<> . v鑞 k� nh蕋 ng tng ph秈 ch� tng t 頲 "..FIRST_PRIZE_AWARD[1].."<>  nh� ng tng ph秈 ch� tng t 頲 "..SECOND_PRIZE_AWARD[1].."<>  m鋓 ngi v閕 v祅g tra i v韎 m譶h m閠 ch髏 ch v� s� , c騨g k辮 th阨 n Dng Ch﹗ l� quan ch� nh薾 l蕐 ph莕 thng ";
			AddGlobalCountNews( szNewsContent, 3 );
		end
	end
end

-- 取消
function onCancel()
end

-- 根据若干个指定概率的选项随机选出某一项
function randByProbability( aryProbability )
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 191 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- 给予玩家指定参数的奖品
function addAward( aryAwardParam )
	local nAwardParamCount = getn( aryAwardParam );
	if( nAwardParamCount == 2 ) then
		return AddGoldItem( aryAwardParam[1], aryAwardParam[2] );
	elseif( nAwardParamCount == 4 ) then
		return AddVerGoldItem( aryAwardParam[1], aryAwardParam[2], aryAwardParam[3], aryAwardParam[4] );
	elseif( nAwardParamCount == 7 ) then
		return AddItem( aryAwardParam[1], aryAwardParam[2],aryAwardParam[3], aryAwardParam[4], aryAwardParam[5], aryAwardParam[6], aryAwardParam[7] );
	end
	return 0;
end