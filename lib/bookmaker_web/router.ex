defmodule BookmakerWeb.Router do
  use BookmakerWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BookmakerWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/nfl", NflController, :index)
  end

  scope "/api/v1", BookmakerWeb do
    pipe_through(:api)

    get("/nfl", V1NflController, :index)
  end
end
