#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Ensure SSH keys
# @raycast.mode inline

# Optional parameters:
# @raycast.icon 🔑
# @raycast.refreshTime 10m

# Documentation:
# @raycast.description Checks the SSH agent every 10 minutes and adds any keys from ~/.ssh that aren't loaded yet. Only adds keys that can be added without prompting (passphrase stored in the macOS keychain, or no passphrase).
# @raycast.author sedlacek-martin
# @raycast.authorURL https://raycast.com/sedlacek-martin

ssh_dir="$HOME/.ssh"

# Fingerprints of keys already in the agent.
loaded="$(ssh-add -l 2>/dev/null)"

total=0
present=0
added=0

for pub in "$ssh_dir"/*.pub; do
    [ -e "$pub" ] || continue          # no .pub files → skip the glob literal
    key="${pub%.pub}"
    [ -f "$key" ] || continue          # public key without a matching private key

    total=$((total + 1))

    fingerprint="$(ssh-keygen -lf "$pub" 2>/dev/null | awk '{print $2}')"
    if [ -n "$fingerprint" ] && printf '%s\n' "$loaded" | grep -qF "$fingerprint"; then
        present=$((present + 1))
        continue
    fi

    # Add non-interactively: succeeds silently for keychain-stored or
    # passphrase-less keys, and fails fast (rather than prompting) for any
    # key that would need interactive passphrase entry.
    if SSH_ASKPASS_REQUIRE=never ssh-add --apple-use-keychain "$key" </dev/null >/dev/null 2>&1; then
        present=$((present + 1))
        added=$((added + 1))
    fi
done

if [ "$total" -eq 0 ]; then
    echo "🔑 No SSH keys found in ~/.ssh"
elif [ "$added" -gt 0 ]; then
    echo "🔑 $present/$total keys loaded ($added added)"
else
    echo "🔑 $present/$total keys loaded"
fi
