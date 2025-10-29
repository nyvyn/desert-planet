script.on_init(function()
  game.print("Welcome to Desert Planet.")
  for _, player in pairs(game.players) do
    player.teleport({0, 0}, "nauvis")
  end
end)
