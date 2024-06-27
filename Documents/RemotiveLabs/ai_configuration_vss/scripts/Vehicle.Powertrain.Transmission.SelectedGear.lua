
-- The selected 'gear' of the Tesla

--
-- Docs available at https://docs.remotivelabs.com/docs/remotive-broker/scripted_signals
--

local local_signals = {
    {
        name = "ID118DriveSystemStatus.DI_gear",
        namespace = "VehicleBus"
    }
}

local local_frequecy_hz = 0

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    return "Vehicle.Powertrain.Transmission.SelectedGear"
end

-- Required, declare what frequency you like to get "timer" invoked. 0 means no calls to "timer".
function timer_frequency_hz()
    return local_frequecy_hz
end

-- Invoked with the frequency returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp
function timer(system_timestamp_us)
    return return_value_or_bytes("your value")
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- VSS description: The selected gear. 0=Neutral, 1/2/..=Forward, -1/-2/..=Reverse, 126=Park, 127=Drive
    
    -- DI_gear 4 "DI_GEAR_D" 0 "DI_GEAR_INVALID" 3 "DI_GEAR_N" 1 "DI_GEAR_P" 2 "DI_GEAR_R" 7 "DI_GEAR_SNA" ;
    if signals["ID118DriveSystemStatus.DI_gear"] ~= nil then
        if signals["ID118DriveSystemStatus.DI_gear"] == 4 then
            return return_value_or_bytes(127)
        elseif signals["ID118DriveSystemStatus.DI_gear"] == 3 then
            return return_value_or_bytes(0)
        elseif signals["ID118DriveSystemStatus.DI_gear"] == 2 then
            return return_value_or_bytes(-1)
        elseif signals["ID118DriveSystemStatus.DI_gear"] == 1 then
            return return_value_or_bytes(126)
        end
    end
    
    return return_nothing()
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_nothing()
    return
end


