/*
Dirty init.sqf
add inits here until it's so fucked up, then redo it all over again
*/

//==== Locations initialization
//player allowDamage false;
call compile preprocessFileLineNumbers "initModules.sqf";
diag_log "==== 0";
if(isServer) then
{
diag_log "==== 1";
	allLocations = call compile preprocessFileLineNumbers "Init\createAllLocations.sqf";
	diag_log "==== 2";
	[allLocations] call compile preprocessFileLineNumbers "Init\initAllGarrisons.sqf";
diag_log "==== 3";
	
	//Init some HQ modules
	call (compile (preprocessFileLineNumbers "Init\initHQ.sqf"));
diag_log "==== 4";

	HCGarrisonWEST = [] call gar_fnc_createGarrison;
	[HCGarrisonWEST, "HC WEST"] call gar_fnc_setName;
	[HCGarrisonWEST, WEST] call gar_fnc_setSide;
	//[HCGarrisonWEST, G_AS_none] call gar_fnc_setAlertState;
	[HCGarrisonWEST] call gar_fnc_spawnGarrison;

	HCGarrisonEAST = [] call gar_fnc_createGarrison;
	[HCGarrisonEAST, "HC EAST"] call gar_fnc_setName;
	[HCGarrisonEAST, EAST] call gar_fnc_setSide;
	//[HCGarrisonEAST, G_AS_none] call gar_fnc_setAlertState;
	[HCGarrisonEAST] call gar_fnc_spawnGarrison;

	publicVariable "allLocations";
	diag_log "==== 5";
};


//Commander's map
UI_fnc_onMapSingleClick =
compile preprocessfilelinenumbers "UI\onMapSingleClick.sqf";
onMapSingleClick {call UI_fnc_onMapSingleClick;};