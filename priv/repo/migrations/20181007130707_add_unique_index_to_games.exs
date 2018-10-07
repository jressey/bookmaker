defmodule Bookmaker.Repo.Migrations.AddUniqueIndexToGames do
  use Ecto.Migration

  def change do
    create unique_index(:games, [:away_team_id, :home_team_id, :week], name: :week_team_index)
  end
end
