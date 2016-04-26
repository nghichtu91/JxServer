-------------------------------------------------------------------------
-- FileName		:	templeboss6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   ɽ�����ؿ��ı�־boss�ű�[60-79��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı���


NPC_PARAM_ID = 1;        --����boss������ˢ������������¼��У�����npc��ʱ����ΪGetNpcParam�ĵڶ�λ����˼�Ǹú���ȡ�����Ǵ���Ŀǰ����bossID������   
TEMBOSS_RELIVE=120       --ÿ����־������ʱ��
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_exp"))  --С�־���
TEMBOSS_MAPID=390        --��ǰ������ڵ�ͼ��֮��ĵ�ͼ��ţ����Ƕ��٣���
TEMBOSS_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_jifen"))  --С�־���

templeboss=
{
{834,70,390,1520,2625,1,"�����ֵ��ִ�",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",1},
{834,70,390,1519,2718,1,"�����ֵ�����",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",2},
{834,70,390,1465,2795,1,"�����ֵܸ��",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",3},
{834,70,390,1436,2955,1,"�����ֵ�����",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",4},
{834,70,390,1379,3056,1,"�����ֵ�ͬ��",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",5},
{834,70,390,1412,3091,1,"�����ֵܸ�ѿ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",6},
{834,70,390,1499,2996,1,"�����ֵܳ���",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",7},
{834,70,390,1530,2836,1,"�����ֵ���������",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",8},
{834,70,390,1581,2701,1,"�����ֵ�����",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",9},
{834,70,390,1360,2979,1,"�����ֵܺͰ�",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",10},
{834,70,390,1404,2810,1,"�����ֵܺ���",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",11},
{834,70,390,1404,2688,1,"�����ֵ�����",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",12},
{834,70,390,1463,2706,1,"�����ֵ������",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",13},
{834,70,390,1465,3136,1,"�����ֵ���ţ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",14},
{834,70,390,1558,3151,1,"�����ֵ���ѿ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",15},
{834,70,390,1572,3000,1,"�����ֵ���С��",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",16},
{834,70,390,1572,2843,1,"�����ֵ���̤",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",17},
{834,70,390,1333,2774,1,"�����ֵ�ɽ��",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",18},
{834,70,390,1344,2669,1,"�����ֵܰ˶�",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",19},
{834,70,390,1485,2625,1,"�����ֵܳ���",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",20},
}

function OnDeath(NpcIndex)
	local name = GetName()
	if (GetTask(Task_IsQuest)==2 and GetTask(Task_lag_TskID)==4) then
		if (GetTask(Task_KillNPC) < 5) then
			SetTask(Task_KillNPC, GetTask(Task_KillNPC) + 1)
			Msg2Player(format("����������%d ����", GetTask(Task_KillNPC)))
		else
		Msg2Player("��������������������뵽ս�����ߴ��������")
		end
	end
	
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("�Բ���! "..name.."!�����ʹ����ʱ�������꣬����ʧ��!.")
		losemessengertask()
	else
		Msg2Player("�������������.")
		messenger_templego(NpcIndex)
	end
end
