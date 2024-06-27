
--
-- Docs available at https://docs.remotivelabs.com/docs/remotive-broker/scripted_signals
--

local local_signals = {
    {
        name = "ID376FrontInverterTemps.TempStator376", -- front motor temperature at the stators
        namespace = "VehicleBus"
    },
    {
        name = "ID315RearInverterTemps.RearTempStator315", -- rear motor temperature at the stators
        namespace = "VehicleBus"
    }
}

local local_frequecy_hz = 0
local RearTemp = 0
local RearTempTimestamp = 0
local FrontTemp = 0
local FrontTempTimestamp = 0

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    return "Vehicle.Powertrain.ElectricMotor.Temperature"
end

-- Required, declare what frequency you like to get "timer" invoked. 0 means no calls to "timer".
function timer_frequency_hz()
    return local_frequecy_hz
end

-- Invoked with the frequency returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp
function timer(system_timestamp_us)
    return return_nothing()
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- Compute the combined power of both motors.
    
    if (signals["ID315RearInverterTemps.RearTempStator315"] ~= nil) then
        RearTemp = signals["ID315RearInverterTemps.RearTempStator315"]
        RearTempTimestamp = system_timestamp_us
    elseif (signals["ID376FrontInverterTemps.TempStator376"] ~= nil)  then
        FrontTemp = signals["ID376FrontInverterTemps.TempStator376"]
        FrontTempTimestamp = system_timestamp_us
    end
    
    -- Check that the time difference between signals is not to large and that the signal is not from the future.
    local time_diff = RearTempTimestamp-FrontTempTimestamp
    local signal_age = system_timestamp_us-RearTempTimestamp
    if (math.abs(time_diff) < 1000000 and signal_age >= 0 and signal_age <= 1000000) then
        return return_value_or_bytes(math.max(FrontTemp,RearTemp))
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


