# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :project_manager_example,
  ecto_repos: [ProjectManagerExample.Repo]

# Configures the endpoint
config :project_manager_example, ProjectManagerExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3ULzKTX4JVhCeWGUNlEOxgqp4tEjV+WQrJVD7CIE4SAZdHttszjbNFkdXlwrpiOE",
  render_errors: [view: ProjectManagerExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProjectManagerExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
