local local_signals = {{
    name = "Battery_Traction_1.BattTrac_U_Actl",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Powertrain.TractionBattery.CurrentVoltage"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["Battery_Traction_1.BattTrac_U_Actl"]
end
