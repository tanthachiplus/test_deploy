defmodule TestDeploy.Repo do
  use Ecto.Repo,
    otp_app: :test_deploy,
    adapter: Ecto.Adapters.Jamdb.Oracle
end
