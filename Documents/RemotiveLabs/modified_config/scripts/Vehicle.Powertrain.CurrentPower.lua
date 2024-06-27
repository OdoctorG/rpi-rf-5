local local_signals = {{
    name = "ID3D2TotalChargeDischarge.TotalDischargeKWh3D2",
    namespace = "VehicleBus"
}, {
    name = "ID3D2TotalChargeDischarge.TotalChargeKWh3D2",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    -- unit W
    return "Vehicle.Powertrain.CurrentPower"

end
local previous_time = 0
local previous_system_time = 0
local previous_discharge = 0
local previous_charge = 0
local currentPower = 0


-- Required, declare what frequence you like to get "timer" invoked. 0 means no calls to "timer".
function timer_frequency_hz()
    return 0
end

-- Invoked with the frequecy returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp 
function timer(system_timestamp_us)
    return return_nothing()
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)

    diff_time = signals_timestamp_us - previous_time
    if (previous_time == 0) then
        previous_time = signals_timestamp_us
        previous_discharge = signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"]
        previous_charge = signals["ID3D2TotalChargeDischarge.TotalChargeKWh3D2"]
    elseif (previous_system_time > 0 and system_timestamp_us - previous_system_time > 1100000) then
        previous_time = 0
        previous_discharge = 0
        previous_charge = 0
        currentPower = 0
    else

        -- calculating "current W" as "W used / s"
        diff_discharge = signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"] - previous_discharge
        diff_charge = signals["ID3D2TotalChargeDischarge.TotalChargeKWh3D2"] - previous_charge
        -- kWh to Wh => * 1000
        -- us to s => * 1000000
        -- Wh to Ws => * 3600
        currentPower = 1000 * 3600 * ((1000000 * (diff_charge - diff_discharge)) / diff_time)

        if (diff_time > 1000000) then
            previous_time = signals_timestamp_us
            previous_discharge = signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"]
            previous_charge = signals["ID3D2TotalChargeDischarge.TotalChargeKWh3D2"]
        end
        return return_value_or_bytes(currentPower)
    end

    -- handle seek
    previous_system_time = system_timestamp_us

    return return_nothing()
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_nothing()
    return
end
