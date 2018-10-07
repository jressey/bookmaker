defmodule BookmakerWeb.V1NflController do
  use BookmakerWeb, :controller

  def index(conn, _params) do
    json conn, %{hey: "y'all"}
  end
end
 