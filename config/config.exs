# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :navi,
  ecto_repos: [Navi.Repo]

# Configures the endpoint
config :navi, NaviWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yeYpi/Br8PNDtRSn5ssk8utZ9k2SHvVrP8zboSR+K4L9ysvIUlgvWKcvojiwJ4TH",
  render_errors: [view: NaviWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Navi.PubSub,
  live_view: [signing_salt: "gD9sPhha"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :joken, default_signer: "secret"

config :navi, Navi.Plaid,
  client_id: System.get_env("PLAID_CLIENT_ID"),
  secret: System.get_env("PLAID_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
