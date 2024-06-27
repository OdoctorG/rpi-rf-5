-- Trip meter in miles

local local_signals = {{
    name = "Stop_Start_HS3.OdoTripVerify_L_Actl",
    namespace = "HS3"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.TripMeterReading"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["Stop_Start_HS3.OdoTripVerify_L_Actl"] * 0.621371
end
