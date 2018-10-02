defmodule Bookmaker.Repo.Migrations.AddAssociationsToDivision do
  use Ecto.Migration

  def change do
    alter table(:divisions) do
      add :conference_id, references(:conferences)
    end
  end
end
