local local_signals = {{
    name = "ID228EPBrightStatus.EPBRunitStatus228",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Chassis.ParkingBrake.IsEngaged"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- EPBRunitStatus228 10 "Disengaging" 8 "Engaging" 3 "ParkEngaged" 1 "DriveReleased"  
    if signals["ID228EPBrightStatus.EPBRunitStatus228"] ~= nil then
        if signals["ID228EPBrightStatus.EPBRunitStatus228"] == 3 then
            return return_value_or_bytes(1)
        else
            return return_value_or_bytes(0)
    end
    return return_nothing()
end
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
