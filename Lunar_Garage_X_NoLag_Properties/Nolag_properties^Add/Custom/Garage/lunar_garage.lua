if Config.Garage ~= "lunar_garage" then
    return
end

Config.Functions["OpenGarageMenu"] = {
    type = "outside",   -- inside or outside
    zone = true,        -- If the interaction is a zone or ox_target
    maxPerProperty = 1, -- The maximum amount of garage menu's per property
    radius = 2.0,       -- The radius of the interaction
    requireKeys = false, -- If the player needs to have keys to interact with the interaction
    label = "Garage Menu",
    icon = "fas fa-car",
    onSelect = function(property)
        if property.metadata.lockdown and Config.PoliceLockdown.DisableGarage then
            Framework.Notify({
                description = locale("property_under_police_lockdown"),
                type = "error"
            })
            return
        end
        if cache.vehicle then
            TriggerEvent('lunar_garage:saveVehicleEvent', saveVehicle)
        else
            TriggerEvent('lunar_garage:openGarageVehiclesEvent', { index = 1, society = false })
        end
    end,
}