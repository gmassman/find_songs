defmodule FindSongsWeb.Plugs.SpotifyAuth do
  def init(default), do: default

  def call(conn, _default) do
    Phoenix.Controller.redirect conn, external: Spotify.Authorization.url
    # unless Spotify.Authentication.authenticated?(conn) do
    #   Phoenix.Controller.redirect conn, external: Spotify.Authorization.url
    # else
    #   conn
    # end
  end
end
