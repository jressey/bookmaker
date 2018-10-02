defmodule Bookmaker.Repo.Migrations.CreateConferences do
  use Ecto.Migration

  def change do
    create table(:conferences) do
      add :api_id, :string
      add :name, :string
      add :alias, :string

      timestamps()
    end

  end
end
