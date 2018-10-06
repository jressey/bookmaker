defmodule Bookmaker.Repo.Migrations.AddApiIdIndexes do
  use Ecto.Migration

  def change do
    create unique_index(:conferences, [:api_id])
    create unique_index(:divisions, [:api_id])
    create unique_index(:teams, [:api_id])
  end
end
