-- Vehicle.ADAS.RoadProperties.SpeedLimit:
--   datatype: string
--   description: Speed Limit on current road
--   type: attribute
--   vtp:
--     bus: HS1
--     message: IPMA_Data2_HS1
--     signal: IsaVLim_D_Rq

local local_signals = {{
    name = "IPMA_Data2_HS1.IsaVLim_D_Rq",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.ADAS.RoadProperties.SpeedLimit"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["IPMA_Data2_HS1.IsaVLim_D_Rq"]
end
