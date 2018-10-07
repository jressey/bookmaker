defmodule Bookmaker.NflScheduleCoordinator do
  alias Bookmaker.NflHttpService, as: NflHttpService

  def process() do
    NflHttpService.getSchedule()
    |> processGames
  end

  def processGames(body) do
    IO.inspect body
    # for each game
    # get home team id and way team id from repo, insert those values
  end
end
