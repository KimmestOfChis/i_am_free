# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :i_am_free,
  ecto_repos: [IAmFree.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :i_am_free, IAmFreeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2aeicraNPcWNAImx4Tmel0ZjMwOlIA52utZ+UWAClGM2a6pDCsQxESYx1JBGVZK4",
  render_errors: [view: IAmFreeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: IAmFree.PubSub,
  live_view: [signing_salt: "LpLF7nqe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

config :i_am_free, IAmFree.Repo,
  url: System.get_env("DATABASE_URL"),
  username: System.get_env("POSTGRES_USER"),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: System.get_env("POSTGRES_DB"),
  hostname: "db",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
