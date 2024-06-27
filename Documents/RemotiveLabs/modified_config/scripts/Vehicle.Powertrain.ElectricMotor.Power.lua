
--
-- Docs available at https://docs.remotivelabs.com/docs/remotive-broker/scripted_signals
--

local local_signals = {
    {
        name = "ID266RearInverterPower.RearPower266",
        namespace = "VehicleBus"
    },
    {
        name = "ID2E5FrontInverterPower.FrontPower2E5",
        namespace = "VehicleBus"
    }
}

local local_frequecy_hz = 10
local RearPower = 0
local RearPowerTimestamp = 0
local FrontPower = 0
local FrontPowerTimestamp = 0

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    return "Vehicle.Powertrain.ElectricMotor.Power"
end

-- Required, declare what frequency you like to get "timer" invoked. 0 means no calls to "timer".
function timer_frequency_hz()
    return local_frequecy_hz
end

-- Invoked with the frequency returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp
function timer(system_timestamp_us)
    -- Check that the time difference between signals is not to large and that the signal is not from the future.
    local time_diff = RearPowerTimestamp-FrontPowerTimestamp
    if (math.abs(time_diff) < 1000000 and system_timestamp_us-RearPowerTimestamp >= 0) then
        return return_value_or_bytes(FrontPower+RearPower)
    end
    return return_nothing()
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- Compute the combined power of both motors.
    
    if (signals["ID266RearInverterPower.RearPower266"] ~= nil) then
        RearPower = signals["ID266RearInverterPower.RearPower266"]
        RearPowerTimestamp = system_timestamp_us
    elseif (signals["ID2E5FrontInverterPower.FrontPower2E5"] ~= nil)  then
        FrontPower = signals["ID2E5FrontInverterPower.FrontPower2E5"]
        FrontPowerTimestamp = system_timestamp_us
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


