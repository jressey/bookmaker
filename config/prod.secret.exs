use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :bookmaker, BookmakerWeb.Endpoint,
  secret_key_base: "GgUhvnk4zhMQYD0QeiyBqr3SSmmT6tkYjn00dDvPf6MOmo+dC4LR8XrySjWoPhWL"

# Configure your database
config :bookmaker, Bookmaker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bookmaker_prod",
  pool_size: 15
