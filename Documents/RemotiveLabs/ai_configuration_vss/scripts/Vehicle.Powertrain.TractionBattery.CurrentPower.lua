
--
-- Docs available at https://docs.remotivelabs.com/docs/remotive-broker/scripted_signals
--

local local_signals = {
    {
        name = "ID132HVBattAmpVolt.BattVoltage132",
        namespace = "VehicleBus"
    },
    {
        name = "ID132HVBattAmpVolt.RawBattCurrent132",
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
    return "Vehicle.Powertrain.TractionBattery.CurrentPower"
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
    -- P = U*I
    
    if (signals["ID132HVBattAmpVolt.BattVoltage132"] ~= nil and signals["ID132HVBattAmpVolt.RawBattCurrent132"] ~= nil) then
        local power = signals["ID132HVBattAmpVolt.BattVoltage132"]*signals["ID132HVBattAmpVolt.RawBattCurrent132"]
        return return_value_or_bytes(-power)
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


