local local_signals = {{
    name = "ID399DAS_status.DAS_autopilotState",
    namespace = "ChassisBus"
}}

local activeAutonomyLevel = "SAE_0"

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.ADAS.ActiveAutonomyLevel"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- TODO: test
    autopilotState = signals["ID399DAS_status.DAS_autopilotState"]
    if autopilotState == 9 then -- "ABORTED"
        activeAutonomyLevel = "SAE_0"
    elseif autopilotState == 8 then -- "ABORTING"
        if activeAutonomyLevel == "SAE_2" then
            activeAutonomyLevel = "SAE_2_DISENGAGING"
        elseif activeAutonomyLevel == "SAE_3" then
            activeAutonomyLevel = "SAE_3_DISENGAGING"
        elseif activeAutonomyLevel == "SAE_4" then
            activeAutonomyLevel = "SAE_4_DISENGAGING"
        elseif activeAutonomyLevel == "SAE_5" then
            activeAutonomyLevel = "SAE_5_DISENGAGING"
        else
            activeAutonomyLevel = "SAE_0"
        end
    elseif autopilotState == 5 then -- "ACTIVE_NAV"
        activeAutonomyLevel = "SAE_2" -- TOD
    elseif autopilotState == 3 then -- "ACTIVE_NOMINAL"
        activeAutonomyLevel = "SAE_2" -- TOD
    elseif autopilotState == 4 then -- "ACTIVE_RESTRICTED"
        activeAutonomyLevel = "SAE_2" -- TOD
    elseif autopilotState == 2 then -- "AVAILABLE"
        activeAutonomyLevel = "SAE_0"
    elseif autopilotState == 0 then -- "DISABLED"
        activeAutonomyLevel = "SAE_0"
    elseif autopilotState == 14 then -- "FAULT"
        activeAutonomyLevel = "SAE_0"
    elseif autopilotState == 15 then -- "SNA"
        activeAutonomyLevel = "SAE_0"
    elseif autopilotState == 1 then -- "UNAVAILABLE"
        activeAutonomyLevel = "SAE_0"
    end

    return return_value_or_bytes(activeAutonomyLevel)
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end
