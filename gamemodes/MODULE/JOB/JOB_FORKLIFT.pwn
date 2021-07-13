//======== Bus ===========
#define forpoint1 1465.7505,1044.9149,10.8203
#define forpoint2 1284.6956,1317.4347,10.8203
#define forpoint3 1468.4348,1056.0305,10.8203

new ForCar[4];

AddForVehicle()
{
	ForCar[0] = AddStaticVehicleEx(530, 1467.2090, 1051.4791, 10.5846, 268.7731, -1, -1, VEHICLE_RESPAWN);
	ForCar[1] = AddStaticVehicleEx(530, 1467.3741, 1059.5197, 10.5834 ,267.3926, -1, -1, VEHICLE_RESPAWN);
	ForCar[2] = AddStaticVehicleEx(530, 1467.3051, 1055.5734, 10.5837, 269.4866, -1, -1, VEHICLE_RESPAWN);
}

IsAForVeh(carid)
{
	for(new v = 0; v < sizeof(ForCar); v++) {
	    if(carid == ForCar[v]) return 1;
	}
	return 0;
}


