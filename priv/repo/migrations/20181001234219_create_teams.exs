defmodule Bookmaker.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :wins, :integer
      add :losses, :integer

      timestamps()
    end

  end
end
