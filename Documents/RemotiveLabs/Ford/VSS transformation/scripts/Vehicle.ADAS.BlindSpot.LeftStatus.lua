-- Vehicle.ADAS.BlindSpot.LeftStatus:
--     type: attribute
--     datatype: int8
--     description: "BLIS Left"
--     vtp:
--        bus: HS3
--        message: Side_Detect_L_Stat_HS3
--        signal: SodAlrtLeft_D_Stat

local local_signals = {{
    name = "Side_Detect_L_Stat_HS3.SodAlrtLeft_D_Stat",
    namespace = "HS3"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.ADAS.BlindSpot.LeftStatus"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
-- The value is 0,1,2 0 means blindspot is open
-- Value of 1 or 2 means someone is in your blind spot
    return signals["Side_Detect_L_Stat_HS3.SodAlrtLeft_D_Stat"]
end
