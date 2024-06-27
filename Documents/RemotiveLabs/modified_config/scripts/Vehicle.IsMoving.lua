local local_signals = {{
    name = "ID257DIspeed.DI_uiSpeed",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.IsMoving"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    if (signals["ID257DIspeed.DI_uiSpeed"] == nil) then
        return return_nothing()
    end
    if signals["ID257DIspeed.DI_uiSpeed"] > 0.1 then
        return return_value_or_bytes(1) -- If more than 0.1km/h we are moving.
    else
        return return_value_or_bytes(0)
    end 
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
