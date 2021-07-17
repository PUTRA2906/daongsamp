//======== Bus ===========
#define forpoint1 2745.33,-2431.58,13.64
#define forpoint2 2400.02,-2565.49,13.21
#define forpoint3 2752.89,-2392.60,13.64

new ForCar[4];

AddForVehicle()
{
	ForCar[0] = AddStaticVehicleEx(530, 2736.760009, -2385.711669, 13.395622, 177.134399, -1, -1, VEHICLE_RESPAWN);
	ForCar[1] = AddStaticVehicleEx(530, 2739.122802, -2385.960693, 13.396159, 177.051635, -1, -1, VEHICLE_RESPAWN);
	ForCar[2] = AddStaticVehicleEx(530, 2741.045410, -2386.254638, 13.394916, 178.051330, -1, -1, VEHICLE_RESPAWN);
}

IsAForVeh(carid)
{
	for(new v = 0; v < sizeof(ForCar); v++) {
	    if(carid == ForCar[v]) return 1;
	}
	return 0;
}


