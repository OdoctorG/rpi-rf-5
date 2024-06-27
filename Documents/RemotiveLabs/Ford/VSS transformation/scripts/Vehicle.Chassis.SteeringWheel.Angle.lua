-- Vehicle.Chassis.SteeringWheel.Angle
--     type: attribute
--     datatype: float
--     description: "Steering wheel angle in degrees."
--     vtp:
--         bus: HS1
--         message: ParkAid_Data_HS1
--         signal: ExtSteeringAngleReq2

local local_signals = {{
    name = "ParkAid_Data_HS1.ExtSteeringAngleReq2",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Chassis.SteeringWheel.Angle"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["ParkAid_Data_HS1.ExtSteeringAngleReq2"]
end
