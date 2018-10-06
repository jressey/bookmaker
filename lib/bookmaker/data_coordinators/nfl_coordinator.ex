defmodule Bookmaker.NflCoordinator do
  alias Bookmaker.NflHttpService, as: NflHttpService
  alias Bookmaker.NflParser, as: NflParser
  alias Bookmaker.NflRepository, as: NflRepository

  def process() do
    body = NflHttpService.getStandings()
    processConferences(body)
  end

  def processConferences(body) do
      NflParser.conferences(body)
      |> Enum.map(fn x ->
        NflRepository.saveConference(x)
      end)
  end
end
