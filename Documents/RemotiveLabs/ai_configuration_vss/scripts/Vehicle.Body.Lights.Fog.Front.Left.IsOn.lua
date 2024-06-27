local local_signals = {{
    name = "ID3F5VCFRONT_lighting.VCFRONT_fogLeftStatus",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Body.Lights.Fog.Front.Left.IsOn"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- VCFRONT_fogLeftStatus 2 "LIGHT_FAULT" 0 "LIGHT_OFF" 1 "LIGHT_ON" 3 "LIGHT_SNA" ;
    if signals["ID3F5VCFRONT_lighting.VCFRONT_fogLeftStatus"] ~= nil then
        if signals["ID3F5VCFRONT_lighting.VCFRONT_fogLeftStatus"] == 1 then
            return return_value_or_bytes(1)
        else
            return return_value_or_bytes(0)
    end
    return return_nothing()
end
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
