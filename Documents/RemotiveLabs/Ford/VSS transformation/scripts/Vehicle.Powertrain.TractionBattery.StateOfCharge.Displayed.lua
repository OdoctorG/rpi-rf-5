-- Vehicle.Powertrain.Battery.StateOfCharge.Displayed:
--     type: attribute
--     datatype: float
--     description: "Battery SOC in Percent"
--     vtp:
--         bus: HS1
--         message: Battery_Mgmt_3
--         signal: BSBattSOC

local local_signals = {{
    name = "Battery_Mgmt_3.BSBattSOC",
    namespace = "HS1"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
    return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
    return "Vehicle.Powertrain.TractionBattery.StateOfCharge.Displayed"
end

function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
    return signals["Battery_Mgmt_3.BSBattSOC"]
end
