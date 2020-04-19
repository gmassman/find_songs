defmodule FindSongsWeb.DashboardView do
  use FindSongsWeb, :view

  def img_url(artist) do
    artist.images
    |> Enum.max_by(fn img -> img["height"] end)
    |> Map.get("url")
  end

  def genre_list(artist) do
    content_tag(:ul) do
      Enum.map(artist.genres, fn genre -> content_tag(:li, genre) end)
    end
  end
end
