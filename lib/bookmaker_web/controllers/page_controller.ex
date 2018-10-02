defmodule BookmakerWeb.PageController do
  use BookmakerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
