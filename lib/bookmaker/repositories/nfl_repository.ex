defmodule Bookmaker.NflRepository do
  import Ecto.Query
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
    List.first(Repo.all(from c in "conferences", where: c.api_id == ^api_id, select: c.id))
  end

  def saveDivision(division) do
    Repo.insert(
      Division.changeset(%Division{}, %{
        abbreviation: division[:alias],
        api_id: division[:id],
        name: division[:name],
        conference_id: division[:conference_id]
      })
    )
  end
end

