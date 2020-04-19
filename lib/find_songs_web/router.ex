defmodule FindSongsWeb.Router do
  use FindSongsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FindSongsWeb do
    pipe_through :browser

    get "/", HomeController, :index

    get "/authenticate", AuthenticationController, :authenticate
    get "/dashboard", DashboardController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", FindSongsWeb do
  #   pipe_through :api
  # end
end
