defmodule Bookmaker.NflParser do
  alias Bookmaker.NflRepository, as: NflRepository

  def conferences(body) do
    get_in(body, [:conferences])
    |> Enum.map(fn conferences ->
      Map.delete(conferences, :divisions)
    end)
  end

  def divisions(body) do
    get_in(body, [:conferences])
    |> Enum.map(fn conference ->
      Map.put(conference, :db_id, NflRepository.findConferenceByApiId(conference[:api_id][:id]))
    end)
    |> Enum.map(fn conference ->
      get_in(conference, [:divisions])
      |> Enum.map(fn divisions ->
        Map.delete(divisions, :teams)
        |> Map.put(:conference_api_id, conference[:db_id])
      end)
    end)
    |> List.flatten
  end

  def teams(body) do
    get_in(body, [:conferences, :divisions, :teams])
  end
end
