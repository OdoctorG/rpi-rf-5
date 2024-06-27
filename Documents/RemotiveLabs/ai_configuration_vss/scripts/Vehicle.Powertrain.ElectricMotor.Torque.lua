
--
-- Docs available at https://docs.remotivelabs.com/docs/remotive-broker/scripted_signals
--

local local_signals = {
    {
        name = "ID1D5FrontTorque.FrontTorque1D5", -- front motor torque
        namespace = "VehicleBus"
    },
    {
        name = "ID1D8RearTorque.RearTorque1D8", -- rear motor torque
        namespace = "VehicleBus"
    }
}

local local_frequecy_hz = 0
local RearTorque = 0
local RearTorqueTimestamp = 0
local FrontTorque = 0
local FrontTorqueTimestamp = 0

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    return "Vehicle.Powertrain.ElectricMotor.Torque"
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
    
    if (signals["ID1D8RearTorque.RearTorque1D8"] ~= nil) then
        RearTorque = signals["ID1D8RearTorque.RearTorque1D8"]
        RearTorqueTimestamp = system_timestamp_us
    elseif (signals["ID1D5FrontTorque.FrontTorque1D5"] ~= nil)  then
        FrontTorque = signals["ID1D5FrontTorque.FrontTorque1D5"]
        FrontTorqueTimestamp = system_timestamp_us
    end
    
    -- Check that the time difference between signals is not to large and that the signal is not from the future.
    local time_diff = RearTorqueTimestamp-FrontTorqueTimestamp
    local signal_age = system_timestamp_us-RearTorqueTimestamp
    if (math.abs(time_diff) < 1000000 and signal_age >= 0 and signal_age <= 1000000) then
        return return_value_or_bytes(FrontTorque+RearTorque)
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


