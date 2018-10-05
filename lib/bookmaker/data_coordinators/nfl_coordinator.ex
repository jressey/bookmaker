defmodule Bookmaker.NflCoordinator do
  alias Bookmaker.NflHttpService, as: NflHttpService
  alias Bookmaker.NflParser, as: NflParser
  # alias Bookmaker.NflRepository, as: NflRepository

  def process() do
    body = NflHttpService.getStandings()
    processConferences(body)
    #fetch the body from the service
    #capture each segment and process to db
      #figure out how to store arrays of maps
  end

  def processConferences(body) do
      IO.puts "here we go"
      NflParser.conferences(body)
      IO.puts "there we went"
    # NflRepository.storeConferences(conferences)
  end
end
