defmodule Bookmaker.NflStructureCoordinator do
  alias Bookmaker.NflHttpService, as: NflHttpService
  alias Bookmaker.NflParser, as: NflParser
  alias Bookmaker.NflRepository, as: NflRepository

  #TODO: set this up on a schedule to reload once a year or something
  def process() do
    body = NflHttpService.getStandings()
    processConferences(body)
    processDivisions(body)
    processTeams(body)
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

  def processTeams(body) do
    NflParser.teams(body)
    |> Enum.map(fn team ->
      NflRepository.saveTeam(team)
    end)
  end
end
