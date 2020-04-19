require IEx

defmodule FindSongsWeb.AuthenticationController do
  use FindSongsWeb, :controller

  def authenticate(conn, params) do
    case Spotify.Authentication.authenticate(conn, params) do
      {:ok, conn } -> redirect conn, to: "/dashboard"
      { :error, _reason, conn }-> redirect conn, to: "/error"
    end
  end
end
