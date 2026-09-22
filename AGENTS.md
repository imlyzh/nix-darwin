# Repository Guidelines

## Project Structure

This is a [nix-darwin](https://github.com/nix-darwin/nix-darwin) flake that configures a macOS machine (user `lyzh`, host `mac`). All source lives at the repository root; there are no tests or asset directories.

- `flake.nix` — entry point: declares inputs (nixpkgs, nix-darwin, home-manager, rime-ice, dotfiles, …) and `darwinConfigurations` such as `mac`, `homebrew`, `lyzh-mac`, and their no-brew variants.
- `configuration.nix` — system settings: nix options, users, packages, environment variables, Touch ID, Finder/Dock defaults, fonts.
- `darwin-home.nix` — home-manager settings: shell, editor, session variables.
- `homebrew.nix` — Homebrew casks, grouped by purpose with comments.
- `flake.lock` — pinned input revisions; commit whenever inputs change.

## Build, Test, and Development Commands

- `sudo darwin-rebuild switch --flake .#mac` — apply the system configuration (use `.#lyzh-mac` for the variant managed by home-manager).
- `home-manager switch --flake .#mac` — apply the home-manager configuration only.
- `nix flake check` — evaluate the flake and check all outputs; run before pushing changes.
- `nix build .#darwinConfigurations.mac.system` — build the system derivation without applying it.
- `nix flake update <input>` — bump one dependency and refresh `flake.lock`.

## Coding Style & Naming Conventions

- Nix, two-space indentation; no trailing semicolons after the final attribute.
- Comment out options you want to keep but disable (`# autohide = true;`) instead of deleting them.
- Keep option paths dotted (`system.defaults.dock`) and group related settings with `#` comments.
- Name module files in kebab-case (`darwin-home.nix`) and configuration attrs as `host` or `user-host` (`lyzh-mac`).
- No formatter or linter is configured; match the surrounding file's style.

## Testing Guidelines

There is no unit test suite. Treat `nix flake check` as the primary validation gate, then verify behavior with `darwin-rebuild switch` on a test machine. Keep changes small and single-purpose so regressions are easy to bisect.

## Commit & Pull Request Guidelines

Git history follows Conventional Commits:

- `feat: add ghostty cask`, `feat(darwin): ...`, `feat(home): ...`, `feat(dock): ...`, `fix: ...`
- Dependency bumps use `chore(deps): update flake.lock dependencies`.

PRs should describe what changed and why, note expected machine impact (packages installed, defaults altered), and include a screenshot when a UI-facing setting changes.

## Agent-Specific Instructions

Only edit files in scope of the requested task, run `nix flake check` after changes when network access allows, and never delete commented-out options unless the task explicitly asks.
