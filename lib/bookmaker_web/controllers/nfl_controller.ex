defmodule BookmakerWeb.NflController do
  use BookmakerWeb, :controller
  alias Bookmaker.NflDataProcessor, as: NflDataProcessor

  def index(conn, _params) do
    render conn, :index, game_of_week: game_of_the_week()
  end

  # def index(conn, _params) do
  #   json conn, Map.drop(game_of_the_week(), [:away_games, :home_games, :conference, :division])
  # end

  @spec game_of_the_week() :: any()
  def game_of_the_week do
    #TODO: create week_service that chooses week by date
    NflDataProcessor.get_best_game(5)
  end
end
