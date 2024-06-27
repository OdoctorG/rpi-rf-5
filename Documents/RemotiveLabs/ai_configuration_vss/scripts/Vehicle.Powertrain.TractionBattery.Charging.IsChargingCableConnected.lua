local local_signals = {{
    name = "ID25DCP_status.CP_chargeCableState",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Powertrain.TractionBattery.Charging.IsChargingCableConnected"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- CP_chargeCableState 2 "CHARGE_CABLE_CONNECTED" 1 "CHARGE_CABLE_NOT_CONNECTED" 0 "CHARGE_CABLE_UNKNOWN_SNA"
    if signals["ID25DCP_status.CP_chargeCableState"] ~= nil then
        if signals["ID25DCP_status.CP_chargeCableState"] == 2 then
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
