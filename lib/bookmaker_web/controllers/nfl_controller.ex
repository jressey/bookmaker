defmodule BookmakerWeb.NflController do
  use BookmakerWeb, :controller
  alias Bookmaker.NflDataProcessor, as: NflDataProcessor
  alias Bookmaker.NflWeekCalculator, as: NflWeekCalculator

  def index(conn, _params) do
    render conn, :index, game_of_week: game_of_the_week()
  end

  @spec game_of_the_week() :: any()
  def game_of_the_week do
    NflDataProcessor.get_best_game(NflWeekCalculator.calculate_week_for_date())
  end
end
