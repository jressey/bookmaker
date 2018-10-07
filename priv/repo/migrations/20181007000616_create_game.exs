defmodule Bookmaker.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :away_team_id, :integer
      add :home_team_id, :integer
      add :scheduled, :naive_datetime

      timestamps()
    end
  end
end
