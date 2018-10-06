defmodule Bookmaker.NflRepository do
  alias Bookmaker.Repo, as: Repo
  alias Bookmaker.Conference, as: Conference
  alias Bookmaker.Division, as: Division

  def saveConference(conference) do
    Repo.insert(
      Conference.changeset(%Conference{}, %{
        abbreviation: conference[:alias],
        api_id: conference[:id],
        name: conference[:name]
      })
    )
  end

  def findConferenceByApiId(api_id) do

  end

  def saveDivision(division) do
    Repo.insert(
      Division.changeset(%Division{}, %{
        abbreviation: division[:alias],
        api_id: division[:id],
        name: division[:name]
      })
    )
  end
end

