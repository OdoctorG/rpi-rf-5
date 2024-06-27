-- Traveled Distance in miles

local local_signals = {{
    name = "Cluster_Info1_HS1.OdometerMasterValue",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.TraveledDistance"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["Cluster_Info1_HS1.OdometerMasterValue"] * 0.621371
end
