import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.
if config_env() == :prod do
  config :test_deploy, TestDeploy.Repo,
    # ssl: true,
    # socket_options: [:inet6],
    # show_sensitive_data_on_connection_error: true,
    # original Oracle test database
    database: System.get_env("DATABASE") || "orcl",
    username: System.get_env("USER_NAME_DATABASE") || "hr",
    password: System.get_env("PASS_DATABASE") || "oracle",
    hostname: System.get_env("HOST_DATABASE") || "10.255.241.181",
    # log: false,
    port: String.to_integer(System.get_env("PORT_DATABASE") || "1521"),
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

  # The secret key base is used to sign/encrypt cookies and other secrets.
  # A default value is used in config/dev.exs and config/test.exs but you
  # want to use a different value for prod and you most likely don't want
  # to check this value into version control, so we use an environment
  # variable instead.
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  config :test_deploy, TestDeployWeb.Endpoint,
    http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
      # for details about using IPv6 vs IPv4 and loopback vs public addresses.
      # ip: {0, 0, 0, 0, 0, 0, 0, 1},
      port: String.to_integer(System.get_env("PORT") || "4000")
    ],
    secret_key_base: secret_key_base
    # watchers: [
    #   # Start the esbuild watcher by calling Esbuild.install_and_run(:default, args)
    #   esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
    # ]


  # ## Using releases
  #
  # If you are doing OTP releases, you need to instruct Phoenix
  # to start each relevant endpoint:
  #
  #     config :test_deploy, TestDeployWeb.Endpoint, server: true
  #
  # Then you can assemble a release by calling `mix release`.
  # See `mix help release` for more information.

  # ## Configuring the mailer
  #
  # In production you need to configure the mailer to use a different adapter.
  # Also, you may need to configure the Swoosh API client of your choice if you
  # are not using SMTP. Here is an example of the configuration:
  #
  #     config :test_deploy, TestDeploy.Mailer,
  #       adapter: Swoosh.Adapters.Mailgun,
  #       api_key: System.get_env("MAILGUN_API_KEY"),
  #       domain: System.get_env("MAILGUN_DOMAIN")
  #
  # For this example you need include a HTTP client required by Swoosh API client.
  # Swoosh supports Hackney and Finch out of the box:
  #
  #     config :swoosh, :api_client, Swoosh.ApiClient.Hackney
  #
  # See https://hexdocs.pm/swoosh/Swoosh.html#module-installation for details.

  config :logger, :debug_log,
  path: Path.expand("debug/debug.log"),
  format: "\n$date $time $metadata[$level] $levelpad$message\n",
  level: :debug

config :logger, :error_log,
  path: Path.expand("debug/error.log"),
  format: "\n$date $time $metadata[$level] $levelpad$message\n",
  level: :error

config :logger, :warn_log,
  path: Path.expand("debug/warn.log"),
  format: "\n$date $time $metadata[$level] $levelpad$message\n",
  level: :warn


end
