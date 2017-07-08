# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :earlybird_extractor,
  ecto_repos: [EarlybirdExtractor.Repo]

# Configures the endpoint
config :earlybird_extractor, EarlybirdExtractor.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "efWwNfmL0o90IJtIY/MJvmh8e159bTpZobrrRfJYdaANvkEt7D4lkejtYIh9TqBp",
  render_errors: [view: EarlybirdExtractor.ErrorView, accepts: ~w(json)],
  pubsub: [name: EarlybirdExtractor.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
