// ===========================================================================
// VARIABLES
// ===========================================================================

// ...

// ...

// ===========================================================================
// CLIENT SIDE
// ===========================================================================
if (!isDedicated) then {

// ...

};

initialized = false;

// ...

progressLoadingScreen 0.15;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
call compile preprocessFileLineNumbers "dayz_code\compile\compiles.sqf"; // your custom compiles

// ...


initialized = true;

// ...

// ===========================================================================
// SERVER SIDE
// ===========================================================================
if (isServer) then {
  call compile preprocessFileLineNumbers "\z\addons\dayz_server\custom_map\init.sqf"; // your serverside init file for loading map addons
  if (dayz_POIs && (toLower worldName == "chernarus")) then {call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\chernarus\poi\init.sqf";};

// rest of 'isServer' files
};


// ... rest of init bellow...
