// ===========================================================================
// USE FOR CUSTOM MAP
// Based on fn_spawnObject from Epoch core. Original src:
// https://github.com/EpochModTeam/DayZ-Epoch/blob/master/SQF/dayz_code/compile/fn_spawnObjects.sqf
// Reworked by @iben
// ===========================================================================
// [
//   [
//     ['obj_classname', [position], dir, setVectorUp_bool, vehicleInitBurn_Bool],
//     ['obj_classname', [position], dir, setVectorUp_bool, vehicleInitBurn_Bool]
//   ],
//   false,  // spawn objects locally
//   false,  // use setPosATL instead of setPos
//   false   // block damage
//
// ] call fnc_spawnCustomMap;
// ===========================================================================
private ["_objects","_blockDamage","_atl","_local","_fires","_type","_bldObj","_vector","_vehInitBurn"];

_objects     = _this select 0;
_blockDamage = _this select 1;
_atl         = _this select 2;
_local       = _this select 3;

_fires = [
  "Base_Fire_DZ",
  "flamable_DZ",
  "Land_Camp_Fire_DZ",
  "Land_Campfire",
  "Land_Campfire_burning",
  "Land_Fire",
  "Land_Fire_burning",
  "Land_Fire_DZ",
  "Land_Fire_barrel",
  "Land_Fire_barrel_burning",
  "Misc_TyreHeap"
];

{
  // local/global object
  _type = _x select 0;
  if (_local) then {
    _bldObj = _type createVehicleLocal [0,0,0];
    _bldObj setVariable ["", true, false];
  } else {
    _bldObj = _type createVehicle [0,0,0];
  };

  // set direction
  _bldObj setDir (_x select 2);
  // set position
  if (_atl) then {
    _bldObj setPosATL (_x select 1);
  } else {
    _bldObj setPos (_x select 1);
  };

  // setVectorUp [0,0,1];
  _vector = _x select 3;
  if (_vector) then {
    _bldObj setVectorUp [0,0,1];
  };

  // vehicle init (burn)
  _vehInitBurn = _x select 4;
  if (_vehInitBurn) then {
    _bldObj setVehicleInit "BIS_Effects_Burn = compile preprocessFile ""\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf""; nul = [this, 4, time, false, false] spawn BIS_Effects_Burn;";
  };

  // block damage
  if (_blockDamage) then {
    _bldObj addEventHandler ["HandleDamage",{0}];
    if !(_type in _fires) then {
      _bldObj enableSimulation false;
    };
  };

} forEach _objects;

