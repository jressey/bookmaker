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
      |> Enum.map(fn division ->
        Map.delete(division, :teams)
        |> Map.put(:conference_id, conference[:db_id])
      end)
    end)
    |> List.flatten
  end

  def teams(body) do
    get_in(body, [:conferences])
    |> seedConferenceDBId
    |> Enum.map(fn conference ->
      get_in(conference, [:divisions])
      |> seedDevisionDBId()
      |> Enum.map(fn division ->
        get_in(division, [:teams])
        |> Enum.map(fn team ->
          Map.merge(team, %{conference_id: conference[:db_id], division_id: division[:db_id]})
        end)
      end)
    end)
    |> List.flatten
  end

  def games(body) do
    get_in(body, [:week, :games])
    |> Enum.map(fn game ->
      Map.merge(game, %{away_team_id: NflRepository.findTeamIdByApiId(game[:away][:id]), home_team_id: NflRepository.findTeamIdByApiId(game[:home][:id]), week: body[:week][:sequence]})
    end)
  end

  def seedConferenceDBId(conferences) do
    Enum.map(conferences, fn conference ->
      Map.put(conference, :db_id, NflRepository.findConferenceIdByApiId(conference[:id]))
    end)
  end

  def seedDevisionDBId(divisions) do
    Enum.map(divisions, fn division ->
      Map.put(division, :db_id, NflRepository.findDivisionIdByApiId(division[:id]))
    end)
  end
end
