## Scenario structure
Scenarios have a wiki page (https://wiki.factorio.com/Scenario_system) with the following naming convention:
- "control.lua" - (optional) runtime code
- "image.png" - (optional) used as preview image of the scenario
- "image_space_age.png" - (optional) used as preview image of the scenario when SA is enabled
- "locale" dir - (optional) for all the localisations (worth mentioning that localisation of "scenario-name" and 
"scenario-description" supports both "scenario-name" and "scenario-name-space-age" / "scenario-description", "scenario-description-space-age")
- "blueprint.zip" - (optional) the map's zip used in this scenario
- "description.json" (mandatory) - keys as described in https://wiki.factorio.com/Scenario_system

## Campaigns structure
Campaigns are a collection of scenarios basically, although campaigns dont have an official wiki reference, by looking at base's structure, here's the presumed structure of it:

Campaign structure:
- "locale" dir - (optional) for all the localisations, supports default keys "name", "description" (with SA variants),
probably supports "[levels]" localisation group as well to rename each campaign's level
- "image.png" - (optional) used as preview image of the scenario
- "image_space_age.png" - (optional) used as preview image of the scenario when SA is enabled
- "lualib" dir - (optional) a directory to store other files that is ignored by the campaign's levels list
- "*/" - any number of folders containing the levels, no specific naming convention
- "description.json" (mandatory) - describes the properties of this campaign, in particular:
  - "starting-level" - Undocumented- string - Default 1st level alphabetically sorted
  - "is-main-game" - boolean - Default: false
  - "multiplayer-compatible" - boolean - Default: false
  - "order" - Order
  - "difficulties" - Undocumented - Array of strings [ "easy", "normal", "hard" ]?

Campaign's Level structure:
- "locale" dir - (optional) for all the localisations (no default keys for level's name or description)
- "control.lua" - (optional) runtime code
- "blueprint.zip" - (optional) the map's zip used in this level
- no "image/image_SA.png" are supported, campaign's top level image/image_SA are used instead