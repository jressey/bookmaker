defmodule Bookmaker.Repo.Migrations.CreateDivisions do
  use Ecto.Migration

  def change do
    create table(:divisions) do
      add :api_id, :string
      add :name, :string
      add :alias, :string

      timestamps()
    end

  end
end
