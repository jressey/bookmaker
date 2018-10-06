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
    |> seedConferenceDBId
    |> Enum.map(fn conference ->
      get_in(conference, [:divisions])
      |> Enum.map(fn divisions ->
        Map.delete(divisions, :teams)
        |> Map.put(:conference_id, conference[:db_id])
      end)
    end)
    |> List.flatten
  end

  def seedConferenceDBId(conferences) do
    Enum.map(conferences, fn conference ->
      Map.put(conference, :db_id, NflRepository.findConferenceByApiId(conference[:id]))
    end)
  end

  def teams(body) do
    get_in(body, [:conferences, :divisions, :teams])
  end
end
