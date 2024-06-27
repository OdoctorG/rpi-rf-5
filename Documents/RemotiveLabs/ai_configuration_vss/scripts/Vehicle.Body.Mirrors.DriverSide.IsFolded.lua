local local_signals = {{
    name = "ID102VCLEFT_doorStatus.VCLEFT_mirrorFoldState",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Body.Mirrors.DriverSide.IsFolded"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    --VCLEFT_mirrorFoldState 1 "MIRROR_FOLD_STATE_FOLDED" 3 "MIRROR_FOLD_STATE_FOLDING" 2 "MIRROR_FOLD_STATE_UNFOLDED" 4 "MIRROR_FOLD_STATE_UNFOLDING" 0 "MIRROR_FOLD_STATE_UNKNOWN" ;
    if signals["ID102VCLEFT_doorStatus.VCLEFT_mirrorFoldState"] ~= nil then
        if signals["ID102VCLEFT_doorStatus.VCLEFT_mirrorFoldState"] == 1 then
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
