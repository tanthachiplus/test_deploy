# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

config :test_deploy, TestDeploy.Repo,
  username: "tse_app",
  password: "Abcd#123456789",
  database: "tsedb",
  hostname: "10.255.243.85",
  port: 1521,
  pool_size: 15

  config :test_deploy, TestDeployWeb.Endpoint,
  server: true,
  http: [port: 8888],
  check_origin: false,
  url: [host: "localhost", theme: "http"],
  secret_key_base: "VdEaZh0DFVDEeLHSzlKrMx5k/EmXSZPL1SUnUVo54SjfvvVf87FOcMFBS0KELNEF",
  live_view: [signing_salt: "fOLDeUr4X"],
  code_reloader: false
