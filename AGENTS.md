# Repository Guidelines

## Project Structure & Assets
- Core mod metadata lives in `info.json`; keep the version aligned with the packaged zip name (`desert-planet_<version>.zip`).
- Factorio requires scenarios inside `scenarios/`; the primary content is in `scenarios/sand-world/` with `map_gen_settings.lua`, `map_settings.lua`, and `control.lua`. Add new scenarios as `scenarios/<name>/`.
- Map-gen presets are appended in `data-updates.lua` by cloning `data.raw["map-gen-presets"].default.presets.default`; adjust only existing fields (e.g., `water`, tree controls) to stay schema-compliant.
- Localisation strings go in `locale/en/locale.cfg` (mod strings) and `scenarios/sand-world/locale/` (scenario text). Add new keys rather than overwriting existing ones.
- Packaging utilities (`ZipMod.py`, `CopyMod.py`, `ZipAndCopyMod.py`) live at the repo root; keep helper scripts here for easy invocation.

## Build, Test & Deployment Commands
- `python ZipMod.py` — Creates the distributable zip in the repo root using `info.json` for naming.
- `python CopyMod.py` — Copies the most recent zip into the OS-specific Factorio mods directory (creates it if needed).
- `python ZipAndCopyMod.py` — Runs both steps above; preferred during active iteration.
- After copying, launch Factorio → Play → Scenarios → Desert Planet → Sand World to verify the scenario boots without water or trees. Also check Map Generator → Presets for “Desert Planet” and confirm it selects “water = none”.

## Coding Style & Naming Conventions
- Lua: two-space indentation, trailing commas only where Factorio prototypes expect them, and table keys ordered logically (terrain first, autoplace details beneath).
- Python: follow PEP 8 with four-space indentation; keep functions short and raise precise exceptions on error paths.
- File and directory names are lowercase with hyphens (`desert-planet`, `sand-world`); avoid spaces to match Factorio packaging expectations.

## Testing Guidelines
- Manual verification is required: load the scenario on a fresh save, confirm water tiles are absent, trees do not spawn, and the welcome message appears once.
- When validating presets, create a new map with the “Desert Planet” preset and ensure the generated terrain matches the scenario (dry world, no forests, hot temperatures).
- When altering scenario settings, review both `map_gen_settings.lua` and `map_settings.lua` to keep gameplay rules in sync.
- If you add scripted behaviour, use `script.on_init`/`on_event` handlers and include a short comment describing the trigger.

## Commit & Pull Request Guidelines
- Use Conventional Commits (per `.releaserc`): e.g. `feat: add oasis mini-scenario` or `locale: update welcome strings`.
- Each PR should note Factorio version tested, commands run (`python ZipAndCopyMod.py`), and any gameplay screenshots if visuals changed.
- Update `changelog.txt` only when preparing a release; otherwise leave it to the automated pipeline.
