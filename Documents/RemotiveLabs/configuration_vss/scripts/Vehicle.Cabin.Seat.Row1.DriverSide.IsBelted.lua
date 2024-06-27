local local_signals = {{
    name = "ID3A1VCFRONT_vehicleStatus.VCFRONT_driverBuckleStatus",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Cabin.Seat.Row1.DriverSide.IsBelted"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- VAL_ 929 VCFRONT_driverBuckleStatus 1 "BUCKLED" 0 "UNBUCKLED" ;
    if return_value_or_bytes(signals["ID3A1VCFRONT_vehicleStatus.VCFRONT_driverBuckleStatus"]) == 1 then
        return return_value_or_bytes(1) -- TODO: true
    else
        return return_value_or_bytes(0) -- TODO: false
    end
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
