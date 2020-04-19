require IEx

defmodule FindSongsWeb.DashboardController do
  use FindSongsWeb, :controller
  alias Spotify.Artist
  @artist_limit 50  # max limit enforced by the Spotify API

  def index(conn, _params) do
    conn
    |> assign_artists
    |> render("index.html")
  end

  defp assign_artists(conn) do
    results =
      conn
      |> fetch_artists(Artist.artists_I_follow_url([limit: @artist_limit]))
      |> sort_by()

    case results do
      {:ok, artists} -> assign(conn, :artists, artists)
      {:error, reason} -> put_flash(conn, :error, reason)
    end
  end

  defp fetch_artists(_conn, nil), do: []
  defp fetch_artists(conn, url) do
    IO.inspect("fetching from url: " <> url)
    case Artist.get_response(conn, url) do
      {:ok, paging} -> paging.items ++ fetch_artists(conn, paging.next)
      error -> error
    end
  end

  defp sort_by(artists, key \\ :popularity)
  defp sort_by(artists, _key) when is_list(artists) do
    {:ok, Enum.shuffle(artists)}
  end
  # defp sort_by(artists, key) when is_list(artists) do
  #   {:ok, Enum.sort_by(artists, &(Map.get(&1, key)), :desc)}
  # end
  defp sort_by(error, _), do: error
end
