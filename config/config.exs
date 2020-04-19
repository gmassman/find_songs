# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :find_songs,
  ecto_repos: [FindSongs.Repo]

# Configures the endpoint
config :find_songs, FindSongsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cR0tuZqjbiXWH14Yr6DtaMV3jK7TZgaFjIdvCLhA/9jeYQWIGXDCZX8qlMEk3Xdw",
  render_errors: [view: FindSongsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FindSongs.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "HcxyxsGV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :spotify_ex, client_id: System.get_env("SPOTIFY_CLIENT_ID"),
                    secret_key: System.get_env("SPOTIFY_CLIENT_SECRET"),
                    user_id: System.get_env("SPOTIFY_USER_ID"),
                    scopes: ["user-read-private", "user-read-email", "user-read-playback-state", "user-read-currently-playing", "playlist-read-private", "playlist-read-collaborative", "user-library-read", "user-top-read", "user-read-playback-position", "user-read-recently-played", "user-follow-read"],
                    callback_url: "http://localhost:4000/authenticate"
