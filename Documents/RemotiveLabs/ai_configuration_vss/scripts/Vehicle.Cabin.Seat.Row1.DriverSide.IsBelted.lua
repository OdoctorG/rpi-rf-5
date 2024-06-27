local local_signals = {{
    name = "ID3C2VCLEFT_switchStatus.VCLEFT_frontBuckleSwitch",
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
    -- VCLEFT_frontBuckleSwitch 3 "SWITCH_FAULT" 1 "SWITCH_OFF" 2 "SWITCH_ON" 0 "SWITCH_SNA" ;
    if signals["ID3C2VCLEFT_switchStatus.VCLEFT_frontBuckleSwitch"] ~= nil then
        if return_value_or_bytes(signals["ID3C2VCLEFT_switchStatus.VCLEFT_frontBuckleSwitch"]) == 2 then
            return return_value_or_bytes(1) -- TODO: true
        else
            return return_value_or_bytes(0) -- TODO: false
        end
    end
    return return_nothing()
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
