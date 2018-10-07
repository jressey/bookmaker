defmodule Bookmaker.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :scheduled, :naive_datetime
      add :away_team_id, references(:teams, on_delete: :nothing)
      add :home_team_id, references(:teams, on_delete: :nothing)

      timestamps()
    end

    create index(:games, [:away_team_id])
    create index(:games, [:home_team_id])
  end
end
