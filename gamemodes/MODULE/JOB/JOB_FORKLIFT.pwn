//======== Bus ===========
#define forpoint1 2787.6077,-2411.3142,13.6337
#define forpoint2 2400.02,-2565.49,13.21
#define forpoint3 2787.7585,-2425.3135,13.6337
#define forpoint4 2400.03,-2565.49,13.21
#define forpoint5 2788.1296,-2463.0195,13.6336
#define forpoint6 2400.04,-2565.49,13.21
#define forpoint7 2787.9797,-2449.0320,13.6336
#define forpoint8 2400.05,-2565.49,13.21
#define forpoint9 2787.7700,-2500.5857,13.6503
#define forpoint10 2400.06,-2565.49,13.21
#define forpoint11 2752.89,-2392.60,13.64

new ForCar[4];

AddForVehicle()
{
	ForCar[0] = AddStaticVehicleEx(530, 2736.760009, -2385.711669, 13.395622, 177.134399, 1, 1, VEHICLE_RESPAWN);
	ForCar[1] = AddStaticVehicleEx(530, 2739.122802, -2385.960693, 13.396159, 177.051635, 1, 1, VEHICLE_RESPAWN);
	ForCar[2] = AddStaticVehicleEx(530, 2741.045410, -2386.254638, 13.394916, 178.051330, 1, 1, VEHICLE_RESPAWN);
}

IsAForVeh(carid)
{
	for(new v = 0; v < sizeof(ForCar); v++) {
	    if(carid == ForCar[v]) return 1;
	}
	return 0;
}


