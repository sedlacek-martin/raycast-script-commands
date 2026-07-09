#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add SSH keys
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🔑

# Documentation:
# @raycast.description Adds my ssh keys to the SSH agent
# @raycast.author sedlacek-martin
# @raycast.authorURL https://raycast.com/sedlacek-martin

ssh-add --apple-use-keychain ~/.ssh/id_ed25519_personal
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_jobleads_martin