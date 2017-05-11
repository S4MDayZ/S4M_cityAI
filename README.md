# S4M_cityAI
Just for visual how-to for S4M

---

## For fresh server

1. Just copy all folders and files **except** `init.sqf`
2. Use your default `init.sqf` located: `MPMissions\DayZ_Epoch_11.Chernarus\init.sqf` and insert (merge) code presented in `MPMissions\DayZ_Epoch_11.Chernarus\init.sqf` file from this repo
3. Done, you can start game and see your S4M city
4. If it's OK for you, you can add all your addons into `dayz_server\custom_map\` folder **AND** insert your addons filenames (without '.sqf') to array in `custom_map\init.sqf`
5. **Remember!** All your map addons has to be in compact format just the same like it's presented in `City_S4M.sqf` file.

---

## For server with mods already installed

1. Find your `dayz_server\custom_map\` folder - insert file `init.sqf` from downloaded repo: `dayz_server\custom_map\`<br>**Doublecheck your paths!**
2. Find your `MPMissions\DayZ_Epoch_11.Chernarus\` folder, follow instructions bellow:

+ Open your `init.sqf`, insert (merge) code presented in `MPMissions\DayZ_Epoch_11.Chernarus\init.sqf` file from this repo
+ Find your custom compiles folder, add file `fnc_spawnCustomMap.sqf` from this repo
+ Find your custom `compiles.sqf` file, insert this line (see example from this repo!):

```c
fnc_spawnCustomMap = compile preprocessFileLineNumbers "dayz_code\compile\fnc_spawnCustomMap.sqf";
```

3. Done, you can start game and see your S4M city
4. If it's OK for you, you can add all your addons into `dayz_server\custom_map\` folder **AND** insert your addons filenames (without '.sqf') to array in `custom_map\init.sqf`
5. **Remember!** All your map addons has to be in compact format just the same like it's presented in `City_S4M.sqf` file.
6. **AGAIN: Always doublecheck your paths!**

---
