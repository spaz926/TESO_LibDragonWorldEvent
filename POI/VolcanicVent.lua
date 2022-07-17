LibWorldEvents.POI.VolcanicVent = {}

-- @var bool onMap To know if the user is on the map where the volcanicVents can happen
LibWorldEvents.POI.VolcanicVent.onMap = false

-- @var bool isGenerated To know if the list has been generated or not
LibWorldEvents.POI.VolcanicVent.isGenerated = false

-- @var table List of all zone with volcanicVents world events
LibWorldEvents.POI.VolcanicVent.list = {
    { -- High Isle
        zoneId  = 1318,
        mapName = "systres/u34_systreszone_base",
        list    = {
            title = {
                cp = {
                    [1] = GetString(SI_LIB_WORLD_EVENTS_CP_NORTH) .. " (" .. GetString(SI_LIB_WORLD_EVENTS_SUBZONE_HIGH_ISLE) .. ")",
                    [2] = GetString(SI_LIB_WORLD_EVENTS_CP_WEST) .. " (" .. GetString(SI_LIB_WORLD_EVENTS_SUBZONE_HIGH_ISLE) .. ")",
                    [3] = GetString(SI_LIB_WORLD_EVENTS_CP_EAST) .. " (" .. GetString(SI_LIB_WORLD_EVENTS_SUBZONE_HIGH_ISLE) .. ")",
                    [4] = GetString(SI_LIB_WORLD_EVENTS_CP_SOUTH) .. " (" .. GetString(SI_LIB_WORLD_EVENTS_SUBZONE_HIGH_ISLE) .. ")",
                    [5] = GetString(SI_LIB_WORLD_EVENTS_CP_EAST) .. " (" .. GetString(SI_LIB_WORLD_EVENTS_SUBZONE_AMENOS) .. ")",
                    [6] = GetString(SI_LIB_WORLD_EVENTS_CP_CENTER) .. " (" .. GetString(SI_LIB_WORLD_EVENTS_SUBZONE_AMENOS) .. ")",
                    [7] = GetString(SI_LIB_WORLD_EVENTS_CP_SOUTH) .. " (" .. GetString(SI_LIB_WORLD_EVENTS_SUBZONE_AMENOS) .. ")"
                },
                ln = {} --generated in generateList()
            },
            poiIDs = {
                [1] = 2495, -- Garick's Rise
                [2] = 2493, -- Navire
                [3] = 2494, -- Feywatch Isle
                [4] = 2492, -- Sapphire Point
                [5] = 2498, -- Flooded Coast
                [6] = 2496, -- Serpents Hollow
                [7] = 2497 -- Haunted Coast
            }
        }
    }
}

--[[
-- Obtain and add the location name of all POI to the list
-- To always have an updated value for the current language, I prefer not to save it myself
--]]
function LibWorldEvents.POI.VolcanicVent:generateList()
    for listIdx, zoneData in ipairs(self.list) do
        for poiListIdx, poiId in ipairs(zoneData.list.poiIDs) do
            local zoneIdx, poiIdx = GetPOIIndices(poiId)
            local poiTitle        = GetPOIInfo(zoneIdx, poiIdx)
            zoneData.list.title.ln[poiListIdx] = zo_strformat(poiTitle)
        end
    end

    self.isGenerated = true
end

--[[
-- To obtain the zone's list where a volcanicVents world event can happen
--]]
function LibWorldEvents.POI.VolcanicVent:obtainList()
    if self.isGenerated == false then
        self:generateList()
    end

    return self.list
end