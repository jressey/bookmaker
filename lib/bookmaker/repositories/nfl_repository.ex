defmodule Bookmaker.NflRepository do
  alias Bookmaker.Conference, as: Conference

  def saveConference(conference) do
    Bookmaker.Repo.insert(
      Conference.changeset(%Conference{}, %{
        abbreviation: conference[:alias],
        api_id: conference[:id],
        name: conference[:name]
      })
    )
  end
end
