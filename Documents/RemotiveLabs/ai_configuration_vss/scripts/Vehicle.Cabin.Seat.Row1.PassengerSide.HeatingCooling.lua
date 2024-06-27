local local_signals = {{
    name = "ID273UI_vehicleControl.UI_frontRightSeatHeatReq",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Cabin.Seat.Row1.PassengerSide.HeatingCooling"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- UI_frontLeftSeatHeatReq 1 "HEATER_REQUEST_LEVEL1" 2 "HEATER_REQUEST_LEVEL2" 3 "HEATER_REQUEST_LEVEL3" 0 "HEATER_REQUEST_OFF" ;
    if signals["ID273UI_vehicleControl.UI_frontRightSeatHeatReq"] ~= nil then
        
        return return_value_or_bytes(math.floor(100*(signals["ID273UI_vehicleControl.UI_frontRightSeatHeatReq"]/3)))
    end
    return return_nothing()
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
