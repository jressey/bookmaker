# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bookmaker,
  ecto_repos: [Bookmaker.Repo]

# Configures the endpoint
config :bookmaker, BookmakerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1Obd1/ad/oBEzZgJ/dzOHCs4ek3lbcsuSNWFLe5Vuvno41Mzv0A5eELOyZ1Wpd/4",
  render_errors: [view: BookmakerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bookmaker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

#ENV VARS
config :bookmaker, Bookmaker.Env.Http.SportRadar,
  root_url: System.get_env("SPORTRADAR_ROOT_URL"),
  auth_key: System.get_env("SPORTRADAR_KEY")
