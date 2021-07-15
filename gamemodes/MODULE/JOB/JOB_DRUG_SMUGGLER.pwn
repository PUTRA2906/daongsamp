#define packet1 -772.50391, 2423.41187, 156.20680
#define packet2 2161.69897, -104.21161, 1.86730
#define packet3 2811.16162, 2919.41211, 35.62040
#define COLOR_LOGS 0xC6E2FFFF

new Packet[3],
	GetPacket[MAX_PLAYERS],
	PacketInDelivery,
	opacket,
	Text3D:olabel,
	Float:ObjPacket[3];

CreateJoinSmugglerPoint()
{
	new strings[128];
	CreateDynamicPickup(1239, 23, -3805.5723,1307.4285,75.5859, -1);
	format(strings, sizeof(strings), "[DRUG SMUGGLER]\n"RED_E"Ilegal Jobs\n{FFFFFF}/getjob to join");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -3805.5723,1307.4285,75.5859, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // truck
}
CreateUnloadPacketPoint()
{
	new strings[128];
	CreateDynamicPickup(1239, 23, -3811.5950,1314.6179,71.4297, -1);
	format(strings, sizeof(strings), "[DRUG SMUGGLER]\n"RED_E"Unload Packet\n{FFFFFF}/unloadpacket");
	CreateDynamic3DTextLabel(strings, COLOR_RED, -3811.5950,1314.6179,71.4297, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // truck
}
stock SendSmugglerMessage(color,String[])
{
	foreach(new i : Player)
	{
		if(pData[i][pJob] == 8 || pData[i][pJob2] == 8)
		{
			SendClientMessage(i, color, String);
		}
	}
	return 1;
}
function reloadpacket()
{
	new rand = random(3), strings[128];
	switch(rand)
	{
		case 0:
		{
			SendSmugglerMessage(COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package");
			Packet[0] = 1;
			opacket = CreateDynamicObject(11745, -772.50391, 2423.41187, 156.20680,   0.00000, 0.00000, 0.00000);
			format(strings, sizeof(strings), "[Packet]\n{FFFFFF}/takepacket");
			olabel = CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -772.50391, 2423.41187, 156.20680 + 0.2, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
		}
		case 1:
		{
			SendSmugglerMessage(COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package");
			Packet[1] = 1;
			opacket = CreateDynamicObject(11745, 2161.69897, -104.21161, 1.86730,   0.00000, 0.00000, 0.00000);
			format(strings, sizeof(strings), "[Packet]\n{FFFFFF}/takepacket");
			olabel = CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2161.69897, -104.21161, 1.86730 + 0.2, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
		}
		case 2:
		{
			SendSmugglerMessage(COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package");
			Packet[2] = 1;
			opacket = CreateDynamicObject(11745, 2811.16162, 2919.41211, 35.62040,   0.00000, 0.00000, -84.53999);
			format(strings, sizeof(strings), "[Packet]\n{FFFFFF}/takepacket");
			olabel = CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2811.16162, 2919.41211, 35.62040 + 0.2, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

		}
	}
	return 1;
}
function unloadpacket(playerid)
{
	new packet_price = Random(20000, 30000);
	AddPlayerSalary(playerid, "IlegalJob(Drug Smuggler)", packet_price);
	SendClientMessageEx(playerid, COLOR_LOGS, "SMUGGLER: {FFFFFF}You get $%s from delivering packet", FormatMoney(packet_price));
	ClearAnimations(playerid), SetPlayerSpecialAction(playerid, 0);
	pData[playerid][pSmugglerTime] += 3600;
	Marijuana++;
	GetPacket[playerid] = 0;
	PacketInDelivery = 0;
}
function DrugsTimer(playerid)
{
	ApplyAnimation(playerid,"CARRY", "crry_prtial", 4.0,1,0,0,1,1,1), SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	return 1;
}
//<! --- Command --- !>
CMD:reloadpacket(playerid)
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);
	SetTimer("reloadpacket", 10000, false);
	SendAdminMessage(COLOR_RED, "%s has use command /reloadpacket ( Dont Abuse ).", pData[playerid][pAdminname]);
	return 1;
}
CMD:takepacket(playerid)
{
	if(pData[playerid][pSmugglerTime] > 0) return Error(playerid, "Anda harus menunggu "GREY2_E"%d "WHITE_E"detik untuk bisa bekerja kembali.", pData[playerid][pSmugglerTime]);
	if(IsPlayerInRangeOfPoint(playerid, 3.0, packet1))
	{
		if(Packet[0] == 1)
		{
			DestroyDynamicObject(opacket);
			DestroyDynamic3DTextLabel(olabel);
			ApplyAnimation(playerid, "CARRY", "liftup", 3.0, 0, 0, 0, 0, 0), DisablePlayerCheckpoint(playerid);
			SetTimerEx("DrugsTimer", 1000, false, "i", playerid);
			GetPacket[playerid] = 1;

			SetPlayerAttachedObject(playerid, 1, 1577, 5, -0.0140, 0.1560, 0.2220, -82.5999, -179.7000, 82.3000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
			PacketInDelivery = 1;
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, packet2))
	{
		if(Packet[1] == 1)
		{
			DestroyDynamicObject(opacket);
			DestroyDynamic3DTextLabel(olabel);
			ApplyAnimation(playerid, "CARRY", "liftup", 3.0, 0, 0, 0, 0, 0), DisablePlayerCheckpoint(playerid);
			SetTimerEx("DrugsTimer", 1000, false, "i", playerid);
			GetPacket[playerid] = 1;

			SetPlayerAttachedObject(playerid, 1, 1577, 5, -0.0140, 0.1560, 0.2220, -82.5999, -179.7000, 82.3000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
			PacketInDelivery = 1;
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, packet3))
	{
		if(Packet[2] == 1)
		{
			DestroyDynamicObject(opacket);
			DestroyDynamic3DTextLabel(olabel);
			ApplyAnimation(playerid, "CARRY", "liftup", 3.0, 0, 0, 0, 0, 0), DisablePlayerCheckpoint(playerid);
			SetTimerEx("DrugsTimer", 1000, false, "i", playerid);
			GetPacket[playerid] = 1;

			SetPlayerAttachedObject(playerid, 1, 1577, 5, -0.0140, 0.1560, 0.2220, -82.5999, -179.7000, 82.3000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
			PacketInDelivery = 1;
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, ObjPacket[0], ObjPacket[1], ObjPacket[2]))
	{
		{
			DestroyDynamicObject(opacket);
			DestroyDynamic3DTextLabel(olabel);
			ApplyAnimation(playerid, "CARRY", "liftup", 3.0, 0, 0, 0, 0, 0), DisablePlayerCheckpoint(playerid);
			SetTimerEx("DrugsTimer", 1000, false, "i", playerid);
			GetPacket[playerid] = 1;

			SetPlayerAttachedObject(playerid, 1, 1577, 5, -0.0140, 0.1560, 0.2220, -82.5999, -179.7000, 82.3000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
			PacketInDelivery = 1;
		}
	}
	return 1;
}
CMD:unloadpacket(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 2.0, -3811.5950,1314.6179,71.4297))
	{
		if(GetPacket[playerid] == 1)
	   	{
	   		pData[playerid][pSmuggSkill]++;
			RemovePlayerAttachedObject(playerid,1);
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 1, 1, 1, 900);
			SetTimerEx("unloadpacket", 900, false, "d", playerid);
		}
		else return Error(playerid, "Anda tidak membawa packet.");
	}
	return 1;
}
CMD:droppacket(playerid)
{
	if(GetPacket[playerid] == 1)
	{
		GetPlayerPos(playerid, ObjPacket[0], ObjPacket[1], ObjPacket[2]);
		opacket = CreateDynamicObject(11745, ObjPacket[0], ObjPacket[1], ObjPacket[2], 0.00000, 0.00000, 0.00000);
		GetPacket[playerid] = 0;
		PacketInDelivery = 0;
		foreach(new i : Player)
		{
			if(pData[i][pJob] == 8 || pData[i][pJob2] == 8)
			{
				SCM(i, COLOR_JOB, "SMUGGLER:"WHITE_E" Go to waypoint to get the packet");
				SetPlayerCheckpoint(i, ObjPacket[0], ObjPacket[1], ObjPacket[2], 2.0);
			}
		}
	}
}
CMD:findpacket(playerid)
{
	if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
	{
		if(PacketInDelivery != 1)
		{
			if(Packet[0] == 1)
			{
				SCM(playerid, COLOR_JOB,"SMUGGLER: "WHITE_E"Go to waypoint to get smuggler packet");
				SetPlayerCheckpoint(playerid, packet1, 2.0);
			}
			else if(Packet[1] == 1)
			{
				SCM(playerid, COLOR_JOB,"SMUGGLER: "WHITE_E"Go to waypoint to get smuggler packet");
				SetPlayerCheckpoint(playerid, packet2, 2.0);
			}
			else if(Packet[2] == 1)
			{
				SCM(playerid, COLOR_JOB,"SMUGGLER: "WHITE_E"Go to waypoint to get smuggler packet");
				SetPlayerCheckpoint(playerid, packet3, 2.0);
			}
		}
		else return SCM(playerid, COLOR_JOB, "SMUGGLER: "WHITE_E"packet in "RED_E"delivery");
	}
	else return Error(playerid, "You are not smuggler job.");
	return 1;
}
