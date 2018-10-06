defmodule Bookmaker.NflCoordinator do
  alias Bookmaker.NflHttpService, as: NflHttpService
  alias Bookmaker.NflParser, as: NflParser
  alias Bookmaker.NflRepository, as: NflRepository

  def process() do
    body = NflHttpService.getStandings()
    # processConferences(body)
    processDivisions(body)
  end

  def processConferences(body) do
      NflParser.conferences(body)
      |> Enum.map(fn conference ->
        NflRepository.saveConference(conference)
      end)
  end

  def processDivisions(body) do
    NflParser.divisions(body)
    |> Enum.map(fn division ->
      NflRepository.saveDivision(division)
    end)
  end
end
