-- Vehicle.ADAS.ACC.GapDistance:
--   datatype: uint8
--   description: Set gap distance for cruise control drive modes. Gap distance is the amount of space that should be maintained behind the vehicle in front of the vehicle.
--   type: actuator
--   max: 4
--   min: 1
-- vtp:
--   bus: HS3
--   message: ACCDATA_3_HS3
--   signal: AccTGap_D_Dsply
--   transform: 
--       math: int(x.slice(-1))

local local_signals = {{
    name = "ACCDATA_3_HS3.AccTGap_D_Dsply",
    namespace = "HS3"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.ADAS.ACC.GapDistance"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return string.sub(signals["ACCDATA_3_HS3.AccTGap_D_Dsply"], -2)
end
