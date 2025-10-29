return {
  terrain_segmentation = "very-low",
  water = "none",
  autoplace_controls = {
    trees = { frequency = "none" }
  },
  property_expression_names = {
    temperature = "2 * noise_layer_temperature + 40",
    moisture = "noise_layer_moisture - 0.7",
    aux = "noise_layer_aux + 0.6"
  }
}
