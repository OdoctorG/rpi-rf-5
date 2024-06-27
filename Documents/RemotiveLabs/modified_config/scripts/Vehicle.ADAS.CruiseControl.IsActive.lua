local local_signals = {{
    name = "ID399DAS_status.DAS_autopilotState",
    namespace = "ChassisBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.ADAS.CruiseControl.IsActive"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    autopilotState = signals["ID399DAS_status.DAS_autopilotState"]
    if autopilotState == 9 then -- "ABORTED"
        return return_value_or_bytes(0)
    elseif autopilotState == 8 then -- "ABORTING"
        return return_value_or_bytes(0)
    elseif autopilotState == 5 then -- "ACTIVE_NAV"
        return return_value_or_bytes(1)
    elseif autopilotState == 3 then -- "ACTIVE_NOMINAL"
        return return_value_or_bytes(1)
    elseif autopilotState == 4 then -- "ACTIVE_RESTRICTED"
        return return_value_or_bytes(1)
    elseif autopilotState == 2 then -- "AVAILABLE"
        return return_value_or_bytes(0)
    elseif autopilotState == 0 then -- "DISABLED"
        return return_value_or_bytes(0)
    elseif autopilotState == 14 then -- "FAULT"
        return return_value_or_bytes(0)
    elseif autopilotState == 15 then -- "SNA"
        return return_value_or_bytes(0)
    elseif autopilotState == 1 then -- "UNAVAILABLE"
        return return_value_or_bytes(0)
    else
        return return_value_or_bytes(0)
    end
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
