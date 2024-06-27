

local local_signals = {{
    name = "ID273UI_vehicleControl.UI_wiperRequest",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

print(input_signals()[1].name)

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Body.Windshield.Front.Wiping.Mode"
end


-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- From tesla dbc file
    -- VAL_ 627 UI_wiperRequest 
    -- 2 "WIPER_REQUEST_AUTO" 
    -- 6 "WIPER_REQUEST_FAST_CONTINUOUS" 
    -- 4 "WIPER_REQUEST_FAST_INTERMITTENT" 
    -- 1 "WIPER_REQUEST_OFF" 
    -- 5 "WIPER_REQUEST_SLOW_CONTINUOUS" 
    -- 3 "WIPER_REQUEST_SLOW_INTERMITTENT" 
    -- 0 "WIPER_REQUEST_SNA" ;  
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
    
    -- Windshield.Wiping.Mode:
    -- datatype: string
    -- type: actuator
    -- allowed: ['OFF', 'SLOW', 'MEDIUM', 'FAST', 'INTERVAL', 'RAIN_SENSOR']
    -- description: Wiper mode requested by user/driver.
    --              INTERVAL indicates intermittent wiping, with fixed time interval between each wipe.
    --               RAIN_SENSOR indicates intermittent wiping based on rain intensity.
    
   if signals["ID273UI_vehicleControl.UI_wiperRequest"] == 0 then
        return "OFF"
    elseif signals["ID273UI_vehicleControl.UI_wiperRequest"] == 1 then
        return "OFF"    
    elseif signals["ID273UI_vehicleControl.UI_wiperRequest"] == 2 then
        return "RAIN_SENSOR"
    elseif signals["ID273UI_vehicleControl.UI_wiperRequest"] == 3 then
        return "INTERVAL"
    elseif signals["ID273UI_vehicleControl.UI_wiperRequest"] == 4 then
        return "INTERVAL"
    elseif signals["ID273UI_vehicleControl.UI_wiperRequest"] == 5 then
        return "SLOW"
    elseif signals["ID273UI_vehicleControl.UI_wiperRequest"] == 6 then
        return "FAST"
    else 
        return "OFF"
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
