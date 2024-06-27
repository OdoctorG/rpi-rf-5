local local_signals = {{
    name = "ID101RCM_inertial1.RCM_yawRate",
    namespace = "ChassisBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    -- remianing meters
    return "Vehicle.AngularVelocity.Yaw"
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
    -- Convert from rad/s to deg/s
    -- RCM_yawRate 32768 "SNA"
    if (signals["ID101RCM_inertial1.RCM_yawRate"] ~= nil and signals["ID101RCM_inertial1.RCM_yawRate"] ~= 32768*0.0001) then
        return return_value_or_bytes(signals["ID101RCM_inertial1.RCM_yawRate"] * 57.2957795)
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
