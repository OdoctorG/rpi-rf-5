-- Vehicle.Speed:
--     type: attribute
--     datatype: float
--     unit: mph
--     vtp:
--         bus: HS1
--         message: EngVehicleSpThrottle2_HS1
--         signal: Veh_V_ActlEng
--         transform: 
--             math: x * 0.621371

local local_signals = {{
    name = "EngVehicleSpThrottle2_HS1.Veh_V_ActlEng",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Speed"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["EngVehicleSpThrottle2_HS1.Veh_V_ActlEng"] * 0.621371
end
