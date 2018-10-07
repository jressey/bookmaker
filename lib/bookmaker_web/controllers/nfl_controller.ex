defmodule BookmakerWeb.NflController do
  use BookmakerWeb, :controller
  alias Bookmaker.NflDataProcessor, as: NflDataProcessor

  def index(conn, _params) do
    render conn, :index, game_of_week: game_of_the_week()
  end

  def game_of_the_week do
    #TODO: create week_service that chooses week by date
    NflDataProcessor.get_best_game(5)
  end
end
