-- Vehicle.Chassis.Axle.Row1.Wheel.Right.Tire.Pressure:
--     type: attribute
--     datatype: float
--     description: "RR Tire Pressure. kilopascal"
--     vtp:
--         bus: HS1
--         message: Tire_Pressure_Data
--         signal: Tire_Press_RR_ORR_Data

local local_signals = {{
    name = "Tire_Pressure_Data.Tire_Press_RR_ORR_Data",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Chassis.Axle.Row2.Wheel.Right.Tire.Pressure"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["Tire_Pressure_Data.Tire_Press_RR_ORR_Data"]
end
