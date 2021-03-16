# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :contrxir_api,
  ecto_repos: [ContrxirApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :contrxir_api, ContrxirApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "u+9udshkYpZPb9NqsTQ+Z2ft9NymQTjemq95C15kWr2tKczwHUjhd/B2TXGMoRzk",
  render_errors: [view: ContrxirApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ContrxirApi.PubSub,
  live_view: [signing_salt: "SRO7VAER"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
