# Raycast Script Commands

A personal collection of [Raycast](https://www.raycast.com/) script commands I use on macOS — small scripts that run directly from Raycast to automate everyday tasks.

## What are script commands?

[Script Commands](https://github.com/raycast/script-commands) let you run shell, AppleScript, and other scripts from Raycast. Each script carries `@raycast.*` metadata comments in its header that tell Raycast how to display and run it (title, icon, execution mode, refresh interval, etc.).

## Commands

| Command | Icon | Mode | Description |
| --- | :---: | --- | --- |
| **Add SSH keys** | 🔑 | `fullOutput` | Adds my SSH keys to the SSH agent (with the passphrases stored in the macOS keychain). |
| **Ensure SSH keys** | 🔑 | `inline` | Runs every 10 minutes and adds any keys from `~/.ssh` that aren't loaded yet. Only adds keys that can be loaded without prompting (keychain-stored or passphrase-less), and reports how many are loaded. |
| **Paste Clean** | 🧹 | `silent` | Cleans the clipboard before pasting: strips leading whitespace from each line and collapses runs of blank lines into a single one, then pastes. |
| **Toggle Hidden Files** | 👓 | `silent` | Shows/hides dotfiles and hidden folders in Finder (e.g. `.ssh`, `.bashrc`) and restarts Finder. |

The `_old/` folder holds retired scripts (Dayflow automation) that are kept around for reference but are no longer in active use.

## Setup

1. In Raycast, open **Extensions → Script Commands** (or run the *Script Commands* command).
2. Add this repository's directory as a script directory.
3. The commands appear in Raycast root search by their titles above.

Some commands assume a specific local setup:

- **Add SSH keys** references specific key files (`id_ed25519_personal`, `id_ed25519_jobleads_martin`) — adjust these to match your own `~/.ssh` filenames.
- **Ensure SSH keys** is generic: it scans `~/.ssh` for any key with a matching `.pub` file, so it works without editing. It runs on a `refreshTime` schedule, so it must be enabled as a background command in Raycast.

## Requirements

- macOS with [Raycast](https://www.raycast.com/) installed.
- SSH commands rely on `ssh-add`, `ssh-keygen`, and the `--apple-use-keychain` flag (macOS-specific).

## License

Personal scripts — use them freely.
