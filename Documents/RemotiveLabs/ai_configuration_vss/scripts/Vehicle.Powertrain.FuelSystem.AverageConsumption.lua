
-- NOTICE --
-- This VSS signal is not intended for electric cars, but we use it anyway!
-- It should be fuel consumption measured in l/100km, but we return kWh/100km


local local_signals = {{
    name = "ID3D2TotalChargeDischarge.TotalDischargeKWh3D2",
    namespace = "VehicleBus"
}, {
    name = "ID3B6odometer.Odometer3B6",
    namespace = "VehicleBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signal()
    -- unit Wh/km
    return "Vehicle.Powertrain.FuelSystem.AverageConsumption"
end

local local_frequecy_hz = 1

local start_odometer = 0
local odometer_diff = 0
local start_discharge = 0
local discharge_diff = 0


-- Required, declare what frequence you like to get "timer" invoked. 0 means no calls to "timer".
function timer_frequency_hz()
    return local_frequecy_hz
end

-- Invoked with the frequecy returned by "timer_frequency_hz".
-- @param system_timestamp_us: system time stamp 
function timer(system_timestamp_us)
    if ((odometer_diff ~= 0) and (discharge_diff ~= 0)) then
        -- return return_value_or_bytes(odometer_diff)
        return return_value_or_bytes((discharge_diff * 1000)/odometer_diff)
    end
        return return_nothing()
    -- return return_value_or_bytes(system_timestamp_us)
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)

    if (signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"] ~= nil) then
        if (start_discharge == 0) then
            start_discharge = signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"]
        else
            discharge_diff = signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"] - start_discharge

            -- handle seek backwards
            if (discharge_diff < 0) then
                start_discharge = signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"]
                discharge_diff = 0
            end
        end
        -- return return_nothing()
    elseif (signals["ID3B6odometer.Odometer3B6"] ~= nil) then
        if (start_odometer == 0) then
            start_odometer = signals["ID3B6odometer.Odometer3B6"]
        else
            odometer_diff = signals["ID3B6odometer.Odometer3B6"] - start_odometer

            -- handle seek backwards
            if (odometer_diff < 0) then
                start_odometer = signals["ID3B6odometer.Odometer3B6"]
                odometer_diff = 0
            end
        end
        -- return return_nothing()
    end
    return return_nothing()

    -- TODO - replace this code with what you want todo

    -- if signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"] == 0 then
    --     return return_value_or_bytes(0)
    -- else
    -- return return_value_or_bytes("hejsan")
    -- return return_value_or_bytes(signals["ID3D2TotalChargeDischarge.TotalDischargeKWh3D2"])
    -- if 
    -- return return_value_or_bytes(signals["ID3B6odometer.Odometer3B6"])
    -- end
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
    return value_or_bytes
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_nothing()
    return
end
