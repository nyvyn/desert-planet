local map_gen_presets = data.raw["map-gen-presets"]

if map_gen_presets and map_gen_presets.default and map_gen_presets.default.presets then
  local source = map_gen_presets.default.presets.default
    or map_gen_presets.default.presets["default"]
    or {}

  local preset = table.deepcopy(source)
  preset.order = "z[desert-planet]"

  local basic = preset.basic_settings or {}

  if basic.water ~= nil then
    basic.water = "none"
  end

  local controls = basic.autoplace_controls
  if controls then
    controls.trees = controls.trees or {}
    controls.trees.frequency = "none"
  end

  basic.property_expression_names = basic.property_expression_names or {}
  basic.property_expression_names.temperature = "2 * noise_layer_temperature + 40"
  basic.property_expression_names.moisture = "noise_layer_moisture - 0.7"
  basic.property_expression_names.aux = "noise_layer_aux + 0.6"

  preset.basic_settings = basic

  map_gen_presets.default.presets["desert-planet"] = preset
else
  log("Desert Planet: default map-gen presets unavailable; preset not registered.")
end
