# DU-LUA-Scripts
This is a repo for scripts from the game Dual Universe.


OrePureProduct.lua
For this script you will need to have 4 M Screens of larger, a ProgramingBoard, and a link to your static core.

Ore, Pure, and Product Status Display

    Orignally wrote by: Nistus
    Ore and Pure Refactored thanks to Dorian Gray
    Products added by: Kondomize

    1. Copy & paste this script into your Programming Board, into slot "unit" and filter "start()"
    2. Add a "stop()" filter and enter "displayOff()" into the Lua editor for this filter
    3. Add a "tick()" filter and enter the parameter "updateTick, so "tick(updateTick)". 
    In the Lua editor for the filter enter "processTick()"
    4. Link the core this setup is placed on to your Programming Board and rename the slot to "core"
    5. Link 4 screens to your Programming Board, preferably M or larger, and name the slots "display1", "display2", "display3", "display4".
    6. Rename your ore and pure storage boxes you want this script to observe. 
        Ores must be named "<orename> Ore", e.g. "Bauxite Ore" and pures must be named "Pure <purename>", e.g. "Pure Alumnium". 
        Any wrongly named container will not be observed.You can rename the searchString under Advanced->Edit Lua Parameters.
        You MUST include spaces not in the actual substance name. 
        You can have more than one container for a single substance, if you have e.g. three large containers for Hematite, name all of them "Hematite Ore". 
        The script does not support multiple substances in one container.
    7. Rename your product containers to match the list below and add " Product", e.g. "Glass Product".
        The Product list below has names that will for the most part fit one line on screen with no wrapping.
    8. On your Programming Board choose Advanced->Edit Lua Parameters and enter your Container Proficiency Bonus in percent (0 to 50) 
        and your Container Optimization Bonus in percent (0-25)
    9. If you want to use hubs, please note that all Ore and Pure hubs must have the same volume in order for the display to work correctly, 
        and you must enter the total volume of a hub as "DefaultHubVolume" as in (8).
    10. If you use hubs for "Products", this has its own value and can be set following the same as step 9.
    11. Activate the Programming Board.
