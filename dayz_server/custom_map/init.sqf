// ===========================================================================
// This file will be called from 'MPMissions\init.sqf'
// ===========================================================================
{
  call compile preprocessFileLineNumbers ("\z\addons\dayz_server\custom_map\" + _x + ".sqf");
} forEach [
  "City_S4M",
  // "Black_Trader",
  // "Superbandit"    // you can add all addons having in your 'custom_map' folder
];
