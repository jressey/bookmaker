defmodule Bookmaker.NflScheduleCoordinator do
  alias Bookmaker.NflHttpService, as: NflHttpService
  alias Bookmaker.NflParser, as: NflParser
  alias Bookmaker.NflRepository, as: NflRepository

  def process() do
    NflHttpService.getSchedule()
    |> processGames
  end

  def processGames(body) do
    NflParser.games(body)
    |> Enum.map(fn game ->
      NflRepository.saveGame(game)
    end)
  end
end
