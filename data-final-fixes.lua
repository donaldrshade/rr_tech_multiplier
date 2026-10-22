-- data-final-fixes.lua

-- 1. Define your custom multipliers for each "Age"

local MULTIPLIERS = {
    primitive = settings.startup["rr-tm-primitive-multiplier"].value,-- Pre-Train / Early game (Automation & Logistic science)
    rail_age  = settings.startup["rr-tm-rail-multiplier"].value, -- Post-Train / Chemical Age spike (Forces train/production scaling)
    space_age = settings.startup["rr-tm-space-multiplier"].value -- Interstellar / Space Age (Massive scaling for mega-factories)
}

-- 2. Helper function to check if a technology requires a specific science pack
local function requires_pack(tech, pack_name)
    if not tech.unit or not tech.unit.ingredients then return false end
    for _, ingredient in ipairs(tech.unit.ingredients) do
        -- Handle both possible Factorio ingredient table formats:
        -- Format A: {"automation-science-pack", 1}
        -- Format B: {name = "automation-science-pack", amount = 1}
        local name = ingredient.name or ingredient[1]
        if name == pack_name then return true end
    end
    return false
end

-- 3. Loop through every single technology registered in the game database
for tech_name, tech in pairs(data.raw["technology"]) do
    -- Only modify technologies that have a defined research cost/count
    if tech.unit and tech.unit.count then
        
        -- Start with the baseline Primitive multiplier
        local active_multiplier = MULTIPLIERS.primitive
        
        -- 🌟 Check for Space/Interstellar Age (White science or Space Age DLC planetary packs)
        if requires_pack(tech, "space-science-pack") or 
           requires_pack(tech, "metallurgic-science-pack") or 
           requires_pack(tech, "electromagnetic-science-pack") or 
           requires_pack(tech, "agricultural-science-pack") or 
           requires_pack(tech, "cryogenic-science-pack") then
            
            active_multiplier = MULTIPLIERS.space_age
            
        -- 🚂 Check for Rail/Chemical Age (Blue science, or the Railway technology itself)
        elseif requires_pack(tech, "chemical-science-pack") or tech_name == "railway" then
            active_multiplier = MULTIPLIERS.rail_age
        end
        
        -- 4. Apply the multiplier to the technology's required science pack count
        -- math.floor ensures we keep whole numbers for the engine
        tech.unit.count = math.floor(tech.unit.count * active_multiplier)
        
        -- Optional handling for dynamic formulas (like infinite research nodes)
        if tech.unit.count_formula then
            -- If a tech uses a formula (e.g., "2^L*100"), we can prefix a multiplier scalar to it
            tech.unit.count_formula = tostring(active_multiplier) .. "*(" .. tech.unit.count_formula .. ")"
        end
    end
end
