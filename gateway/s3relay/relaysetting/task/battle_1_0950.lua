-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- ���÷�������
	TaskName( "����ս�� (�ν�) 09:50" );
	TaskInterval( 1440 );
	TaskTime( 9, 50 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "BATTLE[XiangYang] 09:50 startup..." );
end

function TaskContent()
--	Battle_StartNewRound( 1, 1 );	-- GMָ������ͼ���ս��
--	Battle_StartNewRound( 1, 2 );	-- GMָ������м���ս��
	Battle_StartNewRound( 1, 3 );	-- GMָ������߼���ս��
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end