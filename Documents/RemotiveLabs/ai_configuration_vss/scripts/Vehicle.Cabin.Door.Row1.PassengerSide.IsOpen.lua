local local_signals = {{
    name = "ID103VCRIGHT_doorStatus.VCRIGHT_frontLatchStatus",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Cabin.Door.Row1.PassengerSide.IsOpen"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    --VAL_ 259 VCRIGHT_frontLatchStatus 5 "LATCH_AJAR" 2 "LATCH_CLOSED" 3 "LATCH_CLOSING" 7 "LATCH_DEFAULT" 8 "LATCH_FAULT" 1 "LATCH_OPENED" 4 "LATCH_OPENING" 0 "LATCH_SNA" 6 "LATCH_TIMEOUT" ;
    if signals["ID103VCRIGHT_doorStatus.VCRIGHT_frontLatchStatus"] ~= nil then
        if signals["ID103VCRIGHT_doorStatus.VCRIGHT_frontLatchStatus"] == 1 then
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
