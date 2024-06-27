-- Vehicle.Powertrain.Battery.Range:
--     type: attribute
--     datatype: float
--     description: "Battery Range in Miles"
--     vtp:
--         bus: HS3
--         message: Cluster_HEV_Data1_HS3
--         signal: VehElRnge_L2_Dsply
--         transform: 
--             math: (x*0.1*0.621371)

local local_signals = {{
    name = "Cluster_HEV_Data1_HS3.VehElRnge_L2_Dsply",
    namespace = "HS3"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Powertrain.TractionBattery.Range"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["Cluster_HEV_Data1_HS3.VehElRnge_L2_Dsply"] * 0.1 * 0.621371
end
