-- Vehicle.Powertrain.Gear.SelectedGear:
--     type: attribute
--     datatype: string
--     description: "Selected Gear"
--     vtp:
--         bus: HS1
--         message: TransGearData_HS1
--         signal: GearLvrPos_D_Actl

local local_signals = {{
    name = "TransGearData_HS1.GearLvrPos_D_Actl",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Powertrain.Transmission.SelectedGear"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["TransGearData_HS1.GearLvrPos_D_Actl"]
end
