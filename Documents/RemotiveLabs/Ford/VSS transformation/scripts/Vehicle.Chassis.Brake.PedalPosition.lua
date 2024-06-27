-- Vehicle.Chassis.Brake.PedalPosition:
--   datatype: uint8
--   type: sensor
--   min: 0
--   max: 100
--   unit: percent
--   description: "Brake pedal position as percent. 0 = Not depressed. 100 = Fully depressed."
--   vtp:
--     bus: HS1
--     message: EngBrakeData_HS1
--     signal: BpedDrvAppl_D_Actl

local local_signals = {{
    name = "EngBrakeData_HS1.BpedDrvAppl_D_Actl",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Chassis.Brake.PedalPosition"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- 0 to 100
    return signals["EngBrakeData_HS1.BpedDrvAppl_D_Actl"]
end
