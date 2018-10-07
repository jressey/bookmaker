defmodule BookmakerWeb.NflController do
  use BookmakerWeb, :controller

  def index(conn, _params) do
    render conn, :index, game_of_week: game_of_week()
  end

  def game_of_week do
    %{foo: "bar"}
  end
end
