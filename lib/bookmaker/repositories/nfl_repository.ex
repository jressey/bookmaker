#TODO: break in to object level repositories
defmodule Bookmaker.NflRepository do
  import Ecto.Query
  alias Bookmaker.Repo, as: Repo
  alias Bookmaker.Conference, as: Conference
  alias Bookmaker.Division, as: Division
  alias Bookmaker.Team, as: Team
  alias Bookmaker.Game, as: Game

  # general getters
  def games do
    Repo.all from g in Game, preload: [:away_team, :home_team]
  end

  def gamesInWeek(week) do
    Repo.all from g in Game, where: g.week == ^week, preload: [:away_team, :home_team]
  end

  #general setters
  def saveConference(conference) do
    Repo.insert(
      Conference.changeset(%Conference{}, %{
        api_id: conference[:id],
        abbreviation: conference[:alias],
        name: conference[:name]
      })
    )
  end

  def saveDivision(division) do
    Repo.insert(
      Division.changeset(%Division{}, %{
        api_id: division[:id],
        abbreviation: division[:alias],
        name: division[:name],
        conference_id: division[:conference_id]
      })
    )
  end

  def saveTeam(team) do
    Repo.insert(
      Team.changeset(%Team{}, %{
        api_id: team[:id],
        name: team[:name],
        market: team[:market],
        abbreviation: team[:alias],
        wins: team[:wins],
        losses: team[:losses],
        ties: team[:ties],
        win_pct: team[:win_pct],
        points_for: team[:points_for],
        points_against: team[:points_against],
        points_rank: team[:points_rank],
        touchdown_diff: team[:touchdown_diff],
        conf_h2h: team[:conf_h2h],
        conference_id: team[:conference_id],
        division_id: team[:division_id]
      })
    )
  end

  def saveGame(game) do
    Repo.insert(
      Game.changeset(%Game{}, %{
        away_team_id: game[:away_team_id],
        home_team_id: game[:home_team_id],
        scheduled: game[:scheduled],
        week: game[:week]
      })
    )
  end

  # special getters
  def findConferenceIdByApiId(api_id) do
    List.first(Repo.all(from c in "conferences", where: c.api_id == ^api_id, select: c.id))
  end

  def findDivisionIdByApiId(api_id) do
    List.first(Repo.all(from d in "divisions", where: d.api_id == ^api_id, select: d.id))
  end

  def findTeamIdByApiId(api_id) do
    List.first(Repo.all(from t in "teams", where: t.api_id == ^api_id, select: t.id))
  end
end

