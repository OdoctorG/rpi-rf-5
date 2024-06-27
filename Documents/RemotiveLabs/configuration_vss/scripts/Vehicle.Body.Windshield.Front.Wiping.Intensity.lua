local local_signals = {{
    name = "ID2E1VCFRONT_status.VCFRONT_wiperSpeed",
    namespace = "VehicleBus"
}}
--local local_frequecy_hz = 0

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Body.Windshield.Front.Wiping.Intensity"
end

-- Required, declare what frequence you like to get "timer" invoked. 0 means no calls to "timer".
--function timer_frequency_hz()
--    return local_frequecy_hz
--end

-- Invoked with the frequecy returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp 
--function timer(system_timestamp_us)
--    return return_value_or_bytes("your value")
--end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)

    -- From tesla dbc file
    --VAL_ 737 VCFRONT_wiperSpeed 
    -- 2 "WIPER_SPEED_1"               
    -- 3 "WIPER_SPEED_2" 
    -- 4 "WIPER_SPEED_3"          
    -- 5 "WIPER_SPEED_4" 
    -- 6 "WIPER_SPEED_5" 
    -- 8 "WIPER_SPEED_HIGH" 
    -- 7 "WIPER_SPEED_LOW" 
    -- 1 "WIPER_SPEED_OFF"       
    -- 0 "WIPER_SPEED_SNA" ;
    
    -- VSS
    -- Windshield.Wiping.Intensity:
    --   datatype: uint8
    --   type: actuator
    --   description: Relative intensity/sensitivity for interval and rain sensor mode as requested by user/driver.
    --           Has no significance if Windshield.Wiping.Mode is OFF/SLOW/MEDIUM/FAST
    --           0 - wipers inactive.
    --           1 - minimum intensity (lowest frequency/sensitivity, longest interval).
    --           2/3/4/... - higher intensity (higher frequency/sensitivity, shorter interval).
    --           Maximum value supported is vehicle specific.
    
    -- Simply send value -1 for all signals except 0 and 7
    if signals["ID2E1VCFRONT_status.VCFRONT_wiperSpeed"] == 0 then
        return 0
    elseif signals["ID2E1VCFRONT_status.VCFRONT_wiperSpeed"] == 7 then
        return 1    
    else
        return signals["ID2E1VCFRONT_status.VCFRONT_wiperSpeed"] - 1
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