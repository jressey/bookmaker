defmodule Bookmaker.NflScheduleCoordinator do
  alias Bookmaker.NflHttpService, as: NflHttpService
  alias Bookmaker.NflParser, as: NflParser
  alias Bookmaker.NflRepository, as: NflRepository
  alias Bookmaker.NflWeekCalculator, as: NlfRepository

  def process(for_week \\ Timex.now()) do
    NflHttpService.getSchedule(NlfRepository.calculate_week_for_date(for_week))
    |> processGames
  end

  def processGames(body) do
    NflParser.games(body)
    |> Enum.map(fn game ->
      NflRepository.saveGame(game)
    end)
  end
end
