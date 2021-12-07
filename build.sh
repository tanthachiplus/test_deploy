export PATH="$PATH:/home/system/elixir/bin"
export SECRET_KEY_BASE=`mix phx.gen.secret 64`

# Stop previous run
sudo  _build/prod/rel/test_deploy/bin/test_deploy stop

# Remove the existing release directory and build the release
sudo rm -rf "_build"

#!/usr/bin/env bash
# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Compile assets
mix assets.deploy

# Release
MIX_ENV=prod mix release
# sudo  _build/prod/rel/test_deploy/bin/test_deploy daemon_iex