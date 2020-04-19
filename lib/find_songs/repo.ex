defmodule FindSongs.Repo do
  use Ecto.Repo,
    otp_app: :find_songs,
    adapter: Ecto.Adapters.Postgres
end
