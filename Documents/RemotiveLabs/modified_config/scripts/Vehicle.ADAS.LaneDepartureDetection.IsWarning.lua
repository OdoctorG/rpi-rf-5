local local_signals = {{
  name = "ID399DAS_status.DAS_laneDepartureWarning",
  namespace = "ChassisBus"
}}

-- Required, declare which input is needed to operate this program.
function input_signals()
  return local_signals
end

-- Provided parameters are used for populating metadata when listing signals.
function output_signals()
  return "Vehicle.ADAS.LaneDepartureDetection.IsWarning"
end

-- Invoked when ANY signal declared in "local_signals" arrive
-- @param signals_timestamp_us: signal time stamp
-- @param system_timestamp_us
-- @param signals: array of signals containing all or a subset of signals declared in "local_signals". Make sure to nil check before use.
function signals(signals, namespace, signals_timestamp_us, system_timestamp_us)
  -- VAL_ 921 DAS_laneDepartureWarning 1 "LEFT_WARNING" 3 "LEFT_WARNING_SEVERE" 0 "NONE" 2 "RIGHT_WARNING" 4 "RIGHT_WARNING_SEVERE" 5 "SNA" ;
  laneDepartureWarning = signals["ID399DAS_status.DAS_laneDepartureWarning"]
  if laneDepartureWarning == 1 then
    return return_value_or_bytes(1)
  elseif laneDepartureWarning == 3 then
    return return_value_or_bytes(1)
  elseif laneDepartureWarning == 2 then
    return return_value_or_bytes(1)
  elseif laneDepartureWarning == 4 then
    return return_value_or_bytes(1)
  else
      return return_value_or_bytes(0)
  end 
end

-- helper return function, make sure to use return_value_or_bytes or return_nothing.
function return_value_or_bytes(value_or_bytes)
  return value_or_bytes
end
