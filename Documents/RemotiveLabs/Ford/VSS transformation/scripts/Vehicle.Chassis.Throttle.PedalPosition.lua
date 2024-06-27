-- Vehicle.Chassis.Throttle.PedalPosition:
--     datatype: uint8
--     type: sensor
--     min: 0
--     max: 100
--     unit: percent
--     description: "Throttle pedal position as percent. 0 = Not depressed. 100 = Fully depressed."
--     vtp:
--         bus: HS1
--         message: EngVehicleSpThrottle_HS1.ApedPos_Pc_ActlArb
--         signal: ApedPos_Pc_ActlArb

local local_signals = {{
    name = "EngVehicleSpThrottle_HS1.ApedPos_Pc_ActlArb",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Chassis.Throttle.PedalPosition"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["EngVehicleSpThrottle_HS1.ApedPos_Pc_ActlArb"]
end
