defmodule Bookmaker.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :api_id, :string
      add :name, :string
      add :market, :string
      add :alias, :string
      #sports_radar_id
      add :sr_id, :string
      add :wins, :integer
      add :losses, :integer
      add :ties, :integer
      add :win_pct, :float
      add :points_for, :integer
      add :points_against, :integer
      add :points_rank, :integer
      add :touchdown_diff, :integer
      add :conf_h2h, :integer

      timestamps()
    end

  end
end
