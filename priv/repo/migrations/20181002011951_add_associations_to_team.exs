defmodule Bookmaker.Repo.Migrations.AddAssociationsToTeam do
  use Ecto.Migration

  def change do
    alter table(:teams) do
      add :division_id, references(:divisions)
      add :conference_id, references(:conferences)
    end
  end
end
