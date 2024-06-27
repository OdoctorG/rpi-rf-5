-- CurrentCurrent:
--   datatype: float
--   type: sensor
--   unit: A
--   description: Current current flowing in/out of battery. Positive = Current flowing in to battery, e.g. during charging.
--                Negative = Current flowing out of battery, e.g. during driving.

local local_signals = {{
    name = "Battery_Traction_1.BattTrac_I_Actl",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Powertrain.TractionBattery.CurrentCurrent"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return -1 * signals["Battery_Traction_1.BattTrac_I_Actl"]
end
