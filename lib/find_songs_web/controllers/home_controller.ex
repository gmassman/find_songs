defmodule FindSongsWeb.HomeController do
  use FindSongsWeb, :controller
  plug FindSongsWeb.Plugs.SpotifyAuth

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
