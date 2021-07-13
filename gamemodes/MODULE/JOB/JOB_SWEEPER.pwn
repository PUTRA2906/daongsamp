//======== Sweper ===========
#define sweperpoint1 1617.4294,-1872.0619,13.1079
#define sweperpoint2 1569.8221,-1810.3708,13.1079
#define sweperpoint3 1530.1611,-1693.0985,13.1080
#define sweperpoint4 1532.3215,-1593.2329,13.1158
#define sweperpoint5 1657.5828,-1592.4602,13.1182
#define sweperpoint6 1819.1406,-1614.1688,13.1084
#define sweperpoint7 1821.9806,-1711.5750,13.1080
#define sweperpoint8 1960.7196,-1754.6133,13.1154
#define sweperpoint9 1942.8148,-1931.6068,13.1079
#define sweperpoint10 1821.5555,-1929.4974,13.1010
#define sweperpoint11 1750.3075,-1821.2284,13.1119
#define sweperpoint12 1626.7784,-1872.9351,13.1080

new SweepVeh[3];

AddSweeperVehicle()
{
	SweepVeh[0] = AddStaticVehicleEx(574, 1613.6813, -1895.0378, 13.2759, 0.2797, 1, 1, VEHICLE_RESPAWN);
	SweepVeh[1] = AddStaticVehicleEx(574, 1618.9697, -1894.9836, 13.2744, 0.1792, 1, 1, VEHICLE_RESPAWN);
	SweepVeh[2] = AddStaticVehicleEx(574, 1624.0046, -1895.5011, 13.2764, 357.1350, 1, 1, VEHICLE_RESPAWN);
}

IsASweeperVeh(carid)
{
	for(new v = 0; v < sizeof(SweepVeh); v++) {
	    if(carid == SweepVeh[v]) return 1;
	}
	return 0;
}