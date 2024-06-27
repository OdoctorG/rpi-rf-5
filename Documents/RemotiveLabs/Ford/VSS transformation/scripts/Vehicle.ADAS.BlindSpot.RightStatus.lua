-- Vehicle.ADAS.BlindSpot.RightStatus:
--     type: attribute
--     datatype: int8
--     description: "BLIS Right"
--     vtp:
--        bus: HS3
--        message: Side_Detect_R_Stat_HS3
--        signal: SodAlrtRight_D_Stat

local local_signals = {{
    name = "Side_Detect_R_Stat_HS3.SodAlrtRight_D_Stat",
    namespace = "HS3"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.ADAS.BlindSpot.RightStatus"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
-- See left for details
    return signals["Side_Detect_R_Stat_HS3.SodAlrtRight_D_Stat"]
end
