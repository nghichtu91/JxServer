--õ������ʹ�ú����call��һ��õ��ʥ����
--renbin


IncludeLib("SETTING"); --����SETTING�ű�ָ���
Include("\\script\\global\\forbidmap.lua")

function main()
	
	if ( GetFightState() == 1 ) then
		local w,x,y = GetWorldPos()
		local mapindex = SubWorldID2Idx(w)
		if ( mapindex < 0 ) then
			Msg2Player("Get MapIndex Error.")
			return 1
		end
		if ( CheckAllMaps(w) == 1 ) then
			Msg2Player("������������ʺ��������ӣ����Ǵ���ȥҰ��ɣ�")
			return 1
		end
		local posx = x*32
		local posy = y*32
		bossid = 608
		bosslvl = 1
		i = random (1,5) - 1
		AddNpc(bossid,bosslvl,mapindex,posx,posy,1,GetName().."��õ��ʥ����",1)
--		CallNpc(i,608 + i,10,GetName().."��õ��ʥ����",0,1)
		Msg2Player("����ֲ��һ��õ��ʥ����,�Ͽ�ҡ������")
		return 0
	else
		Msg2Player("лл�������ң�������ֻ����Ұ������Ŷ�������ȥ�ɣ�")
		return 1
	end
		
end