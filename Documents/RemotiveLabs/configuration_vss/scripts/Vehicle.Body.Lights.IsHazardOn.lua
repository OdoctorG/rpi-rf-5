local local_signals = {{
    name = "ID3C2VCLEFT_switchStatus.VCLEFT_hazardButtonPressed",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Body.Lights.IsHazardsOn"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    if signals["ID3C2VCLEFT_switchStatus.VCLEFT_hazardButtonPressed"] == 0 then
        return return_value_or_bytes(0)
    else
        return return_value_or_bytes(1)
    end 
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
