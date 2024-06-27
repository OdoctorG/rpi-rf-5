local local_signals = {{
    name = "ID25BAPP_environment.APP_environmentRainy",
    namespace = "ChassisBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    -- remianing meters
    return "Vehicle.Body.Raindetection.Intensity"
end

local local_frequecy_hz = 0

-- Required, declare what frequence you like to get "timer" invoked. 0 means no calls to "timer".
function timer_frequency_hz()
    return local_frequecy_hz
end

-- Invoked with the frequecy returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp 
function timer(system_timestamp_us)
    return return_nothing()
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- Either 100% on if rainy or 0% if not
    -- BO_ 603 ID25BAPP_environment: 1 ChassisBus
    --      SG_ APP_environmentRainy : 0|1@1+ (1,0) [0|1] ""  Receiver
    --      SG_ APP_environmentSnowy : 1|1@1+ (1,0) [0|1] ""  Receiver
    if (signals["ID25BAPP_environment.APP_environmentRainy"] ~= nil) then
        return return_value_or_bytes(signals["ID25BAPP_environment.APP_environmentRainy"] * 100)
    else
        return return_nothing()
    end
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_nothing()
    return
end
