-- Vehicle.Body.Lights.DirectionIndicator.Right.IsSignaling:
--     datatype: boolean
--     description: Indicates if right light is signaling or off. True = signaling. False = Off.
--     type: actuator
--     vtp:
--         bus: HS1
--         message: Steering_Data_HS1
--         signal: TurnLghtSwtch_D_Stat
--         transform: 
--             mapping: 
--             -   from: "Left"
--                 to: false
--             -   from: "Right"
--                 to: true
--             -   from: "Off"
--                 to: false

local local_signals = {{
    name = "Steering_Data_HS1.TurnLghtSwtch_D_Stat",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Body.Lights.DirectionIndicator.Right.IsSignaling"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    -- VAL_ 131 TurnLghtSwtch_D_Stat 3 "Unused_Treat_As_Off" 2 "Right" 1 "Left" 0 "Off" ;
    if signals["Steering_Data_HS1.TurnLghtSwtch_D_Stat"] == 2 then
        return 1
    else
        return 0
    end
end
