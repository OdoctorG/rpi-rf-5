local local_signals = {{
    name = "APIMGPS_Data_Nav_1.GPS_Longitude_Degrees",
    namespace = "HS3"
}, {
    name = "APIMGPS_Data_Nav_1.GPS_Longitude_Minutes",
    namespace = "HS3"
}, {
    name = "APIMGPS_Data_Nav_1.GPS_Longitude_Min_dec",
    namespace = "HS3"
}}
local local_frequecy_hz = 0
local state_of_charge = 0

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.CurrentLocation.Longitude"
end

-- Required, declare what frequency you like to get "timer" invoked. 0 means no calls to "timer".
function timer_frequency_hz()
    return local_frequecy_hz
end

-- Invoked with the frequecy returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp 
function timer(system_timestamp_us)
    -- return return_value_or_bytes(state_of_charge)
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    if (signals["APIMGPS_Data_Nav_1.GPS_Longitude_Degrees"] < 0) then
        return return_value_or_bytes(signals["APIMGPS_Data_Nav_1.GPS_Longitude_Degrees"] -
                                        signals["APIMGPS_Data_Nav_1.GPS_Longitude_Minutes"] / 60 -
                                        signals["APIMGPS_Data_Nav_1.GPS_Longitude_Min_dec"] / 60)
    else
        return return_value_or_bytes(signals["APIMGPS_Data_Nav_1.GPS_Longitude_Degrees"] +
                                        signals["APIMGPS_Data_Nav_1.GPS_Longitude_Minutes"] / 60 +
                                        signals["APIMGPS_Data_Nav_1.GPS_Longitude_Min_dec"] / 60)
    end

    -- state_of_charge = signals["ID352BMS_energyStatus.BMS_nominalEnergyRemaining"] / signals["ID352BMS_energyStatus.BMS_nominalFullPackEnergy"]
    -- return return_nothing()
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_nothing()
    return
end
